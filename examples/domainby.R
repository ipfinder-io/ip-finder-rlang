require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")
# list live domain by country DZ,US,TN,FR,MA

by <- getDomainBy(conf,"FR")

by