param project string 
param env string 

var sqlserverpassword  = sql.outputs.sqlserverpassword
var storagekey = stg.outputs.storagekey

module stg './modules/storage.bicep' = {
  name: 'storageDeploy'
  params: {
    project: project
    env: env
    prefix: 'sa'
  }
}

module adf './modules/factory.bicep' = {
  name: 'factoryDeploy'
  params: {
    project: project
    env: env
    prefix: 'df'
  }
}

module sql './modules/sql.bicep' = {
  name: 'sqlDeploy'
  params: {
    project: project
    env: env
    dbprefix: 'sqldb'
    serverprefix: 'sqlsrv' 
  }
}

module dbr './modules/databricks.bicep' = {
  name: 'databricksDeploy'
  params: {
    project: project
    env: env
    prefix: 'dbr'
  
  }
}

module keyvault './modules/keyvault.bicep' = {
  name: 'keyvaultDeploy'
  params: {
    project: project
    env: env
    prefix: 'kv'
    sqlserverpassword: sqlserverpassword
    storagekey: storagekey
  }
}

