# rsync-helper
Wrapper script for RSync to make it a bit easier to use. Designed to fetch files from a remote machine and copy them to the machine running the script.

I have two scripts:
- **rsync-helper.sh** makes a direct connection to the source server.
- **rsync-helper-via-SSH-intermediary.sh** makes a connection to the source server but via an SSH intermediary 'bastion', this is useful where there is no direct route available due to network segregation.
