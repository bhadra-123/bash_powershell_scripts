#!/bin/bash

export subscription_id="f5db7161-4296-45e8-96e3-e67567aa1b22"
export resource_group_name="terraform-backend-rg" 

echo "-----------------------"
echo  setting up subscripton
echo "-----------------------"

az account set -s $subscription_id

az account show

echo "------------------------"
echo  Deleting resource group
echo "------------------------"

az group delete -n $resource_group_name --yes --no-wait

echo "------"
echo  Check
echo "------"

az group exists -n $resource_group_name