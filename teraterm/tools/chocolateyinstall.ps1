$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.2/teraterm-5.5.2-x86.exe'
$checksum = '8e6b373520199496268e968ef5cc4a9e18d1245c5d924ee3b8210b27d062a907'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.2/teraterm-5.5.2-x64.exe'
$checksum64 = '202f42ea00e444763570d1dd5e2d315e3005e6afb48f63389af7634677e01f3a'

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
