
# Disk Usage Alert Script – Simple Threshold Checker

This project contains a minimal Bash script that checks the disk usage of the root (`/`) filesystem and prints an alert when the usage exceeds a defined threshold. It is ideal for lightweight monitoring on production or development servers.

---

##  Scenario
On production systems, disk usage can grow unexpectedly due to:
- Accumulation of logs in `/var/log`
- Application components generating large temporary files
- Databases growing faster than expected
- Backup files or artifacts consuming root space

Running out of disk space can lead to:
- Application crashes
- Failed writes or installation errors
- Service outages
- System instability

To avoid such issues, this script provides a quick alert mechanism that indicates when disk usage crosses a specified limit.

---

## ✅ Approach
The script follows a simple and efficient workflow:
1. Use `df /` to check disk usage for the root filesystem.
2. Extract the usage percentage using `awk` and `sed`.
3. Remove the `%` symbol to get a clean integer.
4. Compare the integer value against a threshold.
5. If the usage exceeds the threshold, print an alert to stdout (useful for cron emails).

This approach ensures minimal dependencies and runtime overhead.

---

## 🧾 Script Code
Below is the final script:

```bash
#!/bin/bash
THRESHOLD=90
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ $USAGE -gt $THRESHOLD ]; then
  echo "Disk usage is above $THRESHOLD%!"
fi
```

---

## 🔍 Explanation of the Code
### `THRESHOLD=90`
Defines the maximum allowed disk usage (in percent). If usage crosses this value, an alert is triggered.

### `df /`
Displays disk usage metrics for the root filesystem.

### `grep /`
Filters the output of `df` to ensure the correct line is processed.

### `awk '{ print $5 }'`
Extracts the fifth column, which contains the percentage usage 

### `sed 's/%//g'`
Strips the `%` symbol, leaving a numeric value 

### Threshold Comparison
```bash
if [ $USAGE -gt $THRESHOLD ]
```
Checks whether the usage exceeds the defined threshold.

### Alert
```bash
echo "Disk usage is above $THRESHOLD%!"
```
Prints a simple alert message.

