<img src='https://camo.githubusercontent.com/46886c3e689a0d4a3f6c0733d1cab5d9f9a3926d/68747470733a2f2f697066696e6465722e696f2f6173736574732f696d616765732f6c6f676f732f6c6f676f2e706e67' height='60' alt='IP Finder'></a>
#  IPFinder R Client Library

The official R client library for the [IPFinder.io](https://ipfinder.io) get details for :
-  IP address details (city, region, country, postal code, latitude and more ..)
-  ASN details (Organization name, registry,domain,comany_type, and more .. )
-  Firewall by supported formats details (apache_allow,  nginx_deny, CIDR , and more ..)
-  IP Address Ranges by the Organization name  details (list_asn, list_prefixes , and more ..)
-  service status details (queriesPerDay, queriesLeft, key_type, key_info)
- Get Domain IP (asn, organization,country_code ....)
- Get Domain IP history (total_ip, list_ip,organization,asn ....)
- Get list Domain By ASN, Country,Ranges (select_by , total_domain  , list_domain ....)

## Getting Started
singup for a free account at [https://ipfinder.io/auth/signup](https://ipfinder.io/auth/signup), for Free IPFinder API access token.

The free plan is limited to 4,000 requests a day, and doesn't include some of the data fields
To enable all the data fields and additional request volumes see [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

## Documentation

See the [official documentation](https://ipfinder.io/docs).

## Installation
Installing using devtools:
```shell
$ devtools::install_github("ipfinder-io/ip-finder-rlang")
```

## With `free` TOKEN

```r
require(ipfinder)

conf <- Ipfinder() # emty token == free  or conf <- Ipfinder(nil) 

# lookup your IP address information
auth <- Authentication()

auth
# print your ip
auth$ip
```

## Authentication

```r
require(ipfinder)

accconf Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup your IP address information
auth <- Authentication()

auth
# print your ip
auth$ip

```

## Get IP address

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# GET Get details for 1.0.0.0
ip <- getAddressInfo("1.0.0.0")
# print data
ip
```

## Get ASN
This API available as part of our Pro and enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

asn <- getAsn("AS1")
# print data
asn
```

## Firewall
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
formats supported are :  `apache_allow`, `apache_deny`,`nginx_allow`,`nginx_deny`, `CIDR`, `linux_iptables`, `netmask`, `inverse_netmask`, `web_config_allow `, `web_config_deny`, `cisco_acl`, `peer_guardian_2`, `network_object`, `cisco_bit_bucket`, `juniper_junos`, `microtik`

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup Asn Firewall information
fire <- getFirewall("AS1", 'nginx_deny')

fire
```

## Get IP Address Ranges
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup Organization information
range <- getRanges("Telecom Algeria")

range
```

## Get service status

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup IP TOKEN information
status <- getStatus()

status
```

## Get Domain IP


```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

domain <- getDomain("google.fr")

domain
```

## Get Domain IP history

```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")
# domain name IP history
domain <- getDomainHistory("google.fr")

domain
```

## Get list Domain By ASN, Country,Ranges


```r
require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")
# list live domain by country DZ,US,TN,FR,MA

by <- getDomainBy("FR")

by
```

## Add proxy
```r
conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE", baseUrl="https://ipfinder.yourdomain.com")
```

Sample codes under **examples/** folder.


## Contact

Contact Us With Additional Questions About Our API, if you would like more information about our API that isn’t available in our IP geolocation API developer documentation, simply [contact](https://ipfinder.io/contact) us at any time and we’ll be able to help you find what you need.

## License
----

[![GitHub license](https://img.shields.io/github/license/ipfinder-io/ip-finder-rlang.svg)](https://github.com/ipfinder-io/ip-finder-rlang)