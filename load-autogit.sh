#!/usr/bin/bash

if [ -z "$1" ]; then
  BACKUP=backup
else
  BACKUP=$1
fi
# echo $BACKUP

wget https://github.com/Turgon-Aran-Gondolin/autogit/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
rm autogit-master/load-autogit.sh
mv autogit-master/* ./
mv autogit-master/.* ./
rm autogit-master -r

sed -i "s/^BRANCH=.*$/BRANCH=$BACKUP/" .snapshot-subroutine.sh
git branch $BACKUP master

cat .gitignore.example >> .gitignore
# cat tasks.json.example >> .vscode/tasks.json
jq -s 'map(select(.tasks != null) | .tasks) | add | unique_by(.label) | {version: "2.0.0", tasks: .}' tasks.example.json .vscode/tasks.json > .vscode/tasks.json

