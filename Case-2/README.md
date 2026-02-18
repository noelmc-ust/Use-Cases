
# Log Backup & Cleanup Script

##  Scenario

Application log files grow over time and need to be archived to save disk space. Only older logs need to be backed up. Old backup archives must also be cleaned up automatically otheriwse it will get crowded in the system.


##  Approach

1. Identify `.log` files older than 7 days using `find`and backup those.
2. Create a timestamped `.tar.gz` archive using `tar`and save it in the backup directory.
3. Remove backup archives older than 30 days by searching for them by looking for files with .tar.gz     extension.

## 🧩 Backup Script

```bash
#!/bin/bash

LOG_DIR="/var/log/myapp"        
BACKUP_DIR="/backup"           

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/logs_${TIMESTAMP}.tar.gz"

# Backup only .log files older than 7 days
find "$LOG_DIR" -name "*.log" -type f -mtime +7 -print | tar -czf "$BACKUP_FILE" -T -

# Delete backups older than 30 days
find "$BACKUP_DIR" -type f -name "logs_*.tar.gz" -mtime +30 -exec rm -f {} \;
```

