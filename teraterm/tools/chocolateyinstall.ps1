$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.7.0/teraterm-5.7.0-x86.exe'
$checksum = '19dfb8df4fdcfa51eb7e35ba45b25e13b8910b024bcf385bd782ba5ac77a2670'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.7.0/teraterm-5.7.0-x64.exe'
$checksum64 = '67f890f112f4eed62873ad84461209e51ba183b0b8d09b7a8e58f359a510c47e'

# ARM64
#   https://docs.chocolatey.org/en-us/create/functions/get-osarchitecturewidth/#notes
#   Detected as 32-bit?

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64         = $url64

  softwareName  = 'Tera Term 5.*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
