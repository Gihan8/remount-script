**check_and_remount Script**

**Overview**

The check_and_remount.sh script is a Bash script designed to check the status of mount points listed in /etc/fstab and attempt to remount them if they are not currently mounted. This ensures that critical file systems remain accessible, improving system reliability and reducing downtime due to unmounted storage.

**Features**

Checks each mount point defined in /etc/fstab.

Attempts to remount any unmounted file systems.

Provides real-time logs indicating mount status.

Implements a timeout for remount attempts to avoid system hangs.

Logs timestamps for troubleshooting and audit purposes.

**Prerequisites**

Before running the script, ensure:

You have root or sudo privileges to mount file systems.

The file /etc/fstab is correctly configured with valid mount points.

The mountpoint, awk, and timeout commands are available on the system.

**Usage**

Clone the repository or copy the script to your local machine.

Grant execution permissions:

chmod +x check_and_remount.sh

Run the script:

sudo ./check_and_remount.sh

**Script Breakdown**

Reads mount points from /etc/fstab, ignoring comments and empty lines.

Iterates through each mount point and checks if it is currently mounted.

If a mount point is missing, it attempts to remount it using the mount command with a 10-second timeout.

Logs success, failure, or already mounted status.

**Example Output**

***  check_and_remount script***

[***] Script started at Sun Mar 9 12:00:00 UTC 2025
[INFO] Sun Mar 9 12:00:01 UTC 2025 - /mnt/data is already mounted.
[WARN] Sun Mar 9 12:00:02 UTC 2025 - /mnt/backup is not mounted. Attempting to remount...
[INFO] Sun Mar 9 12:00:03 UTC 2025 - /mnt/backup successfully remounted.
[ERROR] Sun Mar 9 12:00:04 UTC 2025 - Failed to remount /mnt/logs.
[***] Script completed at Sun Mar 9 12:00:05 UTC 2025
--------------------------------------------------------------------------------

**Automation**

To schedule periodic checks, add a cron job:

sudo crontab -e

Add the following line to check every hour:

0 * * * * /path/to/check_and_remount.sh >> /var/log/check_and_remount.log 2>&1

**License**

This script is released under the MIT License. See LICENSE for details.

**Contributions**

Contributions are welcome! Feel free to open issues or submit pull requests.

**Author**

Gihan De Silva
