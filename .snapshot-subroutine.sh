#!/bin/bash
BRANCH=backup
UPSTREAM=origin
DATE=$(date +%F)
export GIT_INDEX_FILE=/tmp/git-backup-index.$$
git add .
git commit-tree $(git write-tree) -p $(git show-ref --hash --heads $BRANCH) -m "Automatic backup ${DATE}" | xargs git branch -f $BRANCH
rm -f "$GIT_INDEX_FILE"
git push $UPSTREAM $BRANCH
