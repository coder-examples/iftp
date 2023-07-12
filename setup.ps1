# Create directory
Write-Host "Creating directory..."
New-Item -ItemType Directory -Path "C:\iftp"

# Download DriveHQ FTP Utility
Write-Host "Downloading DriveHQ FTP Utility..."
$url = "https://www.drivehq.com/file/df.aspx/publish/drivehq/DriveHQSoftware/cmdFTP.exe"
$outputPath = "C:\iftp\cmdftp.exe"

Invoke-WebRequest -Uri $url -OutFile $outputPath
Copy-Item -Path .\iftp.ps1 "C:\iftp\iftp.ps1"

# Add to PATH
Write-Host "Adding directory to PATH..."
$folderPath = "C:\iftp"

$currentPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$newPath = "$currentPath;$folderPath"

[System.Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")

Write-Host "Done!"
Write-Host "To use iftp, check README.md"