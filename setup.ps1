# Description: Automates common post-installation tasks for a new Windows machine

# Check for admin rights first of all
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You need to run this script as Administrator!"
    exit
}

Write-Host "Starting setup..." -ForegroundColor Green

# Create a system restore point
Checkpoint-Computer -Description "Pre-Setup Restore Point" -RestorePointType "MODIFY_SETTINGS"

# Install Chocolatey if not present
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..." -ForegroundColor Cyan
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey already installed." -ForegroundColor Yellow
}

# Install common software
$packages = @(
    "firefox",
    "notepadplusplus",
    "vlc",
    "7zip",
    "git",
    "visualstudiocode"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..." -ForegroundColor White
    choco install $package -y
}

# Configure basic settings
Write-Host "Disabling Cortana..." -ForegroundColor Cyan
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -PropertyType DWORD -Force

Write-Host "Showing file extensions in File Explorer..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

Write-Host "Setup complete! You are ready to go!" -ForegroundColor Green
