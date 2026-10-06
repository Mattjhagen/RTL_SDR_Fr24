# SDR++ Quick Start Guide

## 🚀 **Launch SDR++**

```bash
sdrpp
```

---

## ⚙️ **Initial Setup (First Time)**

When SDR++ opens:

### 1. **Select Source**
   - Click on the **Source** dropdown (top left)
   - Select **RTL-SDR**
   - It should auto-detect your device

### 2. **Configure RTL-SDR Settings**
   - Click the gear icon next to Source
   - Sample Rate: **2.4 MHz** (recommended)
   - Gain: Start with **Auto** or try **30-40 dB**
   - Click **Apply**

### 3. **Start Reception**
   - Click the **Play button (▶)** at the top
   - You should see the waterfall display start scrolling

---

## 🎛️ **Basic Controls**

### **Frequency Entry**
- Click in the frequency display at top
- Type frequency in Hz: `146520000` (146.52 MHz)
- Or use the mouse wheel to tune

### **Mode Selection**
Right-click on the frequency display area and select:
- **NFM** - Narrowband FM (ham radio, commercial)
- **WFM** - Wideband FM (broadcast radio 88-108 MHz)
- **AM** - Amplitude Modulation (aviation, some HF)
- **USB/LSB** - Single Sideband (HF ham bands)

### **Waterfall Display**
- **Vertical**: Frequency spectrum (brighter = stronger signal)
- **Horizontal**: Time (scrolls down)
- **Yellow peak indicators**: Current signal strength
- **Click anywhere** to tune to that frequency

### **Volume**
- Slider on the right side
- Or use system volume control

---

## 📻 **Preset Frequencies for Testing**

### Ham Radio (NFM Mode)
```
146.520 MHz  - 2m calling frequency (most active)
146.940 MHz  - Common repeater
145.500 MHz  - ISS (when overhead)
446.000 MHz  - 70cm calling frequency
```

### Broadcast FM (WFM Mode)
```
88.0-108.0 MHz - Your local FM radio stations
```

### Aviation (AM Mode)
```
121.500 MHz - Aviation emergency
122.750 MHz - Air-to-air
(Check local airport tower frequencies)
```

### Weather (NFM Mode)
```
162.550 MHz - NOAA weather radio
```

---

## 🎯 **Finding Signals**

### Method 1: Visual Scanning
1. Set a frequency range (e.g., 146.0 MHz)
2. Watch the waterfall for bright vertical lines
3. Click on any bright line to tune to it

### Method 2: Use Bookmarks
1. Click **Frequency Manager** (bookmark icon)
2. Add frequencies you want to monitor
3. Click to jump between them

### Method 3: Auto-Scan (if available)
- Some versions have a scanner function
- Set start/stop frequencies and let it scan

---

## 🔧 **Adjusting for Best Audio**

### If you hear nothing:
- ✓ Check that Play button is pressed
- ✓ Verify correct mode (NFM for ham radio)
- ✓ Increase gain (try 35-40 dB)
- ✓ Check system volume isn't muted
- ✓ Try 146.520 MHz during commute hours

### If audio is distorted:
- Lower the gain (try 20-30 dB)
- Adjust the RF gain slider

### If too much background noise:
- Enable **Squelch** (SQL slider)
- Increase squelch level until noise cuts out
- Signal will break through when strong enough

### If signals sound weird:
- Check you're in the right mode (NFM vs WFM vs AM)
- Ham radio uses NFM with 12.5 kHz or 25 kHz bandwidth

---

## 💾 **Recording**

### Record Audio:
1. Click the **Recorder** button (red circle)
2. Choose save location
3. Click **Start** to record
4. Click **Stop** when done

### Record IQ (Raw RF):
- Enable in the recorder settings
- Useful for later processing/decoding

---

## 🎨 **Customization**

### Waterfall Colors
- **Menu → Display → Color Map**
- Choose from various color schemes

### FFT Settings
- **Menu → Display → FFT Settings**
- Adjust FFT size for resolution
- Adjust averaging for smoother display

### Save Your Configuration
- All settings auto-save on exit
- Config stored in `~/.config/sdrpp/`

---

## 🔌 **Modules (Plugins)**

SDR++ has optional modules for:
- **Radio** - Different demodulators
- **Recorder** - Recording functionality  
- **Frequency Manager** - Bookmark frequencies
- **Scanner** - Auto-scan bands
- **Discord Integration** - Share what you're listening to

Enable/disable in: **Menu → Module Manager**

---

## 🐛 **Troubleshooting**

### "No device found"
```bash
# Run this first:
./setup_rtlsdr.sh

# Then check device:
rtl_test -t
```

### Permissions Error
```bash
# Add yourself to plugdev group:
sudo usermod -a -G plugdev $USER
# Log out and back in
```

### Audio Crackling
- Lower sample rate to 1.8 MHz
- Close other programs using audio
- Increase buffer size in settings

### SDR++ Crashes
```bash
# Run from terminal to see errors:
sdrpp

# Reset config:
rm -rf ~/.config/sdrpp/
```

---

## 🎓 **Learning Tips**

1. **Start with FM broadcast radio (88-108 MHz)**
   - Easy to find signals
   - Use WFM mode
   - Good for testing

2. **Move to 2m ham band (146.52 MHz)**
   - Use NFM mode
   - Listen during commute hours
   - Watch waterfall for activity

3. **Experiment with gain**
   - Too low = weak signals
   - Too high = distortion and interference
   - 30-40 dB is usually good

4. **Use the waterfall!**
   - It's your best tool for finding signals
   - Bright = strong signal
   - Learn to recognize different signal types

---

## 📚 **Resources**

- **Frequency databases:** repeaterbook.com, radioreference.com
- **Signal identification:** sigidwiki.com
- **Online SDR to compare:** websdr.org
- **SDR++ GitHub:** github.com/AlexandreRouma/SDRPlusPlus

---

## ⌨️ **Keyboard Shortcuts**

```
Space       - Start/Stop SDR
M           - Switch modes
F           - Enter frequency
+/-         - Adjust volume
Arrow Keys  - Fine tune frequency
```

---

## 🎯 **First Session Checklist**

1. ✅ Run `./install_sdrpp.sh`
2. ✅ Launch: `sdrpp`
3. ✅ Select RTL-SDR source
4. ✅ Press Play (▶)
5. ✅ Tune to 95.5 MHz (or your local FM station)
6. ✅ Select WFM mode
7. ✅ Hear music? Success!
8. ✅ Now try 146.52 MHz with NFM mode for ham radio

**Enjoy exploring the radio spectrum! 📡**
