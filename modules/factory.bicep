param project string 
param env string 
param prefix string

var name = '${prefix}-${project}-${env}'

resource adf 'Microsoft.DataFactory/factories@2018-06-01'= {
  name: name
  location: '${resourceGroup().location}'
  identity: {
    type: 'SystemAssigned'
  }
  properties:{

  }
  }








