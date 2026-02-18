
# Local Port & Process "Traffic Cop" 

##  Scenario
Security teams often suspect unauthorized services listening on ports. You need a **tiny** script to list open ports and flag anything not on the approved whitelist.

##  Approach
Use `psutil` to iterate network connections, extract the **local port** and **PID**, compare against a **whitelist**, and print suspicious ones.

##  How It Works (Code Explained)
```python
import psutil

whitelist = {22, 80, 443}

for conn in psutil.net_connections(kind='inet'):
    if conn.laddr:
        port = conn.laddr.port
        if port not in whitelist:
            print(f"SUSPICIOUS PORT: {port} | PID={conn.pid}")
```
- `psutil.net_connections(kind='inet')`: Gets active IPv4/IPv6 connections.
- `conn.laddr.port`: The local listening/connected port.
- `whitelist`: Set of approved ports; anything else is flagged.
- Prints a concise line with **port** and **PID** for follow‑up (e.g., `ps -p <PID> -o comm=`).

## ▶️ Usage
```bash
pip install psutil
python traffic_cop.py
```

### Example Output
```
SUSPICIOUS PORT: 5000 | PID=1234
SUSPICIOUS PORT: 6379 | PID=2210
```
