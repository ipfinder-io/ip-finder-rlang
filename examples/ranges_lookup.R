require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup Organization information
range <- getRanges(conf,"Telecom Algeria")

range