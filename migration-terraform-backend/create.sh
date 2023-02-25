#!/bin/bash

export subscription_id="dc87d979-80e5-489a-915e-b5faaf6d62bc"
export location="eastus"
export resource_group_name="terraform-backend-rg" 
export storage_account_name="terraformbackendstac743"
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

az group update --name $resource_group_name --set tags.owner=bhadra tags.source=manual tags.location=$location

echo "-------------------------"
echo  creating storage account
echo "-------------------------"

az storage account create --name $storage_account_name --resource-group $resource_group_name --location $location --sku Standard_LRS --encryption-services blob

az storage account update --name $storage_account_name --resource-group $resource_group_name --set tags.owner=bhadra tags.source=manual tags.location=$location

echo "---------------------------"
echo  creating storage container
echo "---------------------------"

az storage container create --name $hub_storage_account_name --account-name $storage_account_name --auth-mode login

az storage container create --name $spoke_storage_account_name --account-name $storage_account_name --auth-mode login