#!/bin/sh

if [x$# -ne 2]; then
    echo "Provide file to add and commit message"
    exit 1
fi

git add "$1"
git commit -m "$2"

exit 0
