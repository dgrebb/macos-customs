#!/bin/bash
source "$HOME/.config/machine.sh"

if [[ "$MACHINE" == 'work' ]]; then
  PATH+=:/usr/local/opt/python/libexec/bin/
else
  PATH+=:/opt/homebrew/anaconda3/bin/
fi

# Monitor GitHub Workflow by ID
update() {
  # Settings
  source "$CONFIG_DIR/colors.sh"
  REPOSITORY="dgrebb/dgrebb.com" # The repository to monitor
  WORKFLOW_ID=67874244           # The workflow to monitor
  LIST_LIMIT=5                   # How many runs you want in the popup
  TIMEZONE="America/New_York"    # Replace with your desired timezone
  # More here: https://github.com/FelixKratz/SketchyBar/issues/378
  # You could also `source ~/.zshrc` or `source ~/.bash_profile`, etc if python is defined in your path

  STATUS=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json status --jq '.[0].status')
  CONCLUSION=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json conclusion --jq '.[0].conclusion')
  LIST=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit $LIST_LIMIT --json status,conclusion,startedAt,updatedAt,displayTitle,headBranch,url)

  # Nerd Font icons for icon/label states
  HOURGLASS_ICON=
  OCTOCAT_ICON=
  QUEUED_ICON=󱖒
  PROGRESS_ICON=󰔚
  ROCKET_ICON=󱓞
  SKULL_ICON=󰯆
  SUCCESS_ICON=✓
  CANCELLED_ICON=⚠
  FAILURE_ICON=󰜺

  # dark colors
  DARK_RED=0xff870000
  DARK_YELLOW=0xff606800

  # initial loading state
  ICON=$OCTOCAT_ICON
  COLOR=$BLUE
  LABEL=$HOURGLASS_ICON
  LCOLOR=$BLUE
  COUNTER=0

  # queued, in_progress, completed states
  case "${STATUS}" in
  "queued")
    COLOR=$WHITE
    LABEL=$QUEUED_ICON
    LCOLOR=$GREY
    BACKGROUND_1=$BLUE
    BACKGROUND_2=$GREY
    ;;
  "in_progress")
    COLOR=$WHITE
    LABEL=$ROCKET_ICON
    LCOLOR=$YELLOW
    BACKGROUND_1=$DARK_YELLOW
    BACKGROUND_2=$YELLOW
    ;;
  "waiting")
    COLOR=$RED
    LABEL=$SKULL_ICON
    LCOLOR=$WHITE
    BACKGROUND_1=$DARK_RED
    BACKGROUND_2=$RED
    ;;
  "completed")
    COLOR=$WHITE
    # Labels for completed state are set by `conclusion`, below
    ;;
  *)
    COLOR=$BLUE
    ;;
  esac

  # Workflow Conclusion State
  case "${CONCLUSION}" in
  "success")
    LCOLOR=$GREEN
    LABEL=$SUCCESS_ICON
    ;;
  "cancelled")
    LCOLOR=$GREY
    LABEL=$CANCELLED_ICON
    ;;
  "failure")
    LCOLOR=$RED
    LABEL=$FAILURE_ICON
    ;;
  esac

  args+=(--remove '/github.run\.*/' --remove gh.spacer_bottom)
  while read -r url status conclusion start end branch title; do
    TITLE="$(echo "$title" | sed -e "s/^'//" -e "s/'$//")"
    URL="$(echo -e "${url}")"
    COUNTER=$((COUNTER + 1))
    RUN_ICON=$PROGRESS_ICON
    RUN_COLOR=$YELLOW

    # Convert the workflow run date/time to the desired timezone using Python
    # The BSD `date` function in macos is garbage — YMMV; here be dragons
    RUN_END_TIME=$(TZ="$TIMEZONE" python -c "from dateutil import tz, parser; import sys; dt = parser.parse($end); local_dt = dt.astimezone(tz.tzlocal()); sys.stdout.write(local_dt.strftime('%y.%m.%d - %H:%M:%S'))")

    case "${conclusion}" in
    "'success'")
      RUN_COLOR=$GREEN
      RUN_ICON=$SUCCESS_ICON
      ;;
    "'cancelled'")
      RUN_COLOR=$GREY
      RUN_ICON=$CANCELLED_ICON
      ;;
    "'failure'")
      RUN_COLOR=$RED
      RUN_ICON=$FAILURE_ICON
      ;;
    esac

    run=(
      label="$TITLE | $RUN_END_TIME"
      icon=$RUN_ICON
      icon.color="$RUN_COLOR"
      position=popup.github.status
      drawing=on
      click_script="open $URL; sketchybar --set github.status popup.drawing=off"
    )

    args+=(--clone github.run.$COUNTER github.template
      --set github.run.$COUNTER "${run[@]}")

  done <<<"$(echo $LIST | jq -r '.[] | [.url, .status, .conclusion, .startedAt, .updatedAt, .headBranch, .displayTitle] | @sh')"
  # NOTE: the evaluation order of these property values is important - `displayTitle` can have breaking-characters, so it goes last

  args+=(--add item gh.spacer_bottom popup.github.status
    --set gh.spacer_bottom "${gh_spacer[@]}" background.height=5)

  sketchybar -m "${args[@]}" >/dev/null

  sketchybar --set github.status icon="$ICON" icon.color="$COLOR" label="$LABEL" label.color="$LCOLOR" \
    --set ghmon background.color=$BACKGROUND_1 background.border_color=$BACKGROUND_2

  # sketchybar -m --add item gh.spacer_bottom popup.github.status \
  #   --set gh.spacer_bottom "${gh_spacer[@]}"

}

popup() {
  sketchybar --set $NAME popup.drawing=$1
}

case "$SENDER" in
"routine" | "forced")
  update
  ;;
"mouse.entered")
  popup on
  ;;
"mouse.exited" | "mouse.exited.global")
  popup off
  ;;
"mouse.clicked")
  popup toggle
  ;;
esac

# for i in {1..100}; do
#   echo -n "This is a test in loop $i "
#   echo
#   echo $STATUS
#   echo
#   echo -e "$LIST"
#   echo
#   date
#   echo
#   sleep 5
# done

# status        conclusion    displayTitle                                                                                                                workflowName                      headBranch                               event             databaseId
# completed	    success	      🚜 STG - Build, Deploy, and Test - PR #702: fix(front): adds background color to privacy, post pages; reduce marg…        🚜 Build, Deploy, and Test	      feature/695-privacy-page-bg-color	        pull_request	    6331506829	    5m39s	    1h
# completed	success	🚜 STG - Build, Deploy, and Test - latest develop	🚜 Build, Deploy, and Test	develop	push	63143764386m58s	1d
# completed	success	🚜 STG - Build, Deploy, and Test - PR #698: feat(front): disables all page transitions via	🚜 Build, Deploy, and Test	feature/659-reduced-motion-transition-disable	pull_request	6314136759	6m59s	1d
# completed	success	🚜 STG - Build, Deploy, and Test - latest develop	🚜 Build, Deploy, and Test	develop	push	63136896045m21s	1d
# completed	success	🚜 STG - Build, Deploy, and Test - PR #697: chore(front): updates and patches frontend dependencies	🚜 Build, Deploy, and Test	feature/680-frontend-npm-updates	pull_request	6313597796	5m52s	1d
