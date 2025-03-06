# Set variables
$pyenvUrl = "https://github.com/pyenv-win/pyenv-win/archive/refs/heads/master.zip"
$pyenvRoot = "$HOME\.pyenv"
$pyenvDownload = "$HOME\Downloads\pyenv-win.zip"
$pyenvExtracted = "$HOME\Downloads\pyenv-win-master"

# Download pyenv-win only if it does not exist
if (!(Test-Path $pyenvDownload)) {
    Write-Host "Downloading pyenv-win..."
    Invoke-WebRequest -Uri $pyenvUrl -OutFile $pyenvDownload
} else {
    Write-Host "Download already exists, skipping..."
}

# Create .pyenv directory if it doesn't exist
if (!(Test-Path $pyenvRoot)) {
    Write-Host "Creating .pyenv directory..."
    New-Item -ItemType Directory -Path $pyenvRoot | Out-Null
} else {
    Write-Host ".pyenv directory already exists, skipping..."
}

# Extract the ZIP file if not already extracted
if (!(Test-Path $pyenvExtracted)) {
    Write-Host "Extracting pyenv-win..."
    Expand-Archive -Path $pyenvDownload -DestinationPath "$HOME\Downloads" -Force
} else {
    Write-Host "pyenv-win already extracted, skipping..."
}

# Move pyenv-win folder only if it doesn't already exist
if (!(Test-Path "$pyenvRoot\pyenv-win")) {
    Write-Host "Moving pyenv-win files..."
    Move-Item -Path "$pyenvExtracted\pyenv-win" -Destination $pyenvRoot -Force
} else {
    Write-Host "pyenv-win folder already exists, skipping..."
}

# Move .version file only if it doesn't exist
if (!(Test-Path "$pyenvRoot\.version")) {
    Write-Host "Moving .version file..."
    Move-Item -Path "$pyenvExtracted\.version" -Destination $pyenvRoot -Force
} else {
    Write-Host ".version file already exists, skipping..."
}

# Set environment variables only if not already set
if ([System.Environment]::GetEnvironmentVariable('PYENV', "User") -ne "$pyenvRoot\pyenv-win") {
    Write-Host "Setting environment variables..."
    [System.Environment]::SetEnvironmentVariable('PYENV', "$pyenvRoot\pyenv-win", "User")
    [System.Environment]::SetEnvironmentVariable('PYENV_HOME', "$pyenvRoot\pyenv-win", "User")
} else {
    Write-Host "Environment variables already set, skipping..."
}

# Add pyenv to PATH only if it's not already in PATH
$existingPath = [System.Environment]::GetEnvironmentVariable('Path', "User")
if ($existingPath -notlike "*$pyenvRoot\pyenv-win\bin*") {
    Write-Host "Adding pyenv to PATH..."
    $newPath = "$pyenvRoot\pyenv-win\bin;$pyenvRoot\pyenv-win\shims;$existingPath"
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, "User")
} else {
    Write-Host "pyenv already in PATH, skipping..."
}

# Unblock pyenv script if it's blocked
if ((Get-Item "$pyenvRoot\pyenv-win\bin\pyenv.ps1").Attributes -match "Blocked") {
    Write-Host "Unblocking pyenv script..."
    Unblock-File "$pyenvRoot\pyenv-win\bin\pyenv.ps1"
} else {
    Write-Host "pyenv script already unblocked, skipping..."
}

# Cleanup (only delete if files exist)
if (Test-Path $pyenvDownload) {
    Write-Host "Cleaning up ZIP file..."
    Remove-Item -Path $pyenvDownload -Force -ErrorAction SilentlyContinue
}
if (Test-Path $pyenvExtracted) {
    Write-Host "Cleaning up extracted folder..."
    Remove-Item -Path $pyenvExtracted -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Installation complete! Restart your PowerShell session and run 'pyenv' to verify."
