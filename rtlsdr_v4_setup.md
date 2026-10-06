# RTL-SDR Blog V4 Setup Guide

## 🎉 **Great Choice!**

The RTL-SDR Blog V4 is an excellent SDR receiver with:
- ✅ **Range:** 500 kHz - 1.766 GHz (perfect for ham radio)
- ✅ **Bias-T:** Built-in power for active antennas
- ✅ **Better filtering** than V3/generic dongles
- ✅ **Metal case** for RF shielding
- ✅ **SMA connector** for external antennas (perfect for your FR24 antenna!)

---

## 📦 **When It Arrives - Quick Start**

### **Step 1: Plug It In**
```bash
# Plug in the RTL-SDR V4 via USB, then:
./detect_rtlsdr.sh
```

You should see:
```
✓ FOUND: Realtek RTL2832U DVB-T (standard RTL-SDR)
Bus 00X Device 00X: ID 0bda:2838 Realtek Semiconductor Corp.
```

### **Step 2: Test It**
```bash
rtl_test -t
```

Expected output:
```
Found 1 device(s):
  0:  Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM
Found Rafael Micro R828D tuner
```

### **Step 3: Launch SDR++**
```bash
sdrpp
```

1. Select **RTL-SDR** from Source dropdown
2. Click **Play (▶)**
3. Tune to **146.52 MHz** (type `146520000`)
4. Select **NFM** mode
5. You're listening!

---

## 📡 **Using Your Flightradar24 Antenna**

### **Antenna Compatibility**

Your FR24 external antennas are likely:
- **1090 MHz optimized** (ADS-B quarter-wave)
- **50 ohm impedance** (standard)
- **SMA connector** (perfect for RTL-SDR V4)

**Good news:** They'll work, but performance varies by frequency:

| Use Case | Performance with 1090 MHz Antenna |
|----------|-----------------------------------|
| **ADS-B (1090 MHz)** | ⭐⭐⭐⭐⭐ Excellent (designed for this) |
| **Ham 70cm (430-450 MHz)** | ⭐⭐⭐⭐ Very good (close to resonance) |
| **Ham 2m (144-148 MHz)** | ⭐⭐⭐ Good (will work, slight loss) |
| **FM Radio (88-108 MHz)** | ⭐⭐⭐ Good |
| **Aviation (118-137 MHz)** | ⭐⭐⭐ Good |

### **Antenna Tips**

**1. Start with the FR24 antenna for testing**
   - Unscrew one from the FR24 receiver
   - Screw it onto the RTL-SDR V4 SMA connector
   - Try 70cm ham band first (446 MHz) - best match

**2. For best 2m performance (146 MHz), you can:**
   - **Option A:** Buy a 2m/VHF antenna (~$15-30)
   - **Option B:** Build a simple dipole (cheap, fun project)
   - **Option C:** Use the FR24 antenna (will work fine for receiving)

**3. Antenna Placement:**
   - Higher is better
   - Near a window for indoor use
   - Outside for best range
   - Vertical orientation for VHF/UHF

---

## 🔧 **RTL-SDR V4 Special Features**

### **Bias-T (Antenna Power)**

The V4 can power active antennas (LNAs) through the antenna cable.

**⚠️ IMPORTANT:** Your FR24 antennas are likely **passive** (no power needed).

**Before enabling Bias-T:**
1. Check if your antenna needs power (look for "LNA" or "amplified")
2. FR24 antennas are usually passive - **DO NOT enable Bias-T**
3. Enabling Bias-T on passive antenna = harmless but unnecessary
4. Enabling Bias-T on active antenna without protection = could damage it

**How to enable Bias-T (if needed later):**
```bash
# In SDR++: Source settings → Bias-T: ON
# Command line:
rtl_biast -b 1
```

### **Better Filtering**

The V4 has improved filters to reduce interference. No setup needed - works automatically!

---

## 🎙️ **Best Frequencies to Try First**

### **With Your 1090 MHz Antenna:**

**1. ADS-B Aircraft (1090 MHz)** - Best match!
```bash
./listen_ham.sh 1090    # Won't decode voice, but you'll hear data bursts
# Or use dump1090 for decoding (different from FR24 receiver)
```

**2. 70cm Ham Band (446 MHz)** - Excellent match!
```bash
./listen_ham.sh 446.0   # 70cm calling frequency
./listen_ham.sh 435.0   # Satellite downlinks
```

**3. 2m Ham Band (146 MHz)** - Good match!
```bash
./listen_ham.sh 146.52  # 2m calling frequency (most active)
./listen_ham.sh 145.5   # ISS (when overhead)
```

**4. Aviation (118-137 MHz)** - Good match!
```bash
# Listen to aviation (use AM mode):
rtl_fm -f 121.5M -M am -s 12k -g 50 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

---

## 🖥️ **Software Setup**

### **Already Installed:**
- ✅ rtl-sdr tools (`rtl_test`, `rtl_fm`, etc.)
- ✅ SDR++ (GUI with waterfall)
- ✅ GQRX (alternative GUI)
- ✅ sox (audio playback)

### **Scripts Ready to Use:**
- `./detect_rtlsdr.sh` - Detect device
- `./listen_ham.sh <freq>` - Listen to any frequency
- `./scan_ham.sh 2m` - Scan 2m band
- `./scan_ham.sh 70cm` - Scan 70cm band

### **Optional - Install More Tools:**

**For digital modes:**
```bash
sudo apt install -y direwolf multimon-ng rtl_433
```

- **direwolf** - APRS decoder (144.39 MHz)
- **multimon-ng** - Pager/DTMF decoder
- **rtl_433** - ISM band device decoder (433 MHz)

---

## 📋 **First-Time Setup Checklist**

When your V4 arrives:

```bash
# 1. Plug in USB
# 2. Detect device
./detect_rtlsdr.sh

# 3. If not detected, run setup again
./setup_rtlsdr.sh

# 4. Test device
rtl_test -t

# 5. Connect FR24 antenna (screw onto SMA connector)

# 6. Launch SDR++ GUI
sdrpp

# 7. Try 2m calling frequency
./listen_ham.sh 146.52
```

---

## 🎯 **Quick Reference**

**Device IP (FR24 receiver):** http://192.168.0.7  
**When V4 arrives:**
1. Plug into USB
2. Run `./detect_rtlsdr.sh`
3. Connect antenna
4. Run `sdrpp` or `./listen_ham.sh 146.52`

**Antenna:** Use FR24 antenna (works great for 70cm, good for 2m)

**Best starting point:** 146.52 MHz (2m ham calling) or 446.0 MHz (70cm)

---

## 🆘 **Troubleshooting (For When It Arrives)**

### Device Not Detected?
```bash
# Check USB connection
lsusb | grep Realtek

# If not found, try different USB port
# Run setup again
./setup_rtlsdr.sh
```

### No Audio?
```bash
# Check device is working
rtl_test -t

# Try with more gain
./listen_ham.sh 146.52  # Edit script to change gain from 50 to 40
```

### Antenna Connection?
- Hand-tighten SMA connector (don't over-tighten)
- Make sure center pin makes contact
- Try without antenna first (should still hear strong local signals)

---

## 🎓 **Next Steps After You're Receiving**

1. **Join local ham nets** - Find schedules on repeaterbook.com
2. **Track satellites** - ISS, NOAA weather satellites
3. **Decode APRS** - Ham radio GPS tracking (144.39 MHz)
4. **Listen to ISM devices** - Weather stations, car key fobs (433 MHz)
5. **Get your ham license!** - Free study at hamstudy.org

---

## 📚 **Resources**

- **RTL-SDR Blog:** rtl-sdr.com
- **SDR++ GitHub:** github.com/AlexandreRouma/SDRPlusPlus
- **Ham Radio:** repeaterbook.com, hamstudy.org
- **Signal ID:** sigidwiki.com

**Everything is ready - just waiting for your V4 to arrive!** 📡
