require(ipfinder)

conf <- Ipfinder(token="YOUR_TOKEN_GOES_HERE")

# lookup IP TOKEN information
status <- getStatus(conf)

status