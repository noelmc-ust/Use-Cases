#!/bin/bash

LOG_DIR="/var/log/myapp"        
BACKUP_DIR="/backup"           

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/logs_${TIMESTAMP}.tar.gz"


find "$LOG_DIR" -name "*.log" -type f -mtime +7 -print | tar -czf "$BACKUP_FILE" -T -


find "$BACKUP_DIR" -type f -name "logs_*.tar.gz" -mtime +30 -exec rm -f {} \;