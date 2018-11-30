#! usr/bin/env bash
source set-env.sh

fileToUpload="../../function.zip"
container="artefacts"
blob="build001"

az storage blob upload -f $fileToUpload -c $container -n $blob --connection-string "$azureStorageCIConnectionString"