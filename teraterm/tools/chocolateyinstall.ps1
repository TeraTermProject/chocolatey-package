$ErrorActionPreference = 'Stop';

$packageName= 'teraterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$url        = 'https://osdn.jp/dl/ttssh2/teraterm-4.92.exe'
$url        = 'http://doda.teraterm.net/test/teraterm-20160908_101950.exe'
$url64      = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Tera Term *'

#  checksum      = '4B42863FEFA83DAE0140F531939D334061F210F4092FA02B2E02063ABDC94EC0'
  checksum      = 'FA07D1778DA6D5088E2EF1C8DE37EAE63BFFADA913BE6ECA38175E8D4E8A79C0'
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
