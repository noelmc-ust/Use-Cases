#!/bin/bash
EC2_IP="3.108.60.196"   
COUNT=3                  
TIMEOUT=2                

echo "Pinging EC2 instance at $EC2_IP..."

if ping -c "$COUNT" -W "$TIMEOUT" "$EC2_IP" > /dev/null 2>&1; then
    echo "✅ SUCCESS: EC2 instance $EC2_IP is reachable."
else
    echo "❌ FAILED: EC2 instance $EC2_IP is NOT reachable."
fi