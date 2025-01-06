# Description:
#   This script is used to generate ARM parameters that contain subnet addressprefix specifications.
#   The generation is based on a caluclation performed on an existing virtual network. If gaps are detected these
#   will be filled. If no gaps are found, the subnets are appended to the end of the vnet subnet list. The required subnets
#   are specified in the $requiredSubnets PSObject.

param (
    # required parameters
    [Parameter(Mandatory = $true, HelpMessage = "Specifies where the find the parameters file")][string]$bicepPar1,
    [Parameter(Mandatory = $true, HelpMessage = "Specifies where the find the parameters file")][string]$bicepPar2,
    [Parameter(Mandatory = $true, HelpMessage = "Specifies where the find the parameters file")][string]$bicepPar3,
    [Parameter(Mandatory = $true, HelpMessage = "Specifies where the find the parameters file")][string]$bicepPar4,
    [Parameter(Mandatory = $true, HelpMessage = "Where to place the parameters.json file")][string]$filePath,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory environment [dev,test,prod]")][string]$env,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory subscription id for environment [dev,test,prod]")][string]$subscriptionId,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory project Azure resource suffix ")][string]$prjResourceSuffix,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory suffix for COMMON resource groups [dev,test,prod]")][string]$aifactorySuffixRGADO,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory suffix for COMMON resources [dev,test,prod]")][string]$commonResourceSuffixADO,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory data center region location westeurope, swedencentral ")][string]$locationADO,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory data center region location suffix weu, swc ")][string]$locationSuffixADO,
    [Parameter(Mandatory = $true, HelpMessage = "ESML AI Factory project type:[esml,genai-1]")][string]$projectTypeADO,

    # optional parameters
    [Parameter(Mandatory = $false, HelpMessage = "Use service principal")][switch]$useServicePrincipal = $false,
    [Parameter(Mandatory = $false, HelpMessage = "Specifies the object id for service principal")][string]$spObjId,
    [Parameter(Mandatory = $false, HelpMessage = "Specifies the secret for service principal")][string]$spSecret,
    [Parameter(Mandatory = $false, HelpMessage = "Specifies where the find the parameters file")][string]$bicepPar5
)

 write-host "DEBUG 4"