# Install BCContainerHelper

#get-module


#Uninstall-Module navcontainerhelper -AllVersions
Install-Module BcContainerHelper -Force


# Creates a BC Container

$artifactUrl ='https://bcartifacts.azureedge.net/onprem/14.0.29537.0/se'
#$artifactUrl = Get-BCArtifactUrl -version 17 -country no -select Latest
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'admin' -AsPlainText -Force)

New-BcContainer `
-accept_eula `
-containerName eksjo `
-artifactUrl $artifactUrl `
-Credential $credential `
-auth UserPassword `
-updateHosts `
-includeCSide `
-licenseFile "C:\Temp\BC17.flf" `
-useBestContainerOS `
-accept_outdated


# Import License 


Import-BcContainerLicense -containerName multiqdev2 -licenseFile 'C:\Temp\BC17.flf'