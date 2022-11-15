targetScope = 'resourceGroup'

var type1Name = 'type1'
var type2Name = 'type2'
var type3Name = 'type3'

var types = {
  '${type1Name}': {
    count: 1
  }
  '${type2Name}': {
    count: 2
  }
  '${type3Name}': {
    count: 3
  }
}

param Name string
param Location string = resourceGroup().location

resource UAI 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = [for (type, index) in items(types): {
  name: 'Name-${index}'
  location: Location
  tags: {
    count: type.value.count
  }
}]

output TypeNames array = [for type in filter(items(types), t => (t.value.count != 2)): {
  name: type.key
}]
