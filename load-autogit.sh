#!/usr/bin/bash

$BACKUP=backup

wget https://github.com/Turgon-Aran-Gondolin/autogit/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
mv autogit-master/.* ./
cat .gitignore.example >> .gitignore
cat tasks.json.example >> .vscode/tasks.json
git branch $BACKUP master
