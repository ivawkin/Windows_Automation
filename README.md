# 🖥️ Windows Setup Automation with PowerShell

Welcome! This is a simple PowerShell script I put together to help automate the basic setup of a Windows machine. 

I’m currently learning cybersecurity and working toward a role in IT support. This project is one of the ways I’m building real, practical skills—and showing that I can hit the ground running in a helpdesk or tech support position.

It's simple, but it solves a real-world problem, and it was fun to build!

If you're like me—setting up fresh installs, helping friends or coworkers, or just want to save time doing the same manual tasks over and over—this project might be for you. It installs essential software, tweaks a few settings, and makes your system ready to use in just a few minutes.

---

## 🚀 What This Script Does

Here's a quick rundown of what this script handles:

- ✅ Creates a system restore point before making changes (just in case)
- 💻 Installs some must-have apps using [Chocolatey](https://chocolatey.org/)
  - Firefox, Notepad++, VLC, 7-Zip, Git, and VS Code
- ⚙️ Makes a couple of useful system tweaks:
  - Disables Cortana (less distraction)
  - Makes file extensions visible in File Explorer (super handy for troubleshooting)

---

## 🧰 Tools & Tech Used

- PowerShell
- Chocolatey (for package management)
- Windows Registry (for system tweaks)

---

## 📥 How to Use This Script

1. **Download the script** (or clone this repo)
2. **Open PowerShell as Administrator**
   - Search for "PowerShell" in Start, right-click, and choose "Run as administrator"
3. **Allow scripts to run temporarily** with this command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
