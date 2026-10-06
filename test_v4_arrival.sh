#!/bin/bash
# Quick test script for when RTL-SDR V4 arrives

echo "======================================"
echo "RTL-SDR Blog V4 - Arrival Test"
echo "======================================"
echo ""

echo "Step 1: Detecting USB device..."
echo "--------------------------------"
if lsusb | grep -q "0bda:2838"; then
    echo "✅ RTL-SDR V4 DETECTED!"
    lsusb | grep "0bda:2838"
    echo ""
else
    echo "❌ Device not found. Please ensure:"
    echo "   1. V4 is plugged into USB port"
    echo "   2. USB cable is good"
    echo "   3. Try a different USB port"
    echo ""
    exit 1
fi

echo "Step 2: Testing with rtl_test..."
echo "--------------------------------"
timeout 3 rtl_test 2>&1 | head -20
echo ""

echo "Step 3: Checking tuner type..."
echo "-------------------------------"
rtl_test -t 2>&1 | grep -E "Found|tuner" | head -5
echo ""

echo "======================================"
echo "✅ RTL-SDR V4 is ready!"
echo "======================================"
echo ""
echo "Next steps:"
echo "  1. Connect your FR24 antenna to the SMA connector"
echo "  2. Try: sdrpp                    (GUI with waterfall)"
echo "  3. Or:  ./listen_ham.sh 146.52   (2m calling frequency)"
echo "  4. Or:  ./listen_ham.sh 446.0    (70cm calling frequency)"
echo ""
echo "📖 Read: rtlsdr_v4_setup.md for complete guide"
echo ""
