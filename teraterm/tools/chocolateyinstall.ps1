$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.0/teraterm-5.6.0-x86.exe'
$checksum = '88986d8cb16cc0b7b3776872daaceefa0ffdc6cbe5fa0b0838a6a4c85fd981fe'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.0/teraterm-5.6.0-x64.exe'
$checksum64 = '05afdcf1e26aa24f0392a1e60e15626f126ff3bf416565e453857889c678e534'

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
