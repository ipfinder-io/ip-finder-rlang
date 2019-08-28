# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
require(httr)
require(jsonlite)

DEFAULT_BASE_URL <- "https://api.ipfinder.io/v1/"


DEFAULT_API_TOKEN <- "free"


FORMAT <- "json"


STATUS_PATH <- "info"


RANGES_PATH <- "ranges/"


FIREWALL_PATH <- "firewall/"


DOMAIN_PATH <- "domain/"


DOMAIN_H_PATH <- "domainhistory/"


DOMAIN_BY_PATH <- "domainby/"

Ipfinder <- setClass(


        # Set the name for the class
        "Ipfinder",

        # Define the slots
        slots = c(
                token = "character",
                baseUrl   = "character"
        ),

        # Set the default values for the slots. (optional)
        prototype=list(
                token = DEFAULT_API_TOKEN,
                baseUrl   = DEFAULT_BASE_URL
        ),

        # Make a function that can test to see if the data is consistent.
        # This is not called if you have an initialize function defined!

)

setGeneric(name="Call",
           def=function(theObject, path, format)
           {
                   standardGeneric("Call")
           }
)

setMethod(f="Call",
          signature="Ipfinder",
          definition=function(theObject, path = NULL, format = NULL)
          {
                  headers = c(
                          `User-Agent` = 'IPfinder R-client',
                          `Content-Type` = 'application/json; charset=UTF-8'
                  )

                          data = list(
                          `token` = theObject@token,
                          `format` = format
                  )

                  res <- httr::POST(url = paste0(theObject@baseUrl,path),httr::add_headers(.headers=headers),body = data, encode = "json")

                  if (httr::status_code(res) != 200) stop(res, call.=FALSE)

                  res <- httr::content(res, as="text", encoding="UTF-8")

                  res <- jsonlite::fromJSON(res)

                  return(res)

          }
)

setGeneric(name="Authentication",
           def=function(theObject)
           {
                   standardGeneric("Authentication")
           }
)

setMethod(f="Authentication",
          signature="Ipfinder",
          definition=function(theObject)
          {
                  return (Call(theObject,NULL,NULL))
          }
)

setGeneric(name="getAddressInfo",
           def=function(theObject,path)
           {
                   standardGeneric("getAddressInfo")
           }
)

setMethod(f="getAddressInfo",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,path,NULL))
          }
)

setGeneric(name="getAsn",
           def=function(theObject,path)
           {
                   standardGeneric("getAsn")
           }
)

setMethod(f="getAsn",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,path,NULL))
          }
)

setGeneric(name="getStatus",
           def=function(theObject)
           {
                   standardGeneric("getStatus")
           }
)

setMethod(f="getStatus",
          signature="Ipfinder",
          definition=function(theObject)
          {
                  return (Call(theObject,STATUS_PATH,NULL))
          }
)

setGeneric(name="getRanges",
           def=function(theObject,path)
           {
                   standardGeneric("getRanges")
           }
)

setMethod(f="getRanges",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,paste0(RANGES_PATH,URLencode(path)),NULL))
          }
)


setGeneric(name="getFirewall",
           def=function(theObject,path,formats)
           {
                   standardGeneric("getFirewall")
           }
)

setMethod(f="getFirewall",
          signature="Ipfinder",
          definition=function(theObject,path,formats)
          {
                  return (Call(theObject,paste0(FIREWALL_PATH,path,formats)))
          }
)

setGeneric(name="getDomain",
           def=function(theObject,path)
           {
                   standardGeneric("getDomain")
           }
)

setMethod(f="getDomain",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,paste0(DOMAIN_PATH,path,NULL)))
          }
)

setGeneric(name="getDomainHistory",
           def=function(theObject,path)
           {
                   standardGeneric("getDomainHistory")
           }
)

setMethod(f="getDomainHistory",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,paste0(DOMAIN_H_PATH,path,NULL)))
          }
)

setGeneric(name="getDomainBy",
           def=function(theObject,path)
           {
                   standardGeneric("getDomainBy")
           }
)

setMethod(f="getDomainBy",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,paste0(DOMAIN_BY_PATH,path,NULL)))
          }
)


