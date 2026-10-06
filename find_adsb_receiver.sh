#!/bin/bash
# Find ADS-B PoE Receiver on Network

echo "======================================"
echo "Finding ADS-B Receiver on Network"
echo "======================================"
echo ""

echo "Checking network interfaces..."
ip addr show | grep -E "inet |UP"
echo ""

echo "Scanning for devices on local network..."
echo "(This will take 10-20 seconds)"
echo ""

# Get local subnet
SUBNET=$(ip route | grep "scope link" | head -1 | awk '{print $1}')

if [ -z "$SUBNET" ]; then
    echo "Could not detect local subnet. Please enter manually (e.g., 192.168.1.0/24):"
    read SUBNET
fi

echo "Scanning subnet: $SUBNET"
echo ""

# Simple ping sweep
for i in {1..254}; do
    IP=$(echo $SUBNET | cut -d'.' -f1-3).$i
    ping -c 1 -W 1 $IP &>/dev/null && echo "Found: $IP" &
done
wait

echo ""
echo "======================================"
echo "Looking for ADS-B receivers..."
echo "======================================"
echo ""

# Common ADS-B receiver ports
echo "Checking common ADS-B ports on found hosts..."
echo ""

for HOST in $(cat /tmp/ping_results.txt 2>/dev/null); do
    echo "Checking $HOST..."

    # Port 30003 - Beast raw data
    nc -zv -w 2 $HOST 30003 2>&1 | grep -q "open" && echo "  ✓ Port 30003 (Beast) - ADS-B data"

    # Port 8080 - Web interface
    nc -zv -w 2 $HOST 8080 2>&1 | grep -q "open" && echo "  ✓ Port 8080 (HTTP) - Web interface at http://$HOST:8080"

    # Port 80 - Web interface
    nc -zv -w 2 $HOST 80 2>&1 | grep -q "open" && echo "  ✓ Port 80 (HTTP) - Web interface at http://$HOST"
done

echo ""
echo "To manually check a specific IP:"
echo "  curl http://IP_ADDRESS"
echo "  or open in browser: http://IP_ADDRESS:8080"
