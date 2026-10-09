$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.7.0/teraterm-5.7.0-x86.exe'
$checksum = '88bf481c67e9de7037a5e986e9f5f860f8c70832b456e936cac6c593fdd37950'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.7.0/teraterm-5.7.0-x64.exe'
$checksum64 = 'a091233b41ad3ebd2277892ad9ef077148f1720171ae225c041e895e573343fe'

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
