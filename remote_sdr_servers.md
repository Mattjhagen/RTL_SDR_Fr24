# Remote SDR Server Directory

A comprehensive guide to accessible SDR servers and their available frequencies.

## Table of Contents
- [Your Personal Servers](#your-personal-servers)
- [Public WebSDR Servers](#public-websdr-servers)
- [Connection Guide](#connection-guide)
- [Frequency References](#frequency-references)

---

## Your Personal Servers

### Server #1: Primary RTL-TCP Server
**Address:** `209.99.148.102:5555`  
**Protocol:** RTL-TCP  
**Status:** ✅ Active  
**Connection:** Verified working  

**Hardware:** RTL-SDR (likely RTL2832U)  
**Frequency Coverage:** 24 MHz - 1766 MHz  
**Sample Rate:** Up to 2.4 MSPS  

**Available Frequencies:**

| Band | Frequency Range | What You Can Hear | Mode | Bandwidth |
|------|----------------|-------------------|------|-----------|
| **FM Broadcast** | 88-108 MHz | Local radio stations | WFM | 200 kHz |
| **Aviation VHF** | 118-137 MHz | Pilots, ATC, towers | AM | 8-12 kHz |
| **Weather Satellites** | 137-138 MHz | NOAA APT images | WFM | 40 kHz |
| **Ham Radio 2m** | 144-148 MHz | Amateur operators | NFM | 12.5 kHz |
| **Marine VHF** | 156-158 MHz | Ships, coast guard | NFM | 12.5 kHz |
| **NOAA Weather** | 162.400-162.550 MHz | Weather broadcasts | NFM | 25 kHz |
| **Business Band** | 151-174 MHz | Commercial, public service | NFM | 12.5-25 kHz |
| **Ham Radio 70cm** | 420-450 MHz | Amateur operators | NFM | 12.5 kHz |
| **ISM Band** | 433.92 MHz | IoT, remotes, sensors | NFM | 50 kHz |
| **Public Safety** | 450-470 MHz | Emergency services | NFM | 12.5-25 kHz |
| **Pagers** | 929-932 MHz | Alphanumeric pagers | NFM | 12.5 kHz |
| **Aircraft ADS-B** | 1090 MHz | Aircraft transponders | Raw | 2 MHz |

**Best Frequencies to Start:**
- **100.1 MHz** - FM Radio (guaranteed strong signal)
- **123.450 MHz** - General Aviation (very active daytime)
- **146.520 MHz** - Ham Radio National Simplex
- **156.800 MHz** - Marine Channel 16 (emergency)
- **1090 MHz** - Aircraft tracking with decoder

**Connection Instructions:**
```bash
# In SDR++ GUI:
1. Source dropdown → Select "RTL-TCP"
2. Host: 209.99.148.102
3. Port: 5555
4. Click Connect
5. Click Start
```

**Command Line (rtl_tcp client):**
```bash
rtl_tcp -a 209.99.148.102 -p 5555
```

---

## Public WebSDR Servers

These are publicly accessible SDR servers around the world. Most use web browsers, but some support SDR++ connections.

### University of Twente WebSDR (Netherlands)
**Website:** http://websdr.ewi.utwente.nl:8901/  
**Location:** Enschede, Netherlands  
**Coverage:** 0-29 MHz (HF bands)  
**Type:** Web-based interface  

**Available:**
- Shortwave broadcasts
- Amateur radio HF bands
- Maritime communications
- Aviation HF

### Northern Utah WebSDR (USA)
**Website:** http://websdr.sdrutah.org/  
**Location:** Utah, USA  
**Coverage:** Multiple bands including VHF/UHF  
**Type:** Web-based interface  

**Available:**
- Local FM broadcasts
- Aviation
- Amateur radio
- Public safety

### KiwiSDR Network
**Directory:** http://kiwisdr.com/public/  
**Locations:** Worldwide (100+ stations)  
**Coverage:** 0-30 MHz typically  
**Type:** Web-based, some API access  

**Features:**
- Real-time waterfall
- Multiple simultaneous users
- Good for HF/shortwave listening
- Often includes antenna information

---

## Public RTL-TCP Servers

*Note: Public RTL-TCP servers are rare due to bandwidth/security concerns. Most public SDRs use web interfaces.*

### Finding More Servers

1. **RTL-SDR Subreddit:** r/RTLSDR  
   - Community shares server addresses
   - Check pinned posts

2. **Radio Reference Forums**  
   - http://forums.radioreference.com/
   - SDR section

3. **KiwiSDR Public List**  
   - Many support remote access
   - Some allow API connections

---

## Connection Guide

### SDR++ Connection Steps

**For RTL-TCP servers:**
1. Open SDR++
2. Click **Source** dropdown
3. Select **"RTL-TCP"**
4. Enter:
   - Host: `[server IP]`
   - Port: `[server port]` (usually 1234 or 5555)
5. Click **Refresh** or **Connect**
6. Click **Start** ▶️

**For SpyServer:**
1. Select **"SpyServer"** from Source
2. Enter server address
3. May require password

**For SDR++ Server:**
1. Select **"SDR++ Server"** from Source  
2. Enter host and port
3. Connect

### Remote Desktop Access (Your r510)

If running SDR++ on r510 via VNC:
```
vnc://100.103.3.35:5902
```
Then use SDR++ GUI directly.

---

## Frequency References by Server

### 209.99.148.102:5555 (Your Server)

#### FM Radio (88-108 MHz)
```
88.1, 88.3, 88.5, 88.7, 88.9
89.1, 89.3, 89.5, 89.7, 89.9
... (continue odd frequencies through 107.9)
```
**Mode:** WFM | **Bandwidth:** 200 kHz

#### Aviation Band (118-137 MHz)
```
118.000 - Tower
121.500 - Emergency (Guard)
122.000 - Flight Service
123.450 - General Aviation ⭐ VERY ACTIVE
125.000 - ATC
128.000 - ATC
132.450 - Approach
```
**Mode:** AM | **Bandwidth:** 8-12 kHz

#### Weather Satellites (137 MHz)
```
137.100 - NOAA 15
137.620 - NOAA 18
137.912 - NOAA 19
```
**Mode:** WFM | **Bandwidth:** 40 kHz  
**Note:** Only during satellite passes (use tracking app)

#### Ham Radio 2-Meter (144-148 MHz)
```
144.200 - SSB calling
145.000 - FM calling
146.520 - National Simplex ⭐ MOST ACTIVE
146.xxx - Repeater frequencies (+ or - 600 kHz)
```
**Mode:** NFM | **Bandwidth:** 12.5 kHz

#### Marine VHF (156-158 MHz)
```
156.800 - Channel 16 (Emergency/Hailing) ⭐
156.050 - Channel 01
156.300 - Channel 06
156.650 - Channel 13 (Bridge-to-bridge)
```
**Mode:** NFM | **Bandwidth:** 12.5 kHz

#### NOAA Weather Radio (162 MHz)
```
162.400
162.425
162.450
162.475
162.500
162.525
162.550
```
**Mode:** NFM | **Bandwidth:** 25 kHz

#### Ham Radio 70cm (420-450 MHz)
```
446.000 - PMR446/FRS
446.006 - FRS Channel 1
```
**Mode:** NFM | **Bandwidth:** 12.5 kHz

#### Pagers (929-932 MHz)
```
929.xxx - Various
930.xxx - Various
931.xxx - Various
```
**Mode:** NFM | **Bandwidth:** 12.5 kHz

#### Aircraft Transponders (1090 MHz)
```
1090.000 - ADS-B
```
**Mode:** Raw/IQ | **Bandwidth:** 2 MHz  
**Decoder:** dump1090, dump1090-fa

---

## Frequency Categories

### Always Active (24/7)
- FM Radio (88-108 MHz)
- NOAA Weather (162.xxx MHz)
- Pagers (929-932 MHz)

### Daytime Active
- Aviation (118-137 MHz) - 6am-10pm local
- Business band (150-174 MHz)
- Marine VHF (156-158 MHz) - coastal areas

### Evening/Weekend Active
- Ham Radio 2m (144-148 MHz)
- Ham Radio 70cm (420-450 MHz)

### Event-Based
- Weather Satellites (137 MHz) - During passes only
- Aircraft Transponders (1090 MHz) - When aircraft overhead

---

## Best Times to Listen

| Time | What to Listen To | Why |
|------|------------------|-----|
| **Early Morning (6-9am)** | Aviation, Marine | Commuter flights, maritime traffic |
| **Midday (9am-5pm)** | Aviation, Business | Peak activity hours |
| **Evening (5-9pm)** | Ham Radio | Amateur operators after work |
| **Late Night (9pm-2am)** | Ham Radio, FM | DX conditions, distant stations |
| **Weekends** | Ham Radio | Most active amateur traffic |
| **Satellite Passes** | 137 MHz | Check pass prediction apps |

---

## Tools & Software

### For SDR++
- **Main:** https://github.com/AlexandreRouma/SDRPlusPlus
- **This guide's scripts:** Install scripts in this repo

### For ADS-B (1090 MHz)
```bash
sudo apt-get install dump1090-fa
dump1090 --net --device-index 0 --gain -10
```
Then visit: http://localhost:8080

### For Weather Satellites
```bash
sudo apt-get install wxtoimg
# Record pass, then decode with WXtoImg
```

### For Ham Radio Digital Modes
- **fldigi** - PSK31, RTTY, etc.
- **WSJT-X** - FT8, JT65
- **direwolf** - APRS

---

## Decoding Guides

### ADS-B Aircraft Tracking (1090 MHz)
```bash
# Start SDR++, tune to 1090 MHz
# In separate terminal:
rtl_adsb | dump1090
# Or with map:
dump1090-fa --net --interactive
# Visit: http://localhost:8080
```

### NOAA Weather Satellite Images (137 MHz)
```bash
# Record during satellite pass
rtl_fm -f 137.1M -s 60k -g 50 - | sox -t raw -r 60k -e s -b 16 -c 1 -V1 - noaa.wav rate 11025

# Decode with WXtoImg or:
wxtoimg -e HVC noaa.wav noaa.png
```

### APRS (144.390 MHz in USA)
```bash
rtl_fm -f 144.39M -s 22050 - | direwolf -r 22050 -B 9600 -
```

---

## Server Status & Monitoring

### Check Server Availability
```bash
# Test connection
nc -zv 209.99.148.102 5555

# Test with timeout
timeout 5 telnet 209.99.148.102 5555
```

### Monitor Signal Quality
In SDR++:
- Check **FFT display** for noise floor
- Look for **signals on waterfall**
- Monitor **RSSI/signal strength**

### Troubleshooting Connection
```bash
# Check if port is reachable
nmap -p 5555 209.99.148.102

# Test DNS resolution
host 209.99.148.102

# Trace route
traceroute 209.99.148.102
```

---

## Adding More Servers

### Want to Add Your Own RTL-SDR Server?

**On Server (Where RTL-SDR is Connected):**
```bash
# Install rtl-sdr tools
sudo apt-get install rtl-sdr

# Start RTL-TCP server
rtl_tcp -a 0.0.0.0 -p 5555

# Or with authentication (recommended)
rtl_tcp -a 127.0.0.1 -p 5555
# Then use SSH tunnel:
ssh -L 5555:localhost:5555 user@server
```

**Security Note:** Never expose RTL-TCP directly to internet without authentication!

### Sharing Your Server
If you want to share access:
1. Use **Tailscale** for private sharing
2. Or use **reverse SSH tunnel**
3. Or use **VPN** (WireGuard, OpenVPN)

**Never** expose on public IP without protection!

---

## Quick Reference Card

### Connection String Format
```
Protocol://Host:Port

Examples:
rtl_tcp://209.99.148.102:5555
vnc://100.103.3.35:5902
```

### Common Ports
- **1234** - Default rtl_tcp
- **5555** - Alternative rtl_tcp
- **8073** - WebSDR
- **8888** - SDR++ server

### Mode Reference
| Mode | Use Case | Bandwidth |
|------|----------|-----------|
| WFM | FM Radio, Weather Satellites | 150-200 kHz |
| NFM | Voice comms, Ham, Marine | 8-25 kHz |
| AM | Aircraft, AM Radio | 8-12 kHz |
| USB/LSB | Ham HF, Marine SSB | 2.7-3 kHz |
| RAW/IQ | Digital modes, ADS-B | Varies |

---

## Resources & Links

### Documentation
- [SDR++ Wiki](https://github.com/AlexandreRouma/SDRPlusPlus/wiki)
- [RTL-SDR Blog](https://www.rtl-sdr.com/)
- [Signal Identification Wiki](https://sigidwiki.com/)
- [Radio Reference](https://radioreference.com/)

### Communities
- [r/RTLSDR](https://reddit.com/r/rtlsdr)
- [r/amateursatellites](https://reddit.com/r/amateursatellites)
- [r/amateurradio](https://reddit.com/r/amateurradio)

### Satellite Tracking
- [N2YO.com](https://n2yo.com/) - Satellite passes
- [Heavens Above](https://heavens-above.com/) - Pass predictions
- [Gpredict](http://gpredict.oz9aec.net/) - Desktop tracker

---

## License & Credits

This document is part of the RTL_SDR_Fr24 repository.

**Maintained by:** Matt Jhagen  
**Last Updated:** October 2026  
**Repository:** https://github.com/Mattjhagen/RTL_SDR_Fr24

**Contributions welcome!** Submit pull requests to add:
- More server addresses
- Frequency discoveries
- Connection tips
- Troubleshooting solutions

---

## Server Addition Template

Want to add a server? Copy this template:

```markdown
### Server Name
**Address:** IP:Port
**Protocol:** RTL-TCP/SpyServer/Other
**Status:** Active/Inactive
**Location:** City, Country
**Hardware:** Hardware type
**Coverage:** Frequency range

**Available Frequencies:**
- Band 1: Description
- Band 2: Description

**Connection:**
[Instructions]

**Notes:**
[Any special info]
```

---

**Happy monitoring! 📻**
