# SDR Setup - Complete Overview

## 📡 **What You Have**

### Current: Flightradar24 ADS-B Receiver (Working Now)
- **Type:** Network PoE device (not USB)
- **IP:** http://192.168.0.7
- **Purpose:** Aircraft tracking only (1090/978 MHz)
- **Status:** ✅ Working - lights on, receiving data
- **Web Interface:** http://192.168.0.7/map.php

### Coming Soon: RTL-SDR Blog V4
- **Type:** USB SDR receiver
- **Purpose:** Ham radio, FM, aviation, general SDR
- **Range:** 500 kHz - 1.766 GHz
- **Antenna:** Can use one FR24 antenna (works well!)

---

## 🚀 **When V4 Arrives**

```bash
# 1. Plug in via USB
# 2. Run this:
./test_v4_arrival.sh

# 3. Launch SDR++
sdrpp

# 4. Or listen via command line
./listen_ham.sh 146.52
```

**Full guide:** `rtlsdr_v4_setup.md`

---

## 📁 **All Scripts & Guides**

### Setup Scripts
- `setup_rtlsdr.sh` - Install RTL-SDR software (already done ✅)
- `install_sdrpp.sh` - Install SDR++ GUI (already done ✅)

### When V4 Arrives
- `test_v4_arrival.sh` - Quick test when you plug it in
- `detect_rtlsdr.sh` - Detect USB RTL-SDR device

### Ham Radio Scripts
- `listen_ham.sh <freq>` - Listen to any frequency
- `scan_ham.sh 2m` - Scan 2-meter band
- `scan_ham.sh 70cm` - Scan 70cm band

### Guides
- `rtlsdr_v4_setup.md` - Complete V4 setup guide ⭐
- `ham_quick_reference.md` - Ham radio frequencies
- `sdrpp_quick_start.md` - SDR++ GUI tutorial
- `sdr_frequency_guide.md` - All frequencies you can explore
- `fr24_receiver_info.md` - Flightradar24 receiver info

---

## 🎯 **Quick Start (When V4 Arrives)**

**Most Active Ham Frequency:**
```bash
./listen_ham.sh 146.52    # 2m calling frequency
```

**Best Match for FR24 Antenna:**
```bash
./listen_ham.sh 446.0     # 70cm ham band
```

**GUI with Waterfall:**
```bash
sdrpp                     # Most modern
gqrx                      # Alternative
```

---

## 📊 **Current Status**

✅ Software installed (rtl-sdr, SDR++, GQRX, sox)  
✅ Scripts created and tested  
✅ FR24 receiver working (http://192.168.0.7)  
⏳ Waiting for RTL-SDR V4 to arrive  
⏳ Will use FR24 antenna with V4  

---

## 🆘 **Support**

All documentation is in:
- `/home/matt/*.md` - Markdown guides
- `/home/matt/*.sh` - Executable scripts

**When V4 arrives, start here:** `./test_v4_arrival.sh`
