#!/bin/bash

export subscription_id="dc87d979-80e5-489a-915e-b5faaf6d62bc"
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