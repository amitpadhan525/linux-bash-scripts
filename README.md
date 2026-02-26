# 🐧 Linux Bash Scripts

A curated collection of Bash scripts for Linux system administration, monitoring, text processing practice, and workflow automation. This repository contains system diagnostic tools, bash scripting practice exercises, and git management utilities.

## 📂 Repository Structure

```
linux-bash-scripts/
├── push.sh                      # Git automation script
├── README.md                    # This file
├── practice_bash/               # Bash scripting practice exercises
│   ├── 01_echo_text.sh
│   ├── 02_third_character.sh
│   ├── 03_single_words.sh
│   ├── 04_word_count.sh
│   ├── 05_filter_a.sh
│   ├── 06_first_word_loop.sh
│   ├── 07_error_line_number.sh
│   ├── 08_error_log_parser.sh
│   ├── 09_first_word_simple.sh
│   └── 10_add_brackets.sh
└── system-info/                 # System monitoring scripts
    ├── CPU_info_colorfull.sh
    ├── CPU_info.sh
    ├── system_info_colorfull.sh
    └── system_info.sh
```

---

## 📋 Repository Contents

### 1. Git Automation (`push.sh`)
Located in the root directory, this utility streamlines the git workflow.

| Script Name | Description |
|:--- |:--- |
| **`push.sh`** | Automates git operations: prompts for a commit message, adds all changes, commits with timestamp, and pushes to `origin main` |

**Usage:**
```bash
./push.sh
```

---

### 2. Practice Bash Scripts (`/practice_bash`)
A collection of 10 bash scripting exercises focusing on text processing, input handling, and basic bash operations. These scripts demonstrate various bash techniques and are useful for learning and practicing bash scripting.

| Script Name | Description |
|:--- |:--- |
| **`01_echo_text.sh`** | Reads a line of text from input and echoes it back |
| **`02_third_character.sh`** | Reads a line of text and displays its third character using `cut` |
| **`03_single_words.sh`** | Reads multiple lines and displays only lines without spaces (single words) |
| **`04_word_count.sh`** | Reads a line of text and counts the number of words using `wc -w` |
| **`05_filter_a.sh`** | Reads N lines and displays only lines containing 'a' or 'A' |
| **`06_first_word_loop.sh`** | Reads lines in a loop and displays the first word of each line |
| **`07_error_line_number.sh`** | Reads lines, tracks line numbers, and displays line number + content for lines containing "ERROR" |
| **`08_error_log_parser.sh`** | Parses log lines (Date Level Message format) and displays Date + Message for ERROR level entries |
| **`09_first_word_simple.sh`** | Reads a single line and displays its first word |
| **`10_add_brackets.sh`** | Reads a line of text and displays it enclosed in square brackets |

**Usage Example:**
```bash
# Run any practice script
echo "Hello World Test" | ./practice_bash/01_echo_text.sh
echo "Hello World" | ./practice_bash/04_word_count.sh
```

---

### 3. System Information Tools (`/system-info`)
Comprehensive scripts to gather and display hardware and software details about your Linux system.

| Script Name | Description | Output Style |
|:--- |:--- |:--- |
| **`system_info_colorfull.sh`** | Displays a full system dashboard including OS, CPU, RAM, GPU, and Network information | ✨ Colorful ANSI |
| **`system_info.sh`** | Standard text-based system information report | 📄 Plain Text |
| **`CPU_info_colorfull.sh`** | Detailed CPU analysis and specifications | ✨ Colorful ANSI |
| **`CPU_info.sh`** | Standard text-based CPU details | 📄 Plain Text |

**Usage Example:**
```bash
# Display colorful system information
./system-info/system_info_colorfull.sh

# Display plain CPU information
./system-info/CPU_info.sh
```

---

## 🚀 Getting Started

### Prerequisites
These scripts utilize standard Linux commands. Ensure you have the following installed (most come pre-installed on modern distros):
*   `bash`
*   `lscpu` (part of `util-linux`)
*   `lspci` (part of `pciutils`)
*   `cut`, `wc`, `grep`, `echo`, `read` (standard GNU utilities)
*   `git` (for `push.sh`)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/amitpadhan525/linux-bash-scripts.git
    cd linux-bash-scripts
    ```

2.  **Make scripts executable:**
    You must grant execute permissions to the scripts before running them.
    ```bash
    chmod +x push.sh
    chmod +x practice_bash/*.sh
    chmod +x system-info/*.sh
    ```

---

## 💻 Usage

### Git Automation
Simplify your git push process:
```bash
./push.sh
```
*Prompts for a commit message, appends the current timestamp (YYYY-MM-DD HH:MM:SS), and pushes to origin/main.*

### Practice Bash Scripting
Run any of the practice scripts to test bash text processing:
```bash
# Echo text
echo "Hello Bash" | ./practice_bash/01_echo_text.sh

# Count words
echo "One Two Three Four" | ./practice_bash/04_word_count.sh

# Filter lines with 'a'
printf "Apple\nBerry\nCherry\nDate\n" | ./practice_bash/05_filter_a.sh
```

### System Monitoring
Get a quick overview of your system:
```bash
# Colorful system dashboard
./system-info/system_info_colorfull.sh

# Colorful CPU information
./system-info/CPU_info_colorfull.sh
```

---

## 🤝 Contributing
Contributions are welcome! If you have a useful script to add:
1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature-new-script`).
3.  Commit your changes.
4.  Push to the branch.
5.  Open a Pull Request.

---

## 📝 License
This project is open-source and available for personal and educational use.