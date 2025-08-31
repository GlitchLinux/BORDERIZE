# 🎨 BORDERIZE - Beautiful Terminal Text Borders

Transform your terminal output with stunning colored borders! A lightweight, dependency-free bash utility that makes your scripts, logs, and command outputs visually organized and eye-catching.

![Version](https://img.shields.io/badge/version-2.0-brightgreen)
![Bash](https://img.shields.io/badge/bash-5.0%2B-blue)
![License](https://img.shields.io/badge/license-MIT-purple)

<img width="745" height="241" alt="borderize-figlet2" src="https://github.com/user-attachments/assets/93261655-152a-4854-85d8-2de9c900955a" />

## ✨ Features

- 🚀 **Instant beautification** - Pipe any text or command through borderize
- 🎨 **Dual color support** - Customize both border AND text colors
- 🌈 **16.7 million colors** - Full 24-bit color (hex code) support
- 📦 **Zero dependencies** - Pure bash, works everywhere
- ⚡ **Lightning fast** - No overhead, instant rendering
- 🔧 **Multiple input modes** - Pipe, file, text, or interactive
- 💻 **System-wide installation** - One command to rule them all

### Basic Usage
```bash
# Simple text with default green border
echo "Hello World" | borderize | lolcat
```

<img width="407" height="129" alt="lolcat-borderize" src="https://github.com/user-attachments/assets/95a655d1-f96d-45cd-94fe-dd4fb72a29a6" />

```bash
# Custom border color (hex)
echo "Warning!" | borderize -FF0000
```

<img width="254" height="107" alt="borderize-warning" src="https://github.com/user-attachments/assets/bed008cd-edd3-457a-9c57-0489571f8c92" />


## 📥 Installation

### Quick Install (One-liner)
```bash
sudo curl -L https://raw.githubusercontent.com/GlitchLinux/BORDERIZE/refs/heads/main/borderize -o /usr/local/bin/borderize && sudo chmod +x /usr/local/bin/borderize
```

### Manual Install
```bash
# Download the script
wget https://raw.githubusercontent.com/GlitchLinux/BORDERIZE/refs/heads/main/borderize

# Make it executable
chmod +x borderize

# Move to PATH
sudo mv borderize /usr/local/bin/

# Verify installation
borderize --help
```
## 🎯 Usage Examples

### Command Output Styling
```bash
# System information with style
uname -a | borderize -ffffff -FF00B8
```

<img width="1812" height="89" alt="uname-borderize" src="https://github.com/user-attachments/assets/5aaed7c0-ded1-4afa-aa39-791f7a7a9c03" />

```bash
# Disk usage with gold border
df -h | borderize -FFD700
```

<img width="1052" height="244" alt="borderize-diskusage" src="https://github.com/user-attachments/assets/d1f61214-f1c4-421b-a0c7-8a37938deb25" />

### Combine with Other Tools

```bash
# With figlet and lolcat for ASCII art
figlet -f smslant BORDERIZE | borderize-neon | lolcat
```

<img width="662" height="338" alt="lolcat+figlet" src="https://github.com/user-attachments/assets/2dc5e948-6bec-4389-b7ac-debe05fe2771" />

```bash
# Multi-line text
borderize -t "Line 1\nLine 2\nLine 3" -00FF00
```

<img width="183" height="175" alt="line-borderize" src="https://github.com/user-attachments/assets/e6f12279-03f9-42c4-b832-6244f35036d4" />

### Command Mode
```bash
# Execute and borderize
borderize -c "date" -FF00FF

# Complex commands
borderize -c "ls -la | head -5" -00FFFF -FFFF00
```

### File Input
```bash
# Borderize file contents
borderize /etc/hostname -FFA500

# With custom colors
cat /etc/os-release | borderize -567645 -443893
```

### Interactive Mode
```bash
# Start interactive mode
borderize

# With custom colors
borderize -FF1493 -00CED1

# Type or paste text, press Ctrl+D to apply border
```

## 🎨 Color Schemes

### Pre-defined Themes
```bash
# Create aliases in ~/.bashrc
alias borderize-neon='borderize -FF00FF -00FFFF'
alias borderize-matrix='borderize -00FF00 -32CD32'
alias borderize-fire='borderize -FF4500 -FFFF00'
alias borderize-ocean='borderize -0080FF -00CED1'
alias borderize-royal='borderize -800080 -FFD700'
alias borderize-dark='borderize -333333 -FFFFFF'
```

### Popular Color Combinations

| Style | Command | Description |
|-------|---------|-------------|
| **Error** | `-FF0000 -FFFFFF` | Red border, white text |
| **Success** | `-00FF00 -FFFFFF` | Green border, white text |
| **Warning** | `-FFA500 -FFFF00` | Orange border, yellow text |
| **Info** | `-0080FF -FFFFFF` | Blue border, white text |
| **Neon** | `-FF00FF -00FFFF` | Magenta border, cyan text |
| **Matrix** | `-00FF00 -32CD32` | Green border, lime text |
| **Gold** | `-FFD700 -FFFFFF` | Gold border, white text |
| **Ocean** | `-00CED1 -0080FF` | Turquoise border, blue text |

## 📚 Advanced Usage

### In Scripts
```bash
#!/bin/bash

# Status messages with semantic colors
echo "✓ Task completed" | borderize -00FF00 -FFFFFF
echo "⚠ Warning: Low disk space" | borderize -FFA500 -FFFF00
echo "✗ Error: Connection failed" | borderize -FF0000 -FFFFFF

# Section headers
echo "=== BACKUP STARTING ===" | borderize -00CED1
perform_backup
echo "=== BACKUP COMPLETE ===" | borderize -00FF00
```

### System Monitoring
```bash
#!/bin/bash
# monitoring.sh

echo "SYSTEM STATUS" | borderize -FFD700 -FFFFFF
uptime | borderize -00FFFF
echo ""
echo "MEMORY USAGE" | borderize -FFD700 -FFFFFF
free -h | borderize -00FFFF
echo ""
echo "DISK USAGE" | borderize -FFD700 -FFFFFF
df -h | borderize -00FFFF
```

### Git Hooks
```bash
# .git/hooks/pre-commit
#!/bin/bash
echo "Running pre-commit checks..." | borderize -FFFF00
```

### Log Monitoring
```bash
# Highlight errors in real-time
tail -f /var/log/syslog | grep ERROR | borderize -FF0000 -FFFFFF
```

## 🔧 Options Reference

| Option | Description | Example |
|--------|-------------|---------|
| `-h, --help` | Show help message | `borderize --help` |
| `-t "text"` | Borderize given text | `borderize -t "Hello"` |
| `-c command` | Execute and borderize command | `borderize -c "ls -la"` |
| `-RRGGBB` | Set border color (hex) | `borderize -FF0000` |
| `-RRGGBB` (2nd) | Set text color (hex) | `borderize -FF0000 -FFFFFF` |

## 🎯 Features in Detail

### Dynamic Border Detection
- Automatically adjusts border width to fit content
- Detects variables (`$`) and uses open-ended borders with ❖ symbols
- Fixed borders for static content with proper corner characters

### Color Support
- **24-bit true color** - Use any hex color code
- **Dual color mode** - Separate colors for border and text
- **Fallback support** - Defaults to green if invalid hex provided

### Input Methods
1. **Pipe**: `command | borderize`
2. **File**: `borderize filename.txt`
3. **Direct text**: `borderize -t "text"`
4. **Command execution**: `borderize -c "command"`
5. **Interactive**: Just run `borderize`

## 💡 Tips & Tricks

### Quick Testing
```bash
# Test color combinations quickly
echo "TEST" | borderize -$(openssl rand -hex 3) -$(openssl rand -hex 3)
```

### Watch Commands
```bash
# Monitor with borders updating every 2 seconds
watch -n 2 'df -h | borderize -00FFFF'
```

### MOTD (Message of the Day)
```bash
# Add to /etc/update-motd.d/
echo "Welcome to $(hostname)" | borderize -00CED1 -FFFFFF
```

## 📋 Requirements

- Bash 4.0+ (for associative arrays and modern features)
- Terminal with 24-bit color support (most modern terminals)
- Unix-like system (Linux, macOS, WSL)

## 🐛 Troubleshooting

### Colors not showing?
- Ensure your terminal supports 24-bit colors
- Try: `echo -e "\033[38;2;255;0;0mRed Text\033[0m"`

### Command not found?
- Verify installation: `which borderize`
- Check PATH: `echo $PATH | grep -q /usr/local/bin && echo "OK"`

### Interactive mode issues?
- Make sure to press `Ctrl+D` on a new line
- Use `Ctrl+C` to cancel

## 🤝 Contributing

Found a bug or have a feature idea? Contributions are welcome!

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📜 License

MIT License - feel free to use in your projects!

## 🚀 What's Next?

- [ ] Add more border styles (double, dotted, ASCII art)
- [ ] Background color support
- [ ] Animation effects
- [ ] Config file support for saved themes
- [ ] Multi-box layouts

---

**Make your terminal output beautiful!** 🎨

If you find this useful, give it a ⭐ on [GitHub](https://github.com/GlitchLinux/BORDERIZE)!
