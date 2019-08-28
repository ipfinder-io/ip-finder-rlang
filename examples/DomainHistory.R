require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")
# domain name IP history
domain <- getDomainHistory(conf,"google.fr")

domain