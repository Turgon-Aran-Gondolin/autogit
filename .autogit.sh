#!/bin/bash

# - Copy all the files in the repository to the root directory of the target repository. 
# - First change the branch and upstream names in the subroutine file, then add the contents in the .gitignore example to the actual .gitignore file. 
# - Create the backup branch as what's defined in the script. 
# - Config vscode tasks to automatically run the script. 
# - Default backup interval is one day (after initial execution). 

while true
do
    echo 'backup start'
    ./.snapshot-subroutine.sh
    echo 'backup created'
    sleep 86400
done
