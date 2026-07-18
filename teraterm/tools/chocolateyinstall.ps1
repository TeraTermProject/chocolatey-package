$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.2/teraterm-5.6.2-x86.exe'
$checksum = '82d4fb0f5879df0c632806a4af9cd75a0f6111cd55a26cb73647f922052d669f'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.2/teraterm-5.6.2-x64.exe'
$checksum64 = 'ce18ce457ac45f2ffb57bf1854c3458cb4dc766a60dde3793915dabcd181b901'

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
