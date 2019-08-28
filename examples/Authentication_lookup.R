require(ipfinder)

conf <- Ipfinder() # emty token == free  or conf <- Ipfinder(nil) 

# lookup your IP address information
auth <- Authentication(conf)

auth
# print your ip
auth$ip