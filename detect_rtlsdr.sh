#!/bin/bash
# Detect and Monitor RTL-SDR Device

echo "======================================"
echo "RTL-SDR Device Detection"
echo "======================================"
echo ""

echo "Current USB devices:"
echo "-------------------"
lsusb
echo ""

echo "Looking for common RTL-SDR devices..."
echo "-------------------------------------"

# Common RTL-SDR vendor/product IDs
FOUND=0

# Realtek RTL2832U (most common)
if lsusb | grep -q "0bda:2838"; then
    echo "✓ FOUND: Realtek RTL2832U DVB-T (standard RTL-SDR)"
    lsusb | grep "0bda:2838"
    FOUND=1
fi

# Other Realtek variants
if lsusb | grep -q "0bda:2832"; then
    echo "✓ FOUND: Realtek RTL2832U"
    lsusb | grep "0bda:2832"
    FOUND=1
fi

# NooElec devices
if lsusb | grep -q "0bda:2838\|0bda:2832"; then
    echo "✓ This could be a NooElec NESDR device"
    FOUND=1
fi

# FlightAware dongles
if lsusb | grep -qi "flightaware"; then
    echo "✓ FOUND: FlightAware dongle"
    lsusb | grep -i "flightaware"
    FOUND=1
fi

# Generic Realtek
if lsusb -d 0bda: | grep -v "Card Reader"; then
    echo "✓ FOUND: Realtek USB device (might be RTL-SDR):"
    lsusb -d 0bda: | grep -v "Card Reader"
    FOUND=1
fi

echo ""

if [ $FOUND -eq 0 ]; then
    echo "❌ NO RTL-SDR DEVICE FOUND"
    echo ""
    echo "Please ensure:"
    echo "  1. The device is plugged into a USB port"
    echo "  2. Try a different USB port"
    echo "  3. Try unplugging and replugging the device"
    echo ""
    echo "Common RTL-SDR devices we're looking for:"
    echo "  - Vendor ID: 0bda (Realtek)"
    echo "  - Product ID: 2832, 2838"
    echo "  - Flightradar24 dongles (usually Realtek-based)"
    echo ""
    echo "If you just plugged it in, wait 5 seconds and run this again:"
    echo "  ./detect_rtlsdr.sh"
else
    echo "Device detected! Now testing with rtl_test..."
    echo ""
    rtl_test -t 2>&1 | head -20
fi

echo ""
echo "To monitor USB connections in real-time:"
echo "  watch -n 1 lsusb"
echo ""
