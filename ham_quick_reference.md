# Ham Radio Quick Reference for RTL-SDR

## 🎙️ **Quick Start - Listen to Ham Radio**

### Most Active Frequencies to Try First:

**2-Meter Band (144-148 MHz)** - Most popular ham band
```bash
./listen_ham.sh 146.52   # National FM simplex calling frequency
./listen_ham.sh 145.5    # International Space Station (ISS) when overhead
./listen_ham.sh 147.0    # Common repeater output (varies by area)
```

**70cm Band (420-450 MHz)** - UHF ham band
```bash
./listen_ham.sh 446.0    # 70cm FM simplex calling
./listen_ham.sh 435.0    # Satellite downlinks
```

**Find local repeaters:** Search "ham radio repeaters [your city]" or check repeaterbook.com

---

## 🔧 **Essential Commands**

### Listen to a specific frequency:
```bash
./listen_ham.sh 146.52
```

### Scan a band for activity:
```bash
./scan_ham.sh 2m      # Scan 2-meter band
./scan_ham.sh 70cm    # Scan 70cm band
```

### Use GUI with waterfall display (best for finding signals):
```bash
gqrx
```
- Set Input rate: 2.4 Msps
- Set frequency (e.g., 146.520 MHz)
- Select mode: Narrow FM
- Click the power button to start
- Watch the waterfall for signal spikes!

---

## 📻 **Ham Radio Bands (RTL-SDR Compatible)**

### VHF Bands
- **6m:** 50-54 MHz (long distance during solar activity)
- **2m:** 144-148 MHz ⭐ **MOST ACTIVE** - FM voice, digital modes
- **1.25m:** 222-225 MHz (less common in most areas)

### UHF Bands  
- **70cm:** 420-450 MHz ⭐ Popular - FM voice, satellites, digital

### Key Frequencies by Band:

**2-Meter (144-148 MHz):**
```
144.000-144.100  CW (Morse code)
144.200          National FM simplex calling
145.500-145.800  Satellite downlinks / ISS
146.400-146.600  Simplex (direct radio-to-radio)
146.520          National FM simplex calling ⭐ START HERE
147.000-147.400  Repeater outputs (+600 kHz offset)
```

**70cm (420-450 MHz):**
```
432.000-432.100  CW and weak signals
435.000-438.000  Satellite downlinks
446.000          Calling frequency
447.000-450.000  Repeater outputs
```

---

## 🗣️ **What You'll Hear**

### Modes You Can Decode with RTL-SDR:

**FM (Voice)** - Most common on 2m/70cm
- **NFM (Narrowband FM):** Ham repeaters, simplex
- **WFM (Wideband FM):** Broadcast radio (88-108 MHz)

**AM (Voice)** - Aviation, some HF
- Air traffic control (118-137 MHz)

**Digital Modes** (need additional software):
- **APRS:** 144.390 MHz (GPS position reports) - Use direwolf
- **Packet Radio:** Various frequencies - Use direwolf
- **POCSAG:** Pager decoding - Use multimon-ng
- **ACARS:** Aircraft data (131.550 MHz) - Use acarsdec

---

## 🛰️ **Satellite Listening**

Ham radio satellites and the ISS transmit in FM:

**International Space Station (ISS):**
- Voice downlink: **145.800 MHz** (when crew is active)
- APRS downlink: **145.825 MHz** (almost always on)
- Check when ISS passes overhead: heavens-above.com

**Weather Satellites (not ham, but cool):**
- NOAA 15: 137.620 MHz
- NOAA 18: 137.9125 MHz  
- NOAA 19: 137.100 MHz

---

## 🎛️ **Tuning Tips**

### Adjusting rtl_fm parameters:

**If audio is too quiet:**
```bash
# Increase gain from 50 to maximum (49.6)
rtl_fm -f 146.52M -M fm -s 12k -g 49.6 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

**If audio is distorted/overdriven:**
```bash
# Decrease gain to 20
rtl_fm -f 146.52M -M fm -s 12k -g 20 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

**Enable squelch (cuts noise when no signal):**
```bash
# -l 30 sets squelch level (0=off, higher=more aggressive)
rtl_fm -f 146.52M -M fm -s 12k -g 50 -l 30 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

**Record to file instead of playing:**
```bash
rtl_fm -f 146.52M -M fm -s 12k -g 50 | sox -t raw -r 12k -es -b 16 -c 1 -V1 - recording.wav
```

---

## 🔍 **Finding Local Activity**

1. **Check RepeaterBook.com** - Database of ham repeaters by location
   - Look for frequencies with high activity ratings
   - Note the offset (e.g., +600 kHz means transmit 600 kHz higher)

2. **Listen during peak times:**
   - Morning commute: 7-9 AM
   - Evening commute: 5-7 PM  
   - Weekend afternoons
   - During severe weather (SKYWARN nets)

3. **Popular activities:**
   - Nets (scheduled group chats) - check local club websites
   - Contests (weekends, especially spring/fall)
   - Ragchewing (casual conversations)

---

## 🧰 **Useful SDR Tools**

### Command-line:
```bash
rtl_test -t              # Test device
rtl_fm                   # FM demodulator (what we use)
rtl_power                # Spectrum analyzer / scanner
rtl_433                  # Decode ISM devices (wireless sensors)
```

### GUI Applications:
```bash
gqrx                     # Waterfall display + receiver ⭐ BEST FOR BEGINNERS
cubicsdr                 # Alternative GUI
```

### Digital Mode Decoders:
```bash
# Install these for digital modes:
sudo apt install direwolf      # APRS, packet radio
sudo apt install multimon-ng   # POCSAG pagers, AFSK
sudo apt install acarsdec      # Aircraft ACARS messages
```

---

## 📡 **GQRX Configuration**

GQRX is the easiest way to find and listen to ham signals:

1. **Start GQRX:**
   ```bash
   gqrx
   ```

2. **Configure I/O devices:**
   - Device: RTL-SDR
   - Input rate: 2400000 (2.4 Msps)
   - Decimation: None
   - Bandwidth: 2.4 MHz

3. **Tune to 146.520 MHz:**
   - Enter frequency in the box
   - Or click on waterfall display

4. **Set mode to "Narrow FM"** (NFM)
   - Bandwidth: 12.5 kHz (or 25 kHz for some repeaters)

5. **Watch the waterfall for signal spikes!**
   - Bright vertical lines = active transmission
   - Click on them to tune

6. **Enable squelch:**
   - Drag the SQL slider to cut background noise

---

## ⚖️ **Legal Notes**

- ✅ **Legal:** Listening to ham radio (receive-only)
- ✅ **Legal:** All frequencies in this guide
- ❌ **Illegal:** Transmitting without a ham license
- ❌ **Illegal:** Decrypting encrypted signals
- ❌ **Illegal:** Cell phone calls (and RTL-SDR can't tune there anyway)

---

## 🎓 **Learning More**

- **Get your ham license:** Study at hamstudy.org (tests are easy!)
- **Local ham clubs:** Find via arrl.org
- **Online SDR:** Try websdr.org to hear what's possible
- **/r/RTLSDR** and **/r/amateurradio** on Reddit

---

## 🚀 **Your First Session Checklist**

1. ✅ Run `./setup_rtlsdr.sh`
2. ✅ Test device: `rtl_test -t`
3. ✅ Start GQRX: `gqrx`
4. ✅ Tune to 146.520 MHz
5. ✅ Set mode to Narrow FM
6. ✅ Listen and watch the waterfall!

**Alternative (command-line):**
```bash
./listen_ham.sh 146.52
```

If you don't hear anything, try scanning during commute hours or search for local repeaters at repeaterbook.com.

**Have fun listening! 73 (ham radio goodbye)!**
