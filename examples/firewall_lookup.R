require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup Asn Firewall information
fire <- getFirewall(conf,"AS1", 'nginx_deny')

fire