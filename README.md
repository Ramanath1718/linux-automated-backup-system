# Linux Automated Backup System

A Linux administration project that automates file backups using Bash scripting, TAR/GZIP compression, systemd timers, logging, and backup retention.

## Overview

This project demonstrates how to automate backups of sample data on a Linux system. It creates compressed archives, records backup activity in a log file, and removes older backup archives according to a retention policy.

## Features

- Automated file backups using Bash.
- TAR/GZIP archive compression.
- Backup success and failure logging.
- Daily scheduling using a systemd service and timer.
- Persistent timer configuration to trigger missed scheduled runs after the system becomes available again.
- Seven-day backup retention policy.
- Manual backup restoration and testing.

## Project Structure

```text
linux-automated-backup-system/
├── data/
│   ├── company-report.txt
│   ├── admin-notes.txt
│   └── configs/
│       └── app.conf
├── logs/
├── scripts/
│   └── backup.sh
├── .gitignore
└── README.md
```

## Requirements

- Linux distribution using systemd.
- Bash.
- TAR and GZIP.
- Git (optional, for version control).

## Setup

Clone the repository:

```bash
git clone https://github.com/YOUR-GITHUB-USERNAME/linux-automated-backup-system.git
cd linux-automated-backup-system
```

Replace `YOUR-GITHUB-USERNAME` with your GitHub username.

Review `scripts/backup.sh` before running it. Update paths and configuration as needed for your system.

## Scheduling

The project uses a systemd service and timer to schedule backups daily at 1:00 PM.

The timer uses `Persistent=true` to request a run after the system becomes available if a scheduled activation was missed while it was inactive.

**Note:** The Linux VM must be running for the backup to execute. A persistent timer cannot run while the VM is powered off.

## Backup Retention

The script includes a retention policy intended to remove backup archives older than seven days.

Always test retention commands without deletion first. Confirm the target directory and archive pattern before enabling automatic deletion.

## Restoration

To inspect a compressed archive:

```bash
tar -tzf /path/to/backup.tar.gz
```

To extract an archive into a test directory:

```bash
mkdir -p ~/restore-test
tar -xzf /path/to/backup.tar.gz -C ~/restore-test
```

Verify the restored files before relying on a backup.

## Testing

The project was tested in an Xubuntu virtual machine. Manual backup creation, archive inspection, restoration, logging, and systemd service execution were checked.

## Learning Outcomes

- Bash scripting and exit-status handling.
- Linux file and directory management.
- TAR/GZIP compression and restoration.
- Log management.
- systemd services and timers.
- Automated backup retention.
- Git and GitHub fundamentals.

## Limitations

- Backups are stored locally and may share the same underlying disk as the source files.
- This project uses sample data for learning and demonstration.
- Production use would require additional safeguards, monitoring, and ideally an independent backup destination.

## Author

Created as a hands-on Linux administration learning project.
