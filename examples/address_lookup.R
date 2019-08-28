require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# GET Get details for 1.0.0.0
ip <- getAddressInfo(conf,"1.0.0.0")
# print data
ip