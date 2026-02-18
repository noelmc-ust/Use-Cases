#!/usr/bin/env bash

EC2_IP="${1:-3.108.60.196}"
/c/Windows/System32/ping.exe "$EC2_IP" -n 3 -w 2000