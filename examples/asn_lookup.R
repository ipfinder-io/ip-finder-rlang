require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

asn <- getAsn(conf,"AS1")
# print data
asn