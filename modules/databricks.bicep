var sub = subscription().subscriptionId
param project string 
param env string 
param prefix string
param location string

var name = '${prefix}-${project}-${env}'
var mrg = 'rg-${prefix}-${project}-${env}'
var managedResourceGroupId = '/subscriptions/${sub}/resourceGroups/${mrg}'

resource databricks 'Microsoft.Databricks/workspaces@2018-04-01' = {
   name: name
   location: location
   properties: { 
    managedResourceGroupId: managedResourceGroupId
   }
}










