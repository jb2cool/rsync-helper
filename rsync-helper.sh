#!/bin/bash
# Script for guiding user through file/folder replication between servers using RSYNC

######################################################

# Set variables
read -p "What is your username?: [$USER]  " USERNAME
USERNAME=${USERNAME:-$USER}
read -p "What is the name of the remote server you want to pull data from?: [server-123]  " SERVERNAME
SERVERNAME=${SERVERNAME:-server-123}
read -p "What directory do you want to pull?: [workdir]  " SYNCTARGET
SYNCTARGET=${SYNCTARGET:-workdir}

######################################################

clear

PS3='Please enter your choice: '
options=("Pull $SYNCTARGET from $SERVERNAME to $(pwd)" "Rerun to choose more items to sync" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Pull $SYNCTARGET from $SERVERNAME to $(pwd)")
            echo "Pulling $SYNCTARGET from $SERVERNAME to $(pwd)"
            rsync -rlxhPitc $USERNAME@$SERVERNAME:~/$SYNCTARGET .
            ;;
        "Rerun to choose more items to sync")
            rsync-helper
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
