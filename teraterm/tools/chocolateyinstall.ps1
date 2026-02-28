$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.1/teraterm-5.5.1-x86.exe'
$checksum = '992150df0899ae5d3517523f485aee15baedc45fc0388101b8608623a098971d'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.1/teraterm-5.5.1-x64.exe'
$checksum64 = 'fe1f8170e22f4bb76c1a13c04e8c394d64b9c633683df2d006ace39ca7f97f57'

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
