﻿
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/FreeTubeApp/FreeTube/releases/download/v0.7.3-beta/FreeTube.Setup.0.7.3.exe'

  softwareName  = 'FreeTube*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '23d5382c1b9eb6576755af9afaebe06c8bc0067f7933bc4208bad6c789a82886'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/S" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 