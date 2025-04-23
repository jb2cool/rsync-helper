#!/bin/bash
# Script for guiding user through file/folder replication between servers using RSYNC
# This goes via an intermediate server set on line 27, change INTERMEDIATE-SERVER to the hostname of your SSH server

######################################################

# Set variables
read -p "What is your username?: [$USER]  " USERNAME
USERNAME=${USERNAME:-$USER}
read -p "What is the name of the remote server you want to pull data from?: [server-123]  " SERVERNAME
SERVERNAME=${SERVERNAME:-server-123}
read -p "What directory do you want to pull?: [workdir]  " SYNCTARGET
SYNCTARGET=${SYNCTARGET:-workdir}
read -p "What intermediate SSH server do you want to go through?: [ssh-server]  " INTERMEDIATE
INTERMEDIATE=${INTERMEDIATE:-ssh-server}

######################################################

clear

PS3='Please enter your choice: '
options=("Pull $SYNCTARGET from $SERVERNAME to $(pwd)" "Rerun to choose more items to sync" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Pull $SYNCTARGET from $SERVERNAME to $(pwd)")
            echo "Pulling $SYNCTARGET from $SERVERNAME to $(pwd)"
            rsync -rlxhPitc -e 'ssh -o "ProxyCommand ssh -A INTERMEDIATE-SERVER -W %h:%p"' $USERNAME@$SERVERNAME:~/$SYNCTARGET .
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
