& "$(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")" stop
sleep 5
& "$(Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) "consul-service.exe")" uninstall