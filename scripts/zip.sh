#!/usr/bin/env bash
ZIP_NAME='function.zip'

rm ../$ZIP_NAME
zip -r ../$ZIP_NAME * -x "*.git*" -x "*obj*" -x "local.settings.json" -x "proxies.json" -x "*scripts*"