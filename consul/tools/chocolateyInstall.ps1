$packageName = 'consul' # arbitrary name for the package, used in messages
# Install from binaries path
$binariesPath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "..\binaries\")
$sourcePath = $(Join-Path $binariesPath "0.4.1_windows_386.zip")
$sourcePathUI = $(Join-Path $binariesPath "0.4.1_web_ui.zip")
$sourceServiceWrapper = $(Join-Path $binariesPath "winsw-1.16-bin.exe")
$serviceWrapperPath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")
Get-ChocolateyUnzip  $sourcePath "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyUnzip  $sourcePathUI "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Move-Item $sourceServiceWrapper $serviceWrapperPath

# Install the service
& "$(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")" install

### DEPRECATED DOWNLOAD CODE ###
#$url = 'https://dl.bintray.com/mitchellh/consul/0.4.1_windows_386.zip' # download url
#$uiUrl = 'https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip'
#$checksum = '61906f5d73a0d991dae5d75a25299f183670efa473cd155c715eefc98ce49cc8'
#$checksumType = 'sha1'

# download and unpack a zip file
#Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" #-checksum $checksum -checksumType $checksumType

# Get the Web UI
#Install-ChocolateyZipPackage "$packageName.UI" "$uiUrl" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Service Wrapper
#$serviceWrapperUrl = 'http://repo.jenkins-ci.org/releases/com/sun/winsw/winsw/1.16/winsw-1.16-bin.exe'
#$serviceWrapperChecksum = '7a387842adf551434ab4568b56c57757'
#$serviceWrapperChecksumType = 'md5'
#$serviceWrapperPath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")
#Get-ChocolateyWebFile "winsw" "$serviceWrapperPath" "$serviceWrapperUrl" -checksum $serviceWrapperChecksum -checksumType $serviceWrapperChecksumType

# Get the license
#$serviceWrapperLicense = 'https://github.com/kohsuke/winsw/blob/master/LICENSE.txt'
#$serviceWrapperLicensePath = $(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "winsw.LICENSE.txt")
#Get-ChocolateyWebFile "winsw-license" "$serviceWrapperLicensePath" "$serviceWrapperLicense"