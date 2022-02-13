param env string
param project string
param prefix string
param location string

param containerNames array = [
  'raw'
  'curated'
]

var name = '${prefix}${project}${env}'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: name
  location: location 
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS' 
  }
  properties: {
    accessTier: 'Hot'
    isHnsEnabled:true
  } 
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [for name in containerNames: {
  name: '${stg.name}/default/${name}'
}]







