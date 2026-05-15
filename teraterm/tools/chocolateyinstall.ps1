$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.1/teraterm-5.6.1-x86.exe'
$checksum = 'f39d3cb6f6dde7808d5760dbf0fd02a077b5bea4d291f1b5c2b7b36d9bac3b74'

# x64
$url64      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.6.1/teraterm-5.6.1-x64.exe'
$checksum64 = 'e2035d4dc05757aae5913c6542b973028b17a311fe03e8561d138b5255792dbc'

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
