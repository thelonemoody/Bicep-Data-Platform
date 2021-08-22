

az group create --location 'westeurope' --name 'rg-gobicepdata-dev'
              

az deployment group create -f ./main.json -g 'rg-gobicepdata-dev' --parameters project='gobicepdata' env='dev'




