#!/bin/bash

# This function get memory, convert the memory to MB from GB and pause for 3 seconds.
get_memory(){
    memory=$(awk 'memory$3=="kB"{$2=$2/1024;$3="MB"} 1' /proc/meminfo | grep "MemTotal" | awk '{print $2 " " $3}')
    echo "Fetching total memory..."
    sleep 1s
    echo "Total memory: $memory"
    echo -e "\n"
    sleep 3s
}

# This function get disk space, convert the disk space to MB from GB and pause for 3 seconds.
get_disk_space(){
    echo "Fetching disk space..."
    sleep 1s
    df -l -BG --output=source,size
    echo -e "\n"
    sleep 3s
}

# This function get disk space with format of ext4 only and display the source and used percent
get_ext4(){
    echo "Fetching disk space with format of ext4 only..."
    sleep 1s
    df -lh -t ext4 --output=source,pcent
    echo -e "\n"
    sleep 1m
}

while true
do
    get_memory
    get_disk_space
    get_ext4
done