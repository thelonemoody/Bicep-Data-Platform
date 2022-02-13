
param($location, $project, $envrionment, $deployStorage, $deployDataFactory, $deploySql, $deployDatabricks,$deployKeyVault )

$resourceGroup = 'rg-'+ $project + '-' + $envrionment

az group create --location $location --name $resourceGroup 

az deployment group create -f ./main.json -g $resourceGroup --parameters project=$project `
                                                                        env=$envrionment `
                                                                        location=$location `
                                                                        deployStorage=$deployStorage `
                                                                        deployDataFactory=$deployDataFactory `
                                                                        deploySql=$deploySql `
                                                                        deployDatabricks=$deployDatabricks `
                                                                        deployKeyVault=$deployKeyVault `





