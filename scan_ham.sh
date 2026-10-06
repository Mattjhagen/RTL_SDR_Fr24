#!/bin/bash
# Scan Ham Radio Bands for Active Signals

BAND=${1:-2m}

echo "======================================"
echo "Ham Radio Band Scanner"
echo "======================================"
echo ""

case $BAND in
    2m)
        START="144M"
        END="148M"
        echo "Scanning 2m band (144-148 MHz)..."
        ;;
    70cm)
        START="420M"
        END="450M"
        echo "Scanning 70cm band (420-450 MHz)..."
        ;;
    *)
        echo "Usage: ./scan_ham.sh [2m|70cm]"
        echo ""
        echo "Bands:"
        echo "  2m   - 144-148 MHz (VHF)"
        echo "  70cm - 420-450 MHz (UHF)"
        echo ""
        exit 1
        ;;
esac

echo "This will take a few seconds..."
echo "Look for higher power levels to find active frequencies"
echo ""

# Scan the band and show power levels
# Output: frequency(Hz), timestamp, power(dB)
rtl_power -f $START:$END:10k -i 0.1 -1 -e 5s | sort -t',' -k3 -rn | head -20 | while IFS=',' read freq1 freq2 power rest; do
    freq_mhz=$(echo "scale=3; $freq1 / 1000000" | bc)
    echo "  $freq_mhz MHz: $power dB"
done

echo ""
echo "To listen to a frequency: ./listen_ham.sh <frequency>"
