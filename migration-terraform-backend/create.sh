#!/bin/bash

export subscription_id="f5db7161-4296-45e8-96e3-e67567aa1b22"
export resource_group_name="terraform-storage-backend-rg" 
export storage_account_name="backendstorage63826482"
export storage_container_1_name="dev-backend-container"
export storage_container_2_name="qa-backend-container"
export storage_container_3_name="prod-backend-container"

echo "-----------------------"
echo  setting up subscripton
echo "-----------------------"

az account set -s $subscription_id

az account show

echo "------------------------"
echo  creating resource group
echo "------------------------"

az group create --name $resource_group_name --location centralus

az group update --name $resource_group_name --set tags.owner=bhadra tags.source=manual tags.location=centralus

echo "-------------------------"
echo  creating storage account
echo "-------------------------"

az storage account create --name $storage_account_name --resource-group $resource_group_name --location centralus --sku Standard_LRS --encryption-services blob

az storage account update --name $storage_account_name --resource-group $resource_group_name --set tags.owner=bhadra tags.source=manual tags.location=centralus

echo "---------------------------"
echo  creating storage container
echo "---------------------------"

az storage container create --name $storage_container_1_name --account-name $storage_account_name --auth-mode login

az storage container create --name $storage_container_2_name --account-name $storage_account_name --auth-mode login

az storage container create --name $storage_container_3_name --account-name $storage_account_name --auth-mode login