# RTL-SDR Frequency Guide

Your RTL-SDR receiver can typically tune from **24 MHz to 1766 MHz**, allowing you to explore many interesting signals.

## 🛩️ **Aviation Frequencies**

### ADS-B (Aircraft Tracking) - 1090 MHz
**What you'll hear:** Digital data packets from aircraft transponders
**How to use:**
```bash
# Start dump1090 for web-based aircraft map
dump1090-mutability --interactive --net --net-http-port 8080
# Open http://localhost:8080 in browser
```

### VHF Air Band - 118-137 MHz (AM)
**What you'll hear:** Pilot-to-tower voice communications
**How to use:**
```bash
# Listen to tower at 120.5 MHz
rtl_fm -f 120.5M -M am -s 12k -g 50 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

Common frequencies:
- 121.5 MHz - Emergency frequency
- 122.75 MHz - Air-to-air communication
- Local tower/approach frequencies (check your local airport)

## 📻 **Broadcast Radio**

### FM Radio - 88-108 MHz (WFM)
**What you'll hear:** Commercial FM radio stations
**How to use:**
```bash
# Listen to FM station at 95.5 MHz
rtl_fm -f 95.5M -M wbfm -s 200k -r 48k | play -t raw -r 48k -es -b 16 -c 1 -V1 -
```

### AM Radio - 540-1700 kHz (AM)
**Note:** Most RTL-SDR dongles can't tune below 24 MHz without modifications

## 🛰️ **Weather & Satellites**

### NOAA Weather Satellites - APT (Automatic Picture Transmission)
- NOAA 15: 137.620 MHz
- NOAA 18: 137.9125 MHz
- NOAA 19: 137.100 MHz

**How to use:**
```bash
# Record a NOAA satellite pass (when overhead)
rtl_fm -f 137.62M -s 60k -g 50 -p 55 | sox -t raw -r 60k -es -b 16 -c 1 -V1 - noaa.wav rate 11025

# Decode with WXtoImg or noaa-apt software
```

### Weather Radio (NOAA Weather Radio) - 162.400-162.550 MHz (NFM)
**What you'll hear:** Continuous weather broadcasts
```bash
# Listen to 162.550 MHz
rtl_fm -f 162.55M -M fm -s 12k -g 50 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

## 📡 **Two-Way Radio**

### PMR446 (Europe) / FRS (USA) - 446 MHz / 462-467 MHz (NFM)
**What you'll hear:** Walkie-talkie communications
```bash
# Listen to PMR Channel 1 (446.00625 MHz)
rtl_fm -f 446.00625M -M fm -s 12k -g 50 | play -t raw -r 12k -es -b 16 -c 1 -V1 -
```

### Marine VHF - 156-162 MHz (NFM)
**What you'll hear:** Ship-to-shore communications
- 156.800 MHz - Channel 16 (International distress/calling)

### Ham Radio (Amateur Radio)
- 2m band: 144-148 MHz (FM)
- 70cm band: 420-450 MHz (FM)

## 🚗 **Transportation**

### APRS (Automatic Packet Reporting System) - 144.390 MHz (1200 baud AFSK)
**What you'll hear:** Digital position reports from ham radio operators
```bash
# Decode APRS with direwolf software
rtl_fm -f 144.39M -s 22050 | direwolf -r 22050 -D 1 -
```

## 🔧 **ISM Bands (Industrial, Scientific, Medical)**

### 433 MHz ISM Band
**What you'll find:** Wireless sensors, car key fobs, garage door openers, weather stations
**How to use:** Use `rtl_433` to decode common protocols
```bash
rtl_433 -f 433.92M
```

### 868 MHz ISM Band (Europe)
**What you'll find:** Similar devices to 433 MHz band

## 📺 **Digital TV & Pagers**

### POCSAG Pagers - Various frequencies (138-174 MHz, 450-470 MHz)
```bash
# Decode pager messages
rtl_fm -f 152.48M -M fm -s 22050 | multimon-ng -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -
```

## 🛠️ **Useful RTL-SDR Commands**

### Test your device
```bash
rtl_test -t          # Quick test
rtl_test -p          # PPM error test (tuning accuracy)
rtl_power -f 88M:108M:100k -i 1  # Scan FM band for 1 second
```

### Scan for signals
```bash
# Scan 100-150 MHz and create heatmap
rtl_power -f 100M:150M:1k -i 10 -g 50 > scan.csv
```

### Record raw IQ samples
```bash
# Record 10 seconds at 1090 MHz, 2.4 Msps
rtl_sdr -f 1090e6 -s 2.4e6 -n 48000000 output.bin
```

## 🔍 **Finding Local Frequencies**

1. **RadioReference.com** - Database of frequencies by location
2. **WebSDR.org** - Online SDR receivers to preview frequencies
3. **SignalIdentificationWiki** - Identify unknown signals
4. **Local frequency lists** - Search "[your city] radio frequencies"

## ⚖️ **Legal Notes**

- **Legal to receive:** Most signals (in most countries)
- **Illegal to transmit:** RTL-SDR is **receive-only**
- **May be illegal to act on:** Cell phone calls, encrypted police, etc.
- **Privacy:** Don't decrypt or act on private communications

**Always check your local laws before monitoring!**

## 🎓 **Recommended Software**

- **GQRX** - GUI waterfall display (install: `sudo apt install gqrx-sdr`)
- **CubicSDR** - Another GUI option
- **rtl_433** - Decode ISM band devices
- **multimon-ng** - Decode POCSAG, AFSK, etc.
- **direwolf** - APRS decoder
- **SDR#** - Windows software (via Wine)

---

**Start with ADS-B (1090 MHz) - it's the most rewarding!** You'll see aircraft positions on a map in real-time.
