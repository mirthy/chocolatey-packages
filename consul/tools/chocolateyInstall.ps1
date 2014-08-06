$packageName = 'consul' # arbitrary name for the package, used in messages
$url = 'https://dl.bintray.com/mitchellh/consul/0.3.1_windows_386.zip' # download url
$uiUrl = 'https://dl.bintray.com/mitchellh/consul/0.3.1_web_ui.zip'
$checksum = '102bda6e02b193a9417e80795875bf7d18259fc5daff3d048d274beef690eb26'
$checksumType = 'sha1'

# download and unpack a zip file
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" #-checksum $checksum -checksumType $checksumType

# Get the Web UI
Install-ChocolateyZipPackage "$packageName.UI" "$uiUrl" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Service Wrapper
$serviceWrapperUrl = 'http://repo.jenkins-ci.org/releases/com/sun/winsw/winsw/1.16/winsw-1.16-bin.exe'
$serviceWrapperChecksum = '7a387842adf551434ab4568b56c57757'
$serviceWrapperChecksumType = 'md5'
$serviceWrapperPath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")
Get-ChocolateyWebFile "winsw" "$serviceWrapperPath" "$serviceWrapperUrl" -checksum $serviceWrapperChecksum -checksumType $serviceWrapperChecksumType

# Get the license
$serviceWrapperLicense = 'https://github.com/kohsuke/winsw/blob/master/LICENSE.txt'
$serviceWrapperLicensePath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "winsw.LICENSE.txt")
Get-ChocolateyWebFile "winsw-license" "$serviceWrapperLicensePath" "$serviceWrapperLicense"

# Install the service
& "$(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")" install