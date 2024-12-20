#!/usr/bin/bash

if [ -z "$1" ]; then
  $BACKUP=backup
else
  $BACKUP=$1
fi

wget https://github.com/Turgon-Aran-Gondolin/autogit/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
mv autogit-master/* ./
rm autogit-master -r

sed -i "s/^BRANCH=.*$/BRANCH=$BACKUP/" .snapshot-subroutine.sh
git branch $BACKUP master

cat .gitignore.example >> .gitignore
# cat tasks.json.example >> .vscode/tasks.json
jq -s '.[0] * {"tasks": (.[0].tasks + .[1].tasks | unique_by(.label))}' tasks.example.json .vscode/tasks.json > .vscode/tasks.json

