#!/bin/bash
# Install SDR++ GUI Application

set -e

echo "======================================"
echo "Installing SDR++"
echo "======================================"
echo ""

cd /home/matt/sdr_software

# Install SDR++ package
echo "Installing SDR++ package..."
sudo apt install -y ./sdrpp_ubuntu_noble_amd64.deb

echo ""
echo "======================================"
echo "SDR++ Installation Complete!"
echo "======================================"
echo ""
echo "To start SDR++:"
echo "  sdrpp"
echo ""
echo "Quick setup tips:"
echo "  1. Select 'RTL-SDR' from the Source dropdown"
echo "  2. Click the Play button (▶) to start"
echo "  3. Enter a frequency (e.g., 146.520 for 2m ham)"
echo "  4. Select 'NFM' mode for ham radio"
echo "  5. Adjust gain with the slider"
echo ""
