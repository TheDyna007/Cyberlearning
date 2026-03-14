#!/bin/bash
# Claude AI OSINT Tool Launcher for Linux
# Prevents terminal from closing on error

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║   OSINT INVESTIGATOR PRO v6.0 - CLAUDE AI                     ║"
echo "║   Real Claude Sonnet 4 Integration + Animated UI              ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for Python
echo -e "${BLUE}[*]${NC} Checking for Python..."
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
    echo -e "${GREEN}[✓]${NC} Python3 found"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
    echo -e "${GREEN}[✓]${NC} Python found"
else
    echo -e "${RED}[✗]${NC} Python not found!"
    echo ""
    echo "Please install Python 3.7+:"
    echo "  Ubuntu/Debian: sudo apt install python3 python3-pip python3-tk"
    echo "  Fedora/RHEL:   sudo dnf install python3 python3-pip python3-tkinter"
    echo "  Arch:          sudo pacman -S python python-pip tk"
    echo ""
    read -p "Press Enter to exit..."
    exit 1
fi

# Check Python version
PYTHON_VERSION=$($PYTHON_CMD -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo -e "${BLUE}[*]${NC} Python version: $PYTHON_VERSION"

# Check for tkinter
echo -e "${BLUE}[*]${NC} Checking for tkinter..."
$PYTHON_CMD -c "import tkinter" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}[!]${NC} tkinter not found. Installing..."
    
    # Detect distro and install tkinter
    if [ -f /etc/debian_version ]; then
        echo "Detected Debian/Ubuntu"
        sudo apt-get update
        sudo apt-get install -y python3-tk
    elif [ -f /etc/redhat-release ]; then
        echo "Detected RHEL/Fedora/CentOS"
        sudo dnf install -y python3-tkinter || sudo yum install -y python3-tkinter
    elif [ -f /etc/arch-release ]; then
        echo "Detected Arch Linux"
        sudo pacman -S --noconfirm tk
    else
        echo -e "${RED}[!]${NC} Could not detect distro. Please install tkinter manually:"
        echo "  Ubuntu/Debian: sudo apt install python3-tk"
        echo "  Fedora/RHEL:   sudo dnf install python3-tkinter"
        echo "  Arch:          sudo pacman -S tk"
        read -p "Press Enter to continue anyway..."
    fi
else
    echo -e "${GREEN}[✓]${NC} tkinter found"
fi

# Check for requests library
echo -e "${BLUE}[*]${NC} Checking for requests library..."
$PYTHON_CMD -c "import requests" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}[!]${NC} Installing requests library..."
    $PYTHON_CMD -m pip install --user requests
    if [ $? -ne 0 ]; then
        echo -e "${RED}[✗]${NC} Failed to install requests"
        echo "Try manually: pip3 install --user requests"
        read -p "Press Enter to exit..."
        exit 1
    fi
    echo -e "${GREEN}[✓]${NC} Requests installed"
else
    echo -e "${GREEN}[✓]${NC} Requests found"
fi

echo ""
echo -e "${GREEN}[✓]${NC} All dependencies OK"
echo ""
echo -e "${BLUE}[*]${NC} Starting Claude AI OSINT Tool..."
echo ""

# Make the Python script executable if not already
chmod +x osint_claude_ai.py 2>/dev/null

# Run the tool and capture exit code
$PYTHON_CMD osint_claude_ai.py
EXIT_CODE=$?

# Handle errors
if [ $EXIT_CODE -ne 0 ]; then
    echo ""
    echo -e "${RED}[!]${NC} Tool exited with error code: $EXIT_CODE"
    echo ""
    
    if [ $EXIT_CODE -eq 127 ]; then
        echo "Python script not found. Make sure osint_claude_ai.py is in the same directory."
    elif [ $EXIT_CODE -eq 1 ]; then
        echo "The tool encountered an error. Check the output above for details."
    fi
    
    echo ""
    read -p "Press Enter to exit..."
    exit $EXIT_CODE
fi

echo ""
echo -e "${GREEN}[✓]${NC} Tool closed successfully"
