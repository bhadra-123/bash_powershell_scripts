#!/bin/bash

export subscription_id="f5db7161-4296-45e8-96e3-e67567aa1b22"
export location="eastus"
export resource_group_name="terraform-backend-rg" 
export storage_account_name="terraformbackendstac744"
export hub_storage_account_name="hub-stct"
export spoke_storage_account_name="spoke-stct"

echo "-----------------------"
echo  setting up subscripton
echo "-----------------------"

az account set -s $subscription_id

az account show

echo "------------------------"
echo  creating resource group
echo "------------------------"

az group create --name $resource_group_name --location $location

az group update --name $resource_group_name --set tags.owner=bhadrareddy.origin@gmail.com tags.source=manual tags.location=$location

echo "-------------------------"
echo  creating storage account
echo "-------------------------"

az storage account create --name $storage_account_name --resource-group $resource_group_name --location $location --sku Standard_LRS --encryption-services blob

az storage account update --name $storage_account_name --resource-group $resource_group_name --set tags.owner=bhadrareddy.origin@gmail.com tags.source=manual tags.location=$location

echo "---------------------------"
echo  creating storage container
echo "---------------------------"

az storage container create --name $hub_storage_account_name --account-name $storage_account_name --auth-mode login

az storage container create --name $spoke_storage_account_name --account-name $storage_account_name --auth-mode login