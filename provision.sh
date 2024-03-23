#!/bin/bash

rg_name=myResourceGroup1

az group create --location swedencentral --name $rg_name
az deployment group create --resource-group $rg_name --template-file arm.json --parameters AdminUser=azureuser sshRSAPublicKey="$(cat ~/.ssh/id_rsa.pub)" customDataAppServer=@cloudinitdotnet.sh
az vm show --resource-group $rg_name --name vmappserver --show-details --query [publicIps] --output tsv
