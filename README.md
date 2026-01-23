# 🐧 Linux Bash Scripts

A curated collection of Bash scripts for Linux system administration, monitoring, and workflow automation. This repository serves as a toolkit for quick system diagnostics and git management.

## 📂 Repository Contents

### 1. System Information Tools (`/system-info`)
Comprehensive scripts to gather and display hardware and software details.

| Script Name | Description | Output Style |
|:--- |:--- |:--- |
| **`system_info_colorfull.sh`** | Displays a full system dashboard (OS, CPU, RAM, GPU, Network) | ✨ Colorful ANSI |
| **`system_info.sh`** | Standard text-based system information report | 📄 Plain Text |
| **`CPU_info_colorfull.sh`** | Detailed CPU analysis and specifications | ✨ Colorful ANSI |
| **`CPU_info.sh`** | Standard text-based CPU details | 📄 Plain Text |

### 2. Utilities
| Script Name | Description |
|:--- |:--- |
| **`push.sh`** | Automates the Git workflow. Adds all changes, commits with a custom message + timestamp, and pushes to `main`. |

---

## 🚀 Getting Started

### Prerequisites
These scripts utilize standard Linux commands. Ensure you have the following installed (most come pre-installed on modern distros):
*   `bash`
*   `lscpu` (part of `util-linux`)
*   `lspci` (part of `pciutils`)
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
    chmod +x push.sh system-info/*.sh
    ```

---

## 💻 Usage

### Running System Info
Get a quick overview of your system:
```bash
./system-info/system_info_colorfull.sh
```

### Git Automation (`push.sh`)
Simplify your git push process:
```bash
./push.sh
```
*Prompts for a commit message, appends the current timestamp, and pushes to origin/main.*

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