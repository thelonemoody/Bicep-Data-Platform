param project string 
param env string 
param serverprefix string
param dbprefix string

@secure()
param sqlserverpassword string = newGuid() 


var servername = '${serverprefix}-${project}-${env}'
var dbname = '${dbprefix}${env}'

resource sqlserver 'Microsoft.Sql/servers@2019-06-01-preview' = {
  location: '${resourceGroup().location}'
  name: servername
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    administratorLogin: 'sqllogin'
    administratorLoginPassword: sqlserverpassword
  }
}

resource sqldatabase 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name:  '${sqlserver.name}/${dbname}'
  location: '${resourceGroup().location}'
  sku: {
    name: 'Basic'
  }
  dependsOn: [  sqlserver 
  ]
}

resource azureFirewalls 'Microsoft.Sql/servers/firewallRules@2015-05-01-preview' = {
  name: '${sqlserver.name}/AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}


output sqlserverpassword string  = sqlserverpassword

