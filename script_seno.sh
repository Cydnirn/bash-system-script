#!/bin/bash

# This function get memory, convert the memory to MB from GB and pause for 3 seconds.
get_memory(){
    memory=$(free --mega | grep "Mem" | awk '{print $2 "MB"}')
    echo "Fetching total memory..."
    echo "Total memory: $memory"
    echo -e "\n"
    sleep 3s
}

# This function get disk space, convert the disk space to MB from GB and pause for 3 seconds.
get_disk_space(){
    echo "Fetching disk space..."
    df -l -BG --output=source,size
    echo -e "\n"
    sleep 3s
}

# This function get disk space with format of ext4 only and display the source and used percent and omit tmpfs
get_ext4(){
    echo "Fetching disk space with format of ext4 only..."
    df -lh -t ext4 -x tmpfs --output=source,pcent
    echo -e "\n"
    sleep 1m
}

while true
do
    get_memory
    get_disk_space
    get_ext4
done