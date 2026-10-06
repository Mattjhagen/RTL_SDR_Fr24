#!/bin/bash
# USB Device Troubleshooting Script

echo "======================================"
echo "USB Device Troubleshooting"
echo "======================================"
echo ""

echo "Step 1: Current USB device count"
echo "---------------------------------"
USB_COUNT=$(lsusb | wc -l)
echo "Current USB devices: $USB_COUNT"
echo ""
lsusb
echo ""

echo "Step 2: Testing USB ports"
echo "-------------------------"
echo "Please try the following:"
echo ""
echo "  1. Try a DIFFERENT rear USB port on the R410"
echo "  2. Try the FRONT USB ports"
echo "  3. Try plugging in a known-working USB device (flash drive)"
echo "     to verify the USB port works"
echo ""

read -p "Press ENTER after you've tried a different port..."
echo ""

echo "Checking for new devices..."
NEW_COUNT=$(lsusb | wc -l)
echo "USB devices now: $NEW_COUNT"
echo ""

if [ $NEW_COUNT -gt $USB_COUNT ]; then
    echo "✓ NEW DEVICE DETECTED!"
    echo ""
    lsusb
else
    echo "❌ No new device detected"
    echo ""
    echo "Possible issues:"
    echo "  1. USB port is dead - try front ports"
    echo "  2. Device needs external power - check for power adapter"
    echo "  3. Device is faulty"
    echo "  4. Cable is bad (if using a USB extension)"
    echo ""
fi
