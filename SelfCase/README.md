
# EC2 Instance Pinger (Laptop → EC2, ICMP)

## 📌 Scenario

We needed a simple way to verify reachability of our remote machine from a local Windows laptop to an check if the cause of our crash is related to app issues or remote machine not working or turning on.

## 🧠 Approach

 We can create a simple bash script where we enter our EC2 instance into a variable  and call the ping function with constraints:
1. no of requests
2. time interval between the requests.

## 🛠️ Process (What We Did)

### 1) Created the initial Bash script (`ping.sh`) in Git Bash and when i tried to run, it showed error pinging the EC2 isntance not reachable, when trying to understand the issue i found that it was related to system adminstration access related to -c flag of ping
`images/1st Result.png`
`images/2nd Result.png`

### 2) Verified connectivity with the EC2 using command prompt to check if the was related to EC2 and found out to be succesfully connecting.
`images/3rd Result.png`

### 3) Created a Git Bash–friendly wrapper that calls ping funcition directly from the system level ("ping_ec2_win.sh") and i observed it to be working properly
`images/EC2 IP.png`
`images/Final Result.png`

