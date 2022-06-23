#! /usr/bin/env bash

set -euxo pipefail

: "${AUTOCAD_PATH:?AUTOCAD_PATH env var must be provided, absolute path to the AutoCAD executable}"

FILENAME=$1
OTHER_REF=$2

function wrap_path () {
  if which wslpath; then
    echo "$(wslpath -w "$1")"
  else
    echo "$1"
  fi
}

OTHER_PATH=$(mktemp --suffix .dwg)
git show "$OTHER_REF:$FILENAME" > "$OTHER_PATH"

COMPARE_SCRIPT_PATH=$(mktemp --suffix .scr)
echo "-COMPARE $(wrap_path $OTHER_PATH)" > "$COMPARE_SCRIPT_PATH"

"$AUTOCAD_PATH" \
  -nologo \
  -b $(wrap_path "$COMPARE_SCRIPT_PATH") \
  "$(wrap_path "$FILENAME")"
