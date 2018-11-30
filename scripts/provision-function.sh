#!/usr/bin/env bash

resourceGroupName="New-Scratch-ResourceGroup"
resourceGroupLocation="UK South"

templateFilePath="../function-arm/azuredeploy.json"
parameterFilePath="../function-arm/azuredeploy.parameters.json"

deploymentName="function-tokenHere"

# az login

if ! ( $(az group exists -g  $resourceGroupName) ) then
    echo "---> Creating the Resourcegroup: " $resourceGroupName
    az group create -g $resourceGroupName -l "$resourceGroupLocation"
else
    echo "---> Resourcegroup:" $resourceGroupName "already exists."
fi

az group deployment create --name $deploymentName --resource-group $resourceGroupName --template-file $templateFilePath --parameters $parameterFilePath --verbose
