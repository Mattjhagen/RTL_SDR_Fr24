#!/bin/bash
# RTL-SDR and ADS-B Setup Script for Flightradar24 Receiver

set -e

echo "======================================"
echo "RTL-SDR and ADS-B Setup"
echo "======================================"
echo ""

# Check for RTL-SDR device
echo "1. Checking for RTL-SDR device..."
if lsusb | grep -qi "realtek\|0bda:2838"; then
    echo "✓ RTL-SDR device detected!"
    lsusb | grep -i "realtek\|0bda:2838"
else
    echo "⚠ Warning: RTL-SDR device not detected. Please ensure it's plugged in."
    echo "Looking for any Realtek devices..."
    lsusb | grep -i realtek || echo "No Realtek devices found."
fi
echo ""

# Update package lists
echo "2. Updating package lists..."
sudo apt update
echo ""

# Install RTL-SDR software
echo "3. Installing RTL-SDR tools..."
sudo apt install -y rtl-sdr librtlsdr-dev
echo ""

# Install audio tools
echo "4. Installing audio processing tools (sox for audio playback)..."
sudo apt install -y sox libsox-fmt-all pulseaudio-utils
echo ""

# Install additional useful tools
echo "5. Installing additional SDR tools..."
sudo apt install -y gqrx-sdr
echo ""

# Blacklist DVB-T drivers
echo "6. Blacklisting conflicting DVB-T drivers..."
sudo bash -c 'cat > /etc/modprobe.d/rtl-sdr-blacklist.conf << EOF
# Blacklist DVB-T drivers that conflict with RTL-SDR
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
EOF'
echo "✓ Blacklist created at /etc/modprobe.d/rtl-sdr-blacklist.conf"
echo ""

# Unload conflicting modules if loaded
echo "7. Unloading conflicting kernel modules (if loaded)..."
sudo rmmod dvb_usb_rtl28xxu 2>/dev/null && echo "✓ Unloaded dvb_usb_rtl28xxu" || echo "  dvb_usb_rtl28xxu not loaded"
sudo rmmod rtl2832 2>/dev/null && echo "✓ Unloaded rtl2832" || echo "  rtl2832 not loaded"
sudo rmmod rtl2830 2>/dev/null && echo "✓ Unloaded rtl2830" || echo "  rtl2830 not loaded"
echo ""

# Test the device
echo "8. Testing RTL-SDR device..."
if command -v rtl_test &>/dev/null; then
    echo "Running quick device test (5 seconds)..."
    timeout 5 rtl_test || true
    echo ""
else
    echo "⚠ rtl_test not found in PATH"
fi

echo "======================================"
echo "Setup Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "  1. Run: rtl_test -t                    (test device)"
echo "  2. Run: ./listen_ham.sh <frequency>    (listen to ham radio)"
echo "  3. Run: gqrx                           (GUI with waterfall display)"
echo ""
echo "If you see errors about device permissions, you may need to:"
echo "  - Add yourself to the plugdev group: sudo usermod -a -G plugdev $USER"
echo "  - Log out and back in"
echo ""
