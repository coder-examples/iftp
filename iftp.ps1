# Read the contents of fconfig.json file
$config = Get-Content -Raw -Path ".\fconfig.json" | ConvertFrom-Json

# Retrieve the required configuration values
$hostname = $config.hostname
$port = $config.port
$username = $config.username
$password = $config.password
$rootDir = $config.rootdir
$delWrite = $config.delwrite
$cmdftpLocation = $config.cmdftpLocation

# Define the local and remote directories
$remoteDir = $rootDir

# Construct the script content
$scriptContent = "open $hostname`n"
$scriptContent += "$username`n"
$scriptContent += "$password`n"
$scriptContent += "cd $remoteDir`n"

# If delwrite is true, add a command to delete files
if ($delWrite) {
    $scriptContent += "delete *`n"
}

$scriptContent += "mput *`n"

# Create a temporary script file
$scriptPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "script.txt")
$scriptContent | Out-File -FilePath $scriptPath -Encoding ASCII

# Run cmdftp.exe with the script file
$cmdftpPath = "C:\iftp\cmdftp.exe"     # Update with the actual path to cmdftp.exe
Start-Process -FilePath $cmdftpPath -ArgumentList "-s:$scriptPath" -Wait
