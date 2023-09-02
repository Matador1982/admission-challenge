#!/bin/bash

# Check the number of arguments
if [ "$#" -lt 2 ]; then
    echo "incorrect input please use next  : $0 file1 [file2 ...] destination_path"
    exit 1
fi

# Get the last argument (destination path)
dest_path="${!#}"

# Determine the current server's hostname
current_server=$(hostname)

# Check if the current server is server2
if [ "$current_server" == "server2" ]; then
    remote_server="server1" # Set remote server to server1
else
    remote_server="server2" # Set remote server to server2
fi

# Loop through all arguments except the last one to copy and save the size of copied file
for ((i = 1; i < $#; i++)); do
    file="${!i}" # Get the current argument

    # Use sftp to copy files to the remote server
    sftp -o StrictHostKeyChecking=no "vagrant@$remote_server:$dest_path" <<< $"put $file"
    file_size_bytes=$((file_size_bytes + $(stat -c "%s" "${!i}")))
done

# Calculate the total size of copied files and print it

echo "$file_size_bytes"
