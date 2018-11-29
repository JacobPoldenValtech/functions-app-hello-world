#!/usr/bin/env bash

resourceGroupName="New-Scratch-ResourceGroup"
resourceGroupLocation="UK South"

templateFilePath="../azuredeploy.json"
parameterFilePath="../azuredeploy.parameters.json"
pathToFunctionZip="../../function.zip"

deploymentName="first-function-app"

# az login

if ! ( $(az group exists -g  $resourceGroupName) ) then
    echo "---> Creating the Resourcegroup: " $resourceGroupName
    az group create -g $resourceGroupName -l "$resourceGroupLocation"
else
    echo "---> Resourcegroup:" $resourceGroupName "already exists."
fi

az group deployment create --name $deploymentName --resource-group $resourceGroupName --template-file $templateFilePath --parameters $parameterFilePath --verbose

echo "---> Deploying Function Code"
az functionapp deployment source config-zip -g $resourceGroupName -n "scatch-func-arm" --src $pathToFunctionZip

echo "---> done <---"