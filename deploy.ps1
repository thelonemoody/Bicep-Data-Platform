location = 'westeurope'
resourceGroup = 'rg-gobicepdata-dev'
project = 'gobicepdata'
env = 'dev'

az group create --location location --name resourceGroup

az deployment group create -f ./main.json -g resourceGroup --parameters project=project env=env




