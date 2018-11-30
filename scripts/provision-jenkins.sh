#!/usr/bin/env bash

resourceGroupName="New-Scratch-Jenkins-ResourceGroup"
resourceGroupLocation="UK South"

templateFilePath="../jenkins-arm/azuredeploy.json"
parameterFilePath="../jenkins-arm/azuredeploy.parameters.json"

deploymentName="jenkins-tokenHere"

# az login

if ! ( $(az group exists -g  $resourceGroupName) ) then
    echo "---> Creating the Resourcegroup: " $resourceGroupName
    az group create -g $resourceGroupName -l "$resourceGroupLocation"
else
    echo "---> Resourcegroup:" $resourceGroupName "already exists."
fi

az group deployment create --name $deploymentName --resource-group $resourceGroupName --template-file $templateFilePath --parameters $parameterFilePath --verbose
