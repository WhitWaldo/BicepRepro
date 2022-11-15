targetScope = 'resourceGroup'

param Location string = resourceGroup().location

module m2 'moduleTwo.bicep' = {
  name: 'm2'
  params: {
    Name: 'm2'
    Location: Location
  }
}

module m1 'moduleOne.bicep' = {
  name: 'm1'
  params: {
    Name: 'm1'
    ArrValues: m2.outputs.TypeNames
    Location: Location
  }
}
