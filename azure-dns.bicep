param dnsZoneName string
param repositoryNames array


resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: dnsZoneName
  location: 'global'
}

resource dnsRecord 'Microsoft.Network/dnsZones/CNAME@2018-05-01' = [for cname in repositoryNames: {
  name: cname
  parent: dnsZone
  properties: {
    TTL: 3600
    CNAMERecord: {
      cname: 'JosephHegab.github.io'
    }
  }
}]
