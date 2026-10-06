# Flightradar24 Receiver - Quick Reference

## 🌐 **Web Interface**

**URL:** http://192.168.0.7

**Available Pages:**
- **Overview** - http://192.168.0.7/index.php
- **Aircraft List** - http://192.168.0.7/ac-list.php
- **Map** - http://192.168.0.7/map.php (live aircraft map)
- **Settings** - http://192.168.0.7/settings.php
- **Stats** - http://192.168.0.7/stats.php
- **About** - http://192.168.0.7/about.php

---

## 📡 **Your Device**

**Model:** ADS-B + UAT Receiver V1.0 with PoE
**IP Address:** 192.168.0.7
**Connection:** Power over Ethernet (PoE)

**Features:**
- ✓ ADS-B (1090 MHz) - Commercial aircraft
- ✓ UAT (978 MHz) - General aviation (US)
- ✓ Built-in GPS for accurate positioning
- ✓ Dual external antennas
- ✓ Network-based (not USB)

---

## 📊 **Data Ports**

Your receiver streams aircraft data on these ports:

- **Port 30003** - Beast format raw data
- **Port 30005** - Beast format data (alternate)
- **Port 8080/80** - Web interface

You can pull this data into other software (dump1090, tar1090, etc.)

---

## ⚠️ **Important: This is NOT for Ham Radio**

This Flightradar24 receiver is **dedicated hardware for ADS-B aircraft tracking only**.

It cannot be used for:
- ❌ Ham radio listening
- ❌ FM radio
- ❌ General SDR experimentation
- ❌ Other frequencies

The receiver is locked to **1090 MHz (ADS-B)** and **978 MHz (UAT)** only.

---

## 🎙️ **If You Want Ham Radio Listening**

You'll need a **separate USB RTL-SDR dongle** (~$25-35):

### Recommended RTL-SDR Devices:
1. **NooElec NESDR Smart** (~$30) - Amazon/AliExpress
   - RTL2832U + R820T2 tuner
   - 25 MHz - 1.75 GHz range
   - USB powered

2. **RTL-SDR Blog V3** (~$35) - rtl-sdr.com
   - Better filtering
   - Bias-T for LNA power
   - Direct sampling mode for HF

3. **Generic RTL2832U dongles** (~$15-20)
   - Basic but works fine
   - Good for getting started

Once you have a USB RTL-SDR dongle, you can use the scripts and software I prepared:
- `./listen_ham.sh` - Listen to ham frequencies
- `sdrpp` - SDR++ GUI
- `gqrx` - Alternative GUI

---

## 🚀 **Using Your Flightradar24 Receiver**

### View Aircraft in Real-Time:
1. Open: **http://192.168.0.7/map.php**
2. See live aircraft on a map
3. Click aircraft for details (callsign, altitude, speed)

### Share Data with Flightradar24:
- Your device may be configured to feed data to FR24
- Check Settings page for sharing configuration
- You might earn a free FR24 Business subscription!

### Pull Data into Other Software:

**Example: Connect to dump1090 data:**
```bash
# View raw Beast data stream
nc 192.168.0.7 30003

# Or integrate with tar1090/dump1090 on your R410
```

---

## 🔧 **Troubleshooting**

### Can't Access Web Interface?
```bash
# Check device is reachable
ping 192.168.0.7

# Check ports are open
nc -zv 192.168.0.7 80
```

### Device Not Receiving Aircraft?
- Check both antennas are securely connected
- Antennas should be positioned outside with clear sky view
- GPS LED should be solid (not blinking) = GPS lock
- Check Settings page for signal quality stats

### Find Device IP if It Changes:
```bash
./find_adsb_receiver.sh
```

---

## 📚 **Resources**

- **Flightradar24:** https://www.flightradar24.com
- **FR24 Feeder Info:** Check your receiver's About page
- **Aircraft Database:** http://192.168.0.7/ac-list.php

---

## 📝 **Summary**

✅ **ADS-B Receiver:** http://192.168.0.7
✅ **Purpose:** Aircraft tracking (ADS-B + UAT)
✅ **Connection:** Network (PoE)

❌ **Not for:** Ham radio, FM radio, general SDR

**For ham radio:** Get a separate USB RTL-SDR dongle
