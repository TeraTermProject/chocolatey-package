$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if ($env:PROCESSOR_ARCHITEW6432) { $osArch = $env:PROCESSOR_ARCHITEW6432 }

$url         = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.1/teraterm-5.5.1-x86.exe'
$urlchecksum = '992150df0899ae5d3517523f485aee15baedc45fc0388101b8608623a098971d'

if ($osArch -eq 'ARM64') {
    $url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.1/teraterm-5.5.1-arm64.exe'
    $checksum = 'a558576648d4dbda6f1be24f676943df6e7fbbe2ce214ecc5f6f04889843f4eb'
} elseif ($osArch -eq 'AMD64') {
    $url      = 'https://github.com/TeraTermProject/teraterm/releases/download/v5.5.1/teraterm-5.5.1-x64.exe'
    $checksum = 'fe1f8170e22f4bb76c1a13c04e8c394d64b9c633683df2d006ace39ca7f97f57'
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Tera Term 5.*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
