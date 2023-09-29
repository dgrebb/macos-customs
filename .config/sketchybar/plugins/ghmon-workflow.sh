#!/bin/bash

# Monitor GitHub Workflow by ID
update() {
  # Settings
  source "$CONFIG_DIR/colors.sh"
  REPOSITORY="dgrebb/dgrebb.com" # The repository to monitor
  WORKFLOW_ID=67874244           # The workflow to monitor
  LIST_LIMIT=5                   # How many runs you want in the popup
  TIMEZONE="America/New_York"    # Replace with your desired timezone

  STATUS=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json status --jq '.[0].status')
  CONCLUSION=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json conclusion --jq '.[0].conclusion')
  LIST=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit $LIST_LIMIT --json status,conclusion,startedAt,updatedAt,displayTitle,headBranch,url)

  COLOR=$BLUE
  ICON=
  LABEL=""
  COUNTER=0

  # queued, in_progress, completed,
  case "${STATUS}" in
  "queued")
    COLOR=$RED
    ICON=󱤳
    BACKGROUND_1=0xff870000
    BACKGROUND_2=$RED
    ;;
  "in_progress")
    COLOR=$YELLOW
    ICON=󱓞
    LCOLOR=$YELLOW
    LABEL=󰦖
    BACKGROUND_1=0xff606800
    BACKGROUND_2=$YELLOW
    ;;
  "completed")
    COLOR=$WHITE
    ICON=
    ;;
  *)
    COLOR=$BLUE
    ICON=
    ;;
  esac

  # queued, in_progress, completed,
  case "${CONCLUSION}" in
  "success")
    LCOLOR=$GREEN
    LABEL=✓
    ;;
  "cancelled")
    LCOLOR=$YELLOW
    LABEL=⚠
    ;;
  "failed")
    LCOLOR=$RED
    LABEL=⊘
    ;;
  esac

  args+=(--remove '/github.run\.*/')
  while read -r url status conclusion start end branch title; do
    TITLE="$(echo "$title" | sed -e "s/^'//" -e "s/'$//")"
    URL="$(echo -e "${url}")"
    COUNTER=$((COUNTER + 1))
    RUNICON=󰦖
    ICOLOR=$YELLOW

    # Convert the workflow run date/time to the desired timezone using Python
    # The BSD `date` function in macos is garbage — YMMV; here be dragons
    RUN_END_TIME=$(TZ="$TIMEZONE" python -c "from dateutil import tz, parser; import sys; dt = parser.parse($end); local_dt = dt.astimezone(tz.tzlocal()); sys.stdout.write(local_dt.strftime('%y.%m.%d - %H:%M:%S'))")

    case "${conclusion}" in
    "'success'")
      ICOLOR=$GREEN
      RUNICON=✓
      ;;
    "'cancelled'")
      ICOLOR=$YELLOW
      RUNICON=⚠
      ;;
    "'failed'")
      ICOLOR=$RED
      RUNICON=⊘
      ;;
    esac

    run=(
      label="$TITLE | $RUN_END_TIME"
      icon=$RUNICON
      icon.padding_left=10
      label.padding_right=10
      icon.color="$ICOLOR"
      position=popup.github.status
      icon.background.color=$BACKGROUND2
      drawing=on
      click_script="open $URL; sketchybar --set github.status popup.drawing=off"
    )

    args+=(--clone github.run.$COUNTER github.template
      --set github.run.$COUNTER "${run[@]}")

  done <<<"$(echo $LIST | jq -r '.[] | [.url, .status, .conclusion, .startedAt, .updatedAt, .headBranch, .displayTitle] | @sh')"

  sketchybar -m "${args[@]}" >/dev/null

  sketchybar --set github.status icon="$ICON" icon.color="$COLOR" label="$LABEL" label.color="$LCOLOR" \
    --set ghmon background.color=$BACKGROUND_1 background.border_color=$BACKGROUND_2
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
