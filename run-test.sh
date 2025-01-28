#!/bin/sh -e
export APP_TOKEN=fJrh7xJieyR45puNYy3OqXNFulLO0DgpBK10oUHK
export USER_API_TOKEN=LoU4vhqZ2pRZRyoNe8PpxyTDxkPzBVh6JD4rx6zy
if [ "$1" = "shell" ] ; then
  SCRIPT="import os;from glpilib2 import *;handler = RequestHandler('http://localhost:8000',os.environ['APP_TOKEN'],os.environ['USER_API_TOKEN'],)"
  TEMPFILE="$(mktemp)"
  printf "$SCRIPT" > "$TEMPFILE"
  python -i "$TEMPFILE"
else
  pytest $@
fi
