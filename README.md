# rsync-helper
Wrapper script for RSync to make it a bit easier to use. Designed to fetch files from a remote machine and copy them to the machine running the script.

I have two scripts, one makes a direct connection to the source to pull data from and the other goes via an SSH intermediary 'bastion' where there is no direct route.
