#!/bin/bash
# Borderize Demo Script - Comprehensive demonstration of all borderize functions
# Shows every feature and use case with visual examples

# Color definitions for demo narration
DEMO_COLOR='\033[1;36m'  # Cyan for demo text
INFO_COLOR='\033[1;33m'   # Yellow for info
SUCCESS_COLOR='\033[1;32m' # Green for success
NC='\033[0m'              # No Color

# Demo configuration
DELAY_SHORT=1.5
DELAY_MEDIUM=2.5
DELAY_LONG=3.5
TYPING_DELAY=0.03

# Check if borderize is available
check_borderize() {
    if ! command -v borderize >/dev/null 2>&1; then
        echo -e "${INFO_COLOR}Error: 'borderize' command not found in PATH${NC}"
        echo "Please ensure borderize is installed and accessible."
        exit 1
    fi
}

# Typewriter effect for demo narration
demo_print() {
    local text="$1"
    local delay="${2:-$TYPING_DELAY}"
    
    echo -ne "${DEMO_COLOR}"
    for (( i=0; i<${#text}; i++ )); do
        printf "%c" "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "${NC}"
}

# Show command being executed
show_command() {
    local cmd="$1"
    echo -e "\n${INFO_COLOR}Command: ${NC}${cmd}"
    echo -e "${INFO_COLOR}$(printf '─%.0s' {1..60})${NC}"
}

# Demo section header
demo_header() {
    local title="$1"
    clear
    echo -e "\n${SUCCESS_COLOR}╭$(printf '─%.0s' {1..70})╮${NC}"
    printf "${SUCCESS_COLOR}│${NC} %-68s ${SUCCESS_COLOR}│${NC}\n" "$title"
    echo -e "${SUCCESS_COLOR}╰$(printf '─%.0s' {1..70})╯${NC}\n"
    sleep "$DELAY_SHORT"
}

# Demo 1: Basic Usage
demo_basic_usage() {
    demo_header "DEMO 1: Basic Usage - Default Green Border"
    
    demo_print "Let's start with the simplest usage - piping text to borderize:"
    show_command 'echo "Hello, Borderize!" | borderize'
    echo "Hello, Borderize!" | borderize
    sleep "$DELAY_MEDIUM"
    
    demo_print "Multi-line text works perfectly:"
    show_command 'echo -e "Line 1\nLine 2\nLine 3" | borderize'
    echo -e "Line 1\nLine 2\nLine 3" | borderize
    sleep "$DELAY_MEDIUM"
    
    demo_print "Using the -t flag for direct text input:"
    show_command 'borderize -t "Direct text input"'
    borderize -t "Direct text input"
    sleep "$DELAY_LONG"
}

# Demo 2: Color Customization
demo_colors() {
    demo_header "DEMO 2: Color Customization - Hex Color Codes"
    
    demo_print "Red border with default text:"
    show_command 'echo "Red border example" | borderize -FF0000'
    echo "Red border example" | borderize -FF0000
    sleep "$DELAY_MEDIUM"
    
    demo_print "Blue border with yellow text:"
    show_command 'echo "Blue border, yellow text" | borderize -0066FF -FFFF00'
    echo "Blue border, yellow text" | borderize -0066FF -FFFF00
    sleep "$DELAY_MEDIUM"
    
    demo_print "Purple border with cyan text:"
    show_command 'borderize -t "Purple and cyan combo" -9932CC -00FFFF'
    borderize -t "Purple and cyan combo" -9932CC -00FFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Gold border with white text:"
    show_command 'echo "Luxury colors" | borderize -FFD700 -FFFFFF'
    echo "Luxury colors" | borderize -FFD700 -FFFFFF
    sleep "$DELAY_LONG"
}

# Demo 3: Command Output
demo_command_output() {
    demo_header "DEMO 3: Command Output Borderization"
    
    demo_print "Borderizing 'date' command output:"
    show_command 'borderize -c "date" -00FFFF'
    borderize -c "date" -00FFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Borderizing 'uname -a' with custom colors:"
    show_command 'borderize -c "uname -a" -FF6B35 -FFFFFF'
    borderize -c "uname -a" -FF6B35 -FFFFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Borderizing directory listing:"
    show_command 'borderize -c "ls -la /tmp | head -5" -32CD32 -000000'
    borderize -c "ls -la /tmp | head -5" -32CD32 -000000
    sleep "$DELAY_MEDIUM"
    
    demo_print "System information with borderize:"
    show_command 'borderize -c "whoami && hostname" -FF1493 -00CED1'
    borderize -c "whoami && hostname" -FF1493 -00CED1
    sleep "$DELAY_LONG"
}

# Demo 4: File Input
demo_file_input() {
    demo_header "DEMO 4: File Input Processing"
    
    # Create temporary demo files
    local temp_file="/tmp/borderize_demo.txt"
    
    demo_print "Creating a sample file for demonstration..."
    cat > "$temp_file" << 'EOF'
This is a sample file
containing multiple lines
that will be borderized
with custom styling.

File input is very useful
for README files, configs,
or any text document!
EOF
    
    demo_print "Borderizing file content with orange border:"
    show_command "borderize \"$temp_file\" -FF8C00"
    borderize "$temp_file" -FF8C00
    sleep "$DELAY_MEDIUM"
    
    demo_print "Same file with different colors:"
    show_command "borderize \"$temp_file\" -8A2BE2 -F0E68C"
    borderize "$temp_file" -8A2BE2 -F0E68C
    sleep "$DELAY_MEDIUM"
    
    # Cleanup
    rm -f "$temp_file"
    sleep "$DELAY_LONG"
}

# Demo 5: Advanced Color Combinations
demo_advanced_colors() {
    demo_header "DEMO 5: Advanced Color Combinations & Themes"
    
    demo_print "Matrix theme (green on black):"
    show_command 'echo "MATRIX THEME" | borderize -00FF00 -000000'
    echo "MATRIX THEME" | borderize -00FF00 -000000
    sleep "$DELAY_MEDIUM"
    
    demo_print "Sunset theme (orange/pink gradient feel):"
    show_command 'echo "SUNSET VIBES" | borderize -FF4500 -FFB6C1'
    echo "SUNSET VIBES" | borderize -FF4500 -FFB6C1
    sleep "$DELAY_MEDIUM"
    
    demo_print "Ocean theme (blue/cyan):"
    show_command 'echo "OCEAN DEPTH" | borderize -1E90FF -00FFFF'
    echo "OCEAN DEPTH" | borderize -1E90FF -00FFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Fire theme (red/yellow):"
    show_command 'echo "BLAZING FIRE" | borderize -DC143C -FFFF00'
    echo "BLAZING FIRE" | borderize -DC143C -FFFF00
    sleep "$DELAY_MEDIUM"
    
    demo_print "Neon theme (magenta/lime):"
    show_command 'echo "NEON LIGHTS" | borderize -FF00FF -00FF00'
    echo "NEON LIGHTS" | borderize -FF00FF -00FF00
    sleep "$DELAY_LONG"
}

# Demo 6: Practical Use Cases
demo_practical_usage() {
    demo_header "DEMO 6: Practical Use Cases & Real-World Examples"
    
    demo_print "Error message formatting:"
    show_command 'echo "ERROR: Operation failed!" | borderize -FF0000 -FFFFFF'
    echo "ERROR: Operation failed!" | borderize -FF0000 -FFFFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Success message formatting:"
    show_command 'echo "SUCCESS: Task completed!" | borderize -00FF00 -000000'
    echo "SUCCESS: Task completed!" | borderize -00FF00 -000000
    sleep "$DELAY_MEDIUM"
    
    demo_print "Warning message formatting:"
    show_command 'echo "WARNING: Check configuration" | borderize -FFAA00 -000000'
    echo "WARNING: Check configuration" | borderize -FFAA00 -000000
    sleep "$DELAY_MEDIUM"
    
    demo_print "Information display:"
    show_command 'echo -e "Server Status:\nCPU: 45%\nRAM: 67%\nDisk: 23%" | borderize -87CEEB -000080'
    echo -e "Server Status:\nCPU: 45%\nRAM: 67%\nDisk: 23%" | borderize -87CEEB -000080
    sleep "$DELAY_MEDIUM"
    
    demo_print "Configuration summary:"
    show_command 'borderize -c "env | grep USER" -DAA520 -FFFFFF'
    borderize -c "env | grep USER" -DAA520 -FFFFFF
    sleep "$DELAY_LONG"
}

# Demo 7: Complex Multi-line Content
demo_complex_content() {
    demo_header "DEMO 7: Complex Multi-line Content & ASCII Art"
    
    demo_print "ASCII art with borderize:"
    show_command 'echo -e "  ╔══════════╗\n  ║ BORDERED ║\n  ║   TEXT   ║\n  ╚══════════╝" | borderize -9370DB -F0F8FF'
    echo -e "  ╔══════════╗\n  ║ BORDERED ║\n  ║   TEXT   ║\n  ╚══════════╝" | borderize -9370DB -F0F8FF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Code snippet formatting:"
    local code_snippet="function hello() {
    echo 'Hello, World!'
    return 0
}"
    show_command 'echo "$code_snippet" | borderize -2F4F4F -98FB98'
    echo "$code_snippet" | borderize -2F4F4F -98FB98
    sleep "$DELAY_MEDIUM"
    
    demo_print "Menu-style formatting:"
    local menu="MAIN MENU
---------
1. Start Application
2. View Settings  
3. Run Diagnostics
4. Exit Program"
    show_command 'echo "$menu" | borderize -4B0082 -FFE4E1'
    echo "$menu" | borderize -4B0082 -FFE4E1
    sleep "$DELAY_LONG"
}

# Demo 8: Interactive Mode
demo_interactive_mode() {
    demo_header "DEMO 8: Interactive Mode Demonstration"
    
    demo_print "Interactive mode allows you to type/paste content and press Ctrl+D to finish."
    demo_print "We'll simulate this with pre-written content:"
    sleep "$DELAY_MEDIUM"
    
    demo_print "Simulating interactive input with violet theme:"
    show_command 'echo -e "This is interactive content\nType as much as you want\nPress Ctrl+D when done" | borderize -8B00FF -E6E6FA'
    echo -e "This is interactive content\nType as much as you want\nPress Ctrl+D when done" | borderize -8B00FF -E6E6FA
    sleep "$DELAY_LONG"
}

# Demo 9: Integration Examples
demo_integration() {
    demo_header "DEMO 9: Integration with Other Tools"
    
    demo_print "Integration with system monitoring:"
    show_command 'echo "System Load: $(uptime | cut -d":" -f4-)" | borderize -FF6347 -FFF8DC'
    echo "System Load: $(uptime | cut -d':' -f4-)" | borderize -FF6347 -FFF8DC
    sleep "$DELAY_MEDIUM"
    
    demo_print "Integration with file operations:"
    show_command 'echo "Files in /tmp: $(ls /tmp | wc -l)" | borderize -20B2AA -F5FFFA'
    echo "Files in /tmp: $(ls /tmp | wc -l)" | borderize -20B2AA -F5FFFA
    sleep "$DELAY_MEDIUM"
    
    demo_print "Integration with date/time:"
    show_command 'echo -e "Current Time\n$(date +"%Y-%m-%d %H:%M:%S")\nTimezone: $(date +"%Z")" | borderize -B8860B -FFFACD'
    echo -e "Current Time\n$(date +'%Y-%m-%d %H:%M:%S')\nTimezone: $(date +'%Z')" | borderize -B8860B -FFFACD
    sleep "$DELAY_LONG"
}

# Demo 10: Performance and Edge Cases
demo_edge_cases() {
    demo_header "DEMO 10: Edge Cases & Special Scenarios"
    
    demo_print "Empty lines handling:"
    show_command 'echo -e "Line 1\n\nLine 3\n\nLine 5" | borderize -FF69B4 -FFFFFF'
    echo -e "Line 1\n\nLine 3\n\nLine 5" | borderize -FF69B4 -FFFFFF
    sleep "$DELAY_MEDIUM"
    
    demo_print "Very long single line:"
    local long_line="This is a very long line that demonstrates how borderize handles extended content that might wrap in terminals with different widths and configurations."
    show_command 'echo "$long_line" | borderize -8FBC8F -000000'
    echo "$long_line" | borderize -8FBC8F -000000
    sleep "$DELAY_MEDIUM"
    
    demo_print "Mixed width content:"
    show_command 'echo -e "Short\nMedium length line\nThis is a much longer line with more content" | borderize -DDA0DD -2F2F2F'
    echo -e "Short\nMedium length line\nThis is a much longer line with more content" | borderize -DDA0DD -2F2F2F
    sleep "$DELAY_LONG"
}

# Final demonstration summary
demo_summary() {
    demo_header "DEMO COMPLETE: Borderize Features Summary"
    
    local summary="BORDERIZE DEMONSTRATION COMPLETE!

Features Demonstrated:
✓ Basic text borderization
✓ Custom hex color codes (border + text)
✓ Command output processing
✓ File input handling
✓ Interactive mode capabilities
✓ Color theme combinations
✓ Practical use cases
✓ Integration examples
✓ Edge case handling

Borderize is ready for production use!"
    
    echo "$summary" | borderize -FFD700 -8B4513
    
    demo_print "\nThank you for watching the Borderize comprehensive demonstration!"
    echo -e "${SUCCESS_COLOR}All features have been successfully showcased.${NC}\n"
}

# Main demo execution function
main() {
    # Check prerequisites
    check_borderize
    
    # Welcome message
    clear
    demo_print "Welcome to the Borderize Comprehensive Demo!"
    demo_print "This demo will showcase all features and capabilities..."
    sleep "$DELAY_MEDIUM"
    
    # Run all demo sections
    demo_basic_usage
    demo_colors
    demo_command_output
    demo_file_input
    demo_advanced_colors
    demo_practical_usage
    demo_complex_content
    demo_interactive_mode
    demo_integration
    demo_edge_cases
    demo_summary
}

# Execution steps:
# 1. Check if borderize command is available in PATH
# 2. Display welcome message with typewriter effect
# 3. Run 10 comprehensive demo sections sequentially
# 4. Each section demonstrates specific borderize features
# 5. Show actual command syntax before execution
# 6. Apply realistic delays for presentation flow
# 7. Use color-coded narration for better UX
# 8. Create temporary files for file input demo
# 9. Clean up any temporary resources
# 10. Display final summary with all demonstrated features

# Execute the main demo
main "$@"