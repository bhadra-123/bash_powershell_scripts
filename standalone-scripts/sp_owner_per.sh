#!/bin/bash

echo Enter Subscription ID...

read subsription_id

echo Enter Service Principal ID...

read service_principal_id

echo Enter Role Name...

read role_name

az account set --subscription $subsription_id

az account show

az role assignment create --role $role_name --assignee $service_principal_id