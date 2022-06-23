#! /usr/bin/env bash

set -euxo pipefail

FILENAME=$1
OTHER_REF=$2

OTHER_PATH=$(mktemp).dwg
echo "$OTHER_PATH"
git show "$OTHER_REF:$FILENAME" > "$OTHER_PATH"

COMPARE_SCRIPT_PATH=$(mktemp).scr
echo "-COMPARE $OTHER_PATH" > "$COMPARE_SCRIPT_PATH"

"/Applications/Autodesk/AutoCAD 2023/AutoCAD 2023.app/Contents/MacOS/AutoCAD" \
  -nologo \
  -b "$COMPARE_SCRIPT_PATH" \
  "$FILENAME"
