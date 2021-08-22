var sub = subscription().subscriptionId
param project string 
param env string 
param prefix string


var name = '${prefix}-${project}-${env}'
var mrg = 'rg-${prefix}-${project}-${env}'
var managedResourceGroupId = '/subscriptions/${sub}/resourceGroups/${mrg}'

resource databricks 'Microsoft.Databricks/workspaces@2018-04-01' = {
   name: name
   location: '${resourceGroup().location}'
   properties: { 
    managedResourceGroupId: managedResourceGroupId
   }
}










