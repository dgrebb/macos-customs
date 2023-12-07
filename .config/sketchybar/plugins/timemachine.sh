#!/bin/bash

running=$(ps ax | grep "/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper" | grep -v 'grep')

echo $running
