#!/bin/bash

echo "***  check_and_remount script***"
echo ""
echo "[***] Script started at $(date)"

# Iterate through mount points listed in /etc/fstab
awk 'NF && $1 !~ /^#/ {print $2}' /etc/fstab | while read mount_point; do
    # Check if the mount point is mounted
    if ! mountpoint -q "$mount_point"; then
        echo "[WARN] $(date) - $mount_point is not mounted. Attempting to remount..."

        # Try to mount it again
        timeout 10 mount "$mount_point"

        # Check if the mount was successful
        if mountpoint -q "$mount_point"; then
            echo "[INFO] $(date) - $mount_point successfully remounted."
        else
            echo "[ERROR] $(date) - Failed to remount $mount_point."
        fi
    else
        echo "[INFO] $(date) - $mount_point is already mounted."
    fi

    # Optional sleep to prevent overwhelming the system with many mount checks
    sleep 1
done

echo "[***] Script completed at $(date)"
echo "--------------------------------------------------------------------------------"
