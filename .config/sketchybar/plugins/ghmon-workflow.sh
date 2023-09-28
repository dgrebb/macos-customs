#!/bin/bash

# Monitor GitHub Workflow by ID
update() {
  source "$CONFIG_DIR/colors.sh"
  REPOSITORY="dgrebb/dgrebb.com"
  WORKFLOW_ID=67874244
  LIST_LIMIT=5
  STATUS=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json status --jq '.[0].status')
  CONCLUSION=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit 1 --json conclusion --jq '.[0].conclusion')
  LIST=$(gh run list --repo $REPOSITORY --workflow $WORKFLOW_ID --limit $LIST_LIMIT --json status,conclusion,displayTitle,headBranch,url)

  COLOR=$BLUE
  ICON=⏺
  LABEL=""
  BACKGROUND=""

  # queued, in_progress, completed,
  case "${STATUS}" in
  "queued")
    COLOR=$GREY
    ICON=⏺
    ;;
  "in_progress")
    COLOR=$YELLOW
    ICON=⏺
    BACKGROUND="$CONFIG_DIR/../static/rocket.png"
    LCOLOR=$YELLOW
    LABEL=🚀
    ;;
  "completed")
    COLOR=$GREEN
    ICON=⏺
    ;;
  *)
    COLOR=$BLUE
    ICON=⏺
    ;;
  esac

  # queued, in_progress, completed,
  case "${CONCLUSION}" in
  "success")
    LCOLOR=$GREEN
    LABEL=✓
    break
    ;;
  "canceled")
    LCOLOR=$GREY
    LABEL=⚠
    break
    ;;
  "failed")
    LCOLOR=$RED
    LABEL=⊘
    break
    ;;
  esac

  echo "updating github workflow status $STATUS $COLOR $ICON $CONCLUSION"
  sketchybar --set github.status icon="$ICON" icon.color="$COLOR" label="$LABEL" label.color="$LCOLOR"
}

case "$SENDER" in
"routine" | "forced")
  update
  ;;
# "mouse.entered")
#   popup on
#   ;;
# "mouse.exited" | "mouse.exited.global")
#   popup off
#   ;;
# "mouse.clicked")
#   popup toggle
#   ;;
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
