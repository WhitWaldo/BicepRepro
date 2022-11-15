targetScope = 'resourceGroup'

param Name string
param Location string = resourceGroup().location
param ArrValues array = []

resource UAI 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: '${Name}-${string(ArrValues)}'
  location: Location
}

output Name string = UAI.name
