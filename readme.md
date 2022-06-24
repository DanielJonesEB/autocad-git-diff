# autocad-git-diff

Hacky script to open AutoCAD, diffing a file at HEAD of Git, and from a specific revision.

## Pre-requisites

* Needs GNU `mktemp`, which on MacOS you can install via `brew install coreutils`, making sure to give it precedence in `$PATH` as suggested upon installation
