#!/usr/bin/env bash

resourceGroupName="New-Scratch-CI-ResourceGroup"
resourceGroupLocation="UK South"

templateFilePath="../ci-arm/azuredeploy.json"
parameterFilePath="../ci-arm/azuredeploy.parameters.json"

deploymentName="ci-tokenHere"

# az login

if ! ( $(az group exists -g  $resourceGroupName) ) then
    echo "---> Creating the Resourcegroup: " $resourceGroupName
    az group create -g $resourceGroupName -l "$resourceGroupLocation"
else
    echo "---> Resourcegroup:" $resourceGroupName "already exists."
fi

az group deployment create --name $deploymentName --resource-group $resourceGroupName --template-file $templateFilePath --parameters $parameterFilePath --verbose
