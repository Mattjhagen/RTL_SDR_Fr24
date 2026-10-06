#!/bin/bash
# Listen to Ham Radio Frequencies

if [ -z "$1" ]; then
    echo "======================================"
    echo "Ham Radio Listener"
    echo "======================================"
    echo ""
    echo "Usage: ./listen_ham.sh <frequency_in_mhz>"
    echo ""
    echo "Popular Ham Radio Frequencies:"
    echo "  2m Band (144-148 MHz):"
    echo "    146.520 MHz - National FM simplex calling"
    echo "    146.52   - Shorthand for above"
    echo "    145.500  - International Space Station (ISS)"
    echo ""
    echo "  70cm Band (420-450 MHz):"
    echo "    446.000 MHz - 70cm FM simplex calling"
    echo "    435-438  - Satellite downlinks"
    echo ""
    echo "  Other bands:"
    echo "    118-137  - Air band (aviation)"
    echo "    162.550  - NOAA weather radio"
    echo ""
    echo "Examples:"
    echo "  ./listen_ham.sh 146.52   # Listen to 2m calling frequency"
    echo "  ./listen_ham.sh 145.5    # Listen for ISS"
    echo "  ./listen_ham.sh 446.0    # Listen to 70cm"
    echo ""
    exit 1
fi

FREQ=$1

# Check if RTL-SDR device is available
if ! rtl_test -t 2>&1 | grep -q "Found"; then
    echo "ERROR: RTL-SDR device not found!"
    echo "Please ensure:"
    echo "  1. Device is plugged in"
    echo "  2. You've run ./setup_rtlsdr.sh"
    exit 1
fi

echo "======================================"
echo "Listening to ${FREQ} MHz"
echo "======================================"
echo ""
echo "Mode: NFM (Narrowband FM) - typical for ham repeaters"
echo "Press Ctrl+C to stop"
echo ""
echo "Tips:"
echo "  - If audio is distorted, try lower gain (-g 20 instead of -g 50)"
echo "  - If no signal, try scanning nearby frequencies"
echo "  - Use 'gqrx' for visual waterfall to see active frequencies"
echo ""

# Convert frequency to Hz for rtl_fm
# Handle both 146.52 and 146520000 formats
if [[ $FREQ =~ ^[0-9]+\.[0-9]+$ ]]; then
    # Already in MHz format (e.g., 146.52)
    FREQ_HZ="${FREQ}M"
elif [[ $FREQ =~ ^[0-9]+$ ]]; then
    # Just a number, assume MHz
    FREQ_HZ="${FREQ}M"
else
    FREQ_HZ="$FREQ"
fi

# Start listening
# -f: frequency
# -M: modulation (fm = NFM for ham/commercial, wbfm = WFM for broadcast FM)
# -s: sample rate
# -g: gain (50 = high, adjust if needed)
# -l: squelch level (0 = off, try 20-50 to cut noise)

rtl_fm -f "$FREQ_HZ" -M fm -s 12k -g 50 -l 0 | play -t raw -r 12k -es -b 16 -c 1 -V1 -

# Alternative with squelch (cuts out noise when no signal):
# rtl_fm -f "$FREQ_HZ" -M fm -s 12k -g 50 -l 30 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
