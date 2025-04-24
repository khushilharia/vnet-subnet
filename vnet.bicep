@description('Name of the virtual network')
param vnetName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('Address space for the virtual network')
param vnetAddressSpace string = '10.0.0.0/16'

@description('Name of the subnet')
param subnetName string

@description('Address prefix for the subnet')
param subnetPrefix string = '10.0.1.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressSpace
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }
}
