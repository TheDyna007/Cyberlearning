# 🚀 LINUX QUICKSTART GUIDE

## ⚡ Fastest Way to Get Started

### 1. Make Scripts Executable
```bash
chmod +x run_claude_osint.sh
chmod +x install_dependencies.sh
```

### 2. Run It
```bash
./run_claude_osint.sh
```

**That's it!** The script auto-installs everything needed.

---

## 🐧 Distribution-Specific Commands

### Ubuntu / Debian / Linux Mint / Pop!_OS / Kali / Parrot
```bash
# Option 1: Auto-install
./install_dependencies.sh

# Option 2: Manual
sudo apt update
sudo apt install python3 python3-pip python3-tk
pip3 install --user requests
```

### Fedora / RHEL / CentOS Stream
```bash
# Option 1: Auto-install
./install_dependencies.sh

# Option 2: Manual
sudo dnf install python3 python3-pip python3-tkinter
pip3 install --user requests
```

### Arch Linux / Manjaro
```bash
# Option 1: Auto-install
./install_dependencies.sh

# Option 2: Manual
sudo pacman -S python python-pip tk
pip install --user requests
```

---

## 📝 What Each Script Does

### `run_claude_osint.sh` (MAIN LAUNCHER)
- Checks for Python
- Auto-installs tkinter if missing
- Auto-installs requests if missing
- Launches the OSINT tool
- Keeps terminal open on errors

### `install_dependencies.sh` (SETUP HELPER)
- Detects your Linux distro automatically
- Installs all system packages
- Installs all Python packages
- Verifies everything worked

### `osint_claude_ai.py` (THE TOOL)
- Main OSINT investigation application
- Real Claude AI integration
- Animated GUI interface

---

## ✅ Verification

### Check if everything is installed:
```bash
# Check Python
python3 --version
# Should show: Python 3.7 or higher

# Check tkinter
python3 -c "import tkinter; print('tkinter OK')"
# Should print: tkinter OK

# Check requests
python3 -c "import requests; print('requests OK')"
# Should print: requests OK
```

---

## 🎯 Usage Flow

```bash
# 1. First time setup (if auto-install fails)
./install_dependencies.sh

# 2. Run the tool
./run_claude_osint.sh

# 3. Fill in the GUI form
#    - First Name (required)
#    - Last Name (required)  
#    - Optional fields for better results
#    - Upload image for Claude Vision

# 4. Click "START CLAUDE AI INVESTIGATION"

# 5. Watch real AI work
#    Timeline shows each step
#    Status bar animates

# 6. Review results in tabs
#    - Overview
#    - Candidates (AI-scored)
#    - Claude AI Analysis
#    - Timeline
#    - Raw Data

# 7. Export report (JSON format)
```

---

## 🔧 Common Issues & Fixes

### "Permission denied"
```bash
chmod +x run_claude_osint.sh
```

### "tkinter not found"
```bash
# Ubuntu/Debian
sudo apt install python3-tk

# Fedora
sudo dnf install python3-tkinter

# Arch
sudo pacman -S tk
```

### "requests not found"
```bash
pip3 install --user requests
# OR
python3 -m pip install --user requests
```

### GUI doesn't appear
```bash
# Check if tkinter works
python3 -m tkinter

# If using Wayland, try X11
export GDK_BACKEND=x11
./run_claude_osint.sh
```

### "Command not found: python3"
```bash
# Install Python
sudo apt install python3        # Ubuntu/Debian
sudo dnf install python3        # Fedora
sudo pacman -S python          # Arch
```

---

## 💡 Pro Tips

### Run from Anywhere
```bash
# Create alias
echo 'alias osint="~/path/to/run_claude_osint.sh"' >> ~/.bashrc
source ~/.bashrc

# Now run from anywhere
osint
```

### Better Results
- Fill in MORE fields = Better AI analysis
- Upload clear, front-facing photos
- Provide known usernames if available
- Include employer/school for verification

### Understanding AI Scores
- **90%+** = Very High Confidence (almost certainly correct)
- **75-89%** = High Confidence (very likely correct)
- **60-74%** = Medium Confidence (possible match, verify)
- **<60%** = Low Confidence (investigate further)

---

## 🎓 For Cybersecurity Students

### TryHackMe / HackTheBox Usage:
1. Run the tool: `./run_claude_osint.sh`
2. Input target information from your lab
3. Let Claude AI analyze and score
4. Export JSON report for documentation
5. Submit findings

### Kali Linux Users:
```bash
# Works out of the box!
./run_claude_osint.sh
```

### Parrot OS Users:
```bash
# May need tkinter
sudo apt install python3-tk
./run_claude_osint.sh
```

---

## 📊 Expected Performance

### Startup Time:
- First run: ~30 seconds (dependency checks)
- Subsequent runs: ~5 seconds

### Investigation Time:
- Name variations: 3-5 seconds (Claude AI)
- Image analysis: 8-15 seconds (Claude Vision)
- Per candidate scoring: 5-10 seconds (Claude AI)
- Intelligence report: 8-15 seconds (Claude AI)
- **Total: ~1-2 minutes for complete investigation**

### Network Usage:
- API calls: ~5-10 KB per request
- Total per investigation: ~50-100 KB
- Image upload: + image file size

---

## 🔒 Privacy Notes

### What Goes to Claude AI:
- Target name and details you enter
- Uploaded images (if you choose to upload)
- Search results for AI to analyze

### What Stays Local:
- Investigation results (JSON files)
- Timeline logs  
- All UI data
- Your search history

**Recommendation:** Only use on authorized targets.

---

## 📁 File Locations

### Scripts:
```
./run_claude_osint.sh         - Main launcher
./install_dependencies.sh     - Dependency installer
./osint_claude_ai.py         - The OSINT tool
```

### Generated Files:
```
./claude_ai_osint_*.json     - Investigation reports
```

### Logs:
All logging happens in the GUI timeline tab.

---

## 🎉 You're Ready!

```bash
# Run this now:
./run_claude_osint.sh
```

**Enjoy real AI-powered OSINT on Linux!** 🤖🐧

---

**Questions?** Check README_LINUX.md for full documentation.
