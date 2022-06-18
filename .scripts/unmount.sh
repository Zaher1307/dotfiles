#!/bin/sh 

# Unmount all devices mounted in the system
# Runs at shutdown

systemDevice=a
devices=$(ls /dev/sd[!$systemDevice])
success=0
faild=0

for dev in $devices; do
    parts=$(mount | grep $dev | cut -d ' ' -f 1)
    partsNum=$(mount | grep $dev | cut -d ' ' -f 1 | wc -l)
    [[ $parts ]] && sudo umount $(echo $parts) 2>> ~/.mount_log
    if [[ $? -eq 0 ]]; then 
        logger "$(echo $parts) device(s) unmounted successfully" 
        success=$(($success+$partsNum))
    else
        faild=$(($faild+$partsNum))
    fi
done

[[ -f ~/.mount_log ]] && cat ~/.mount_log | logger && rm ~/.mount_log
logger "$success device(s)/partition(s) unmounted successfully, and $faild device(s)/partition(s) faild"
