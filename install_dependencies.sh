#!/bin/bash
# Dependency installer for OSINT Investigator Claude AI
# Supports major Linux distributions

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  OSINT Investigator - Dependency Installer                    ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Detect distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    ID=$ID
else
    echo -e "${RED}[✗]${NC} Cannot detect Linux distribution"
    exit 1
fi

echo -e "${BLUE}[*]${NC} Detected: $OS"
echo ""

# Install based on distro
case $ID in
    ubuntu|debian|linuxmint|pop)
        echo -e "${BLUE}[*]${NC} Installing for Debian/Ubuntu-based system..."
        sudo apt update
        sudo apt install -y python3 python3-pip python3-tk
        ;;
    
    fedora|rhel|centos)
        echo -e "${BLUE}[*]${NC} Installing for Fedora/RHEL-based system..."
        sudo dnf install -y python3 python3-pip python3-tkinter || \
        sudo yum install -y python3 python3-pip python3-tkinter
        ;;
    
    arch|manjaro)
        echo -e "${BLUE}[*]${NC} Installing for Arch-based system..."
        sudo pacman -S --noconfirm python python-pip tk
        ;;
    
    kali)
        echo -e "${BLUE}[*]${NC} Installing for Kali Linux..."
        sudo apt update
        sudo apt install -y python3 python3-pip python3-tk
        ;;
    
    parrot)
        echo -e "${BLUE}[*]${NC} Installing for Parrot OS..."
        sudo apt update
        sudo apt install -y python3 python3-pip python3-tk
        ;;
    
    *)
        echo -e "${YELLOW}[!]${NC} Unknown distribution: $ID"
        echo "Please install manually:"
        echo "  - Python 3.7+"
        echo "  - pip for Python 3"
        echo "  - tkinter for Python 3"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[✓]${NC} System packages installed"
else
    echo -e "${RED}[✗]${NC} Failed to install system packages"
    exit 1
fi

# Install Python packages
echo ""
echo -e "${BLUE}[*]${NC} Installing Python packages..."

python3 -m pip install --user --upgrade pip
python3 -m pip install --user requests

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[✓]${NC} Python packages installed"
else
    echo -e "${YELLOW}[!]${NC} Warning: pip install had issues"
    echo "Try manually: pip3 install --user requests"
fi

# Verify installation
echo ""
echo -e "${BLUE}[*]${NC} Verifying installation..."

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VER=$(python3 --version)
    echo -e "${GREEN}[✓]${NC} Python: $PYTHON_VER"
else
    echo -e "${RED}[✗]${NC} Python3 not found"
fi

# Check tkinter
python3 -c "import tkinter" 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[✓]${NC} tkinter: Installed"
else
    echo -e "${RED}[✗]${NC} tkinter: Not found"
fi

# Check requests
python3 -c "import requests" 2>/dev/null
if [ $? -eq 0 ]; then
    REQ_VER=$(python3 -c "import requests; print(requests.__version__)")
    echo -e "${GREEN}[✓]${NC} requests: v$REQ_VER"
else
    echo -e "${RED}[✗]${NC} requests: Not found"
fi

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  Installation Complete!                                       ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "Run the tool with: ./run_claude_osint.sh"
echo ""
