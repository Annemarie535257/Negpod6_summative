#!/bin/bash

# Local directory to be backed up
local_dir="/root/Negpod6_summative/negpod_6-q1"

# Remote server SSH details
remote_user="2f05c1f8800b"           # Remote server username
remote_host="2f05c1f8800b.3be8ebfc.alu-cod.online"  # Remote server hostname or IP address
remote_password="d4a1d225d0abda9549d8"
remote_path="/summative/0923-2023S"  # Path to the backup directory on the remote server
error_file=$(mktemp) 

# SCP command to copy files to the remote server
 scp -r $local_dir $remote_user@$remote_host:$remote_path 2> "$error_file"

# Check if the SCP operation was successful
if [ $? -eq 0 ]; then 
	echo "Backup completed successfully." 
else 
	echo "Backup failed." 
	cat "$error_file"
fi
rm "$error_file"
