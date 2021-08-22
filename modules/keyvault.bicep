param project string 
param env string 
param prefix string

@secure()
param sqlserverpassword string

@secure()
param storagekey string

var name = '${prefix}-${project}-${env}'

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: name
  location: '${resourceGroup().location}'
  
  properties :{
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
  }
}


resource kvsqlpass 'Microsoft.KeyVault/vaults/secrets@2016-10-01' = {
  name: '${keyvault.name}/sqlserverpassword'
  properties: {
    value: sqlserverpassword
    attributes: {
      enabled: true
    }
  }
}

resource kvstgkey 'Microsoft.KeyVault/vaults/secrets@2016-10-01' = {
  name: '${keyvault.name}/storagekey'
  properties: {
    value: storagekey
    attributes: {
      enabled: true
    }
  }
}





