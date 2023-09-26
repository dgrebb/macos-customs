#!/bin/bash
# install vscode extensions from exported list
# https://github.com/microsoft/vscode/issues/42994

# NOTE: the below will ignore commented lines in the list
cat extensions.list | grep -v '^#' | xargs -L1 code --install-extension
