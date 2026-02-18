import psutil

whitelist = {22, 80, 443}

for conn in psutil.net_connections(kind='inet'):
    if conn.laddr:
        port = conn.laddr.port
        if port not in whitelist:
            print(f"SUSPICIOUS PORT: {port} | PID={conn.pid}")