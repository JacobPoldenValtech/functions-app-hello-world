#!/usr/bin/env bash

resourceGroupName="New-Scratch-ResourceGroup"
pathToFunctionZip="../../function.zip"

# az login

az functionapp deployment source config-zip -g $resourceGroupName -n "scatch-func-arm" --src $pathToFunctionZip
