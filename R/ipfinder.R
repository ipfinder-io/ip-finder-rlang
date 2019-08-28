#' DEFAULT BASE URL
DEFAULT_BASE_URL <- "https://api.ipfinder.io/v1/"

#' The free token limited to 4,000 requests a day
DEFAULT_API_TOKEN <- "free"

#' DEFAULT FORMAT
FORMAT <- "json"

#' service status path
STATUS_PATH <- "info"

#' IP Address Ranges path
RANGES_PATH <- "ranges/"

#' Firewall path
FIREWALL_PATH <- "firewall/"

#' Get Domain IP path
DOMAIN_PATH <- "domain/"

#' Get Domain IP history path
DOMAIN_H_PATH <- "domainhistory/"

#' Domain By ASN, Country,Ranges path
DOMAIN_BY_PATH <- "domainby/"


#' The Ipfinder API class and Constructor
#' @export Ipfinder
#' @exportClass Ipfinder
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

#' Call to server
#'
#' @md
#' @param theObject ipfinder class
#' @param path      specific path of asn, IP address, ranges, Firewall,Token status
#' @param format    available format `json` `jsonp` `php` `xml` and firewall formats
#' @export
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

#' Get details for an Your IP address.
#'
#' @md
#' @param theObject ipfinder class
#' @references <https://ipinfo.io/developers#full-ip-details>
#' @return your ip data
#' @export
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

#' Get details for an IP address.
#'
#' @md
#' @param theObject ipfinder class
#' @param path      IP address.
#' @references <https://ipfinder.io/docs/#response-objects-details>
#' @return ip data
#' @export
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

#' Get details for an AS number.
#'
#' @md
#' @param theObject ipfinder class
#' @param path      AS number.
#' @references <https://ipfinder.io/docs/#response-object>
#' @return asn data
#' @export
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

#' Get details for an API Token .
#'
#' @md
#' @param theObject ipfinder class
#' @references <https://ipfinder.io/docs/#response-objects-details-2>
#' @return status data
#' @export
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

#' Get details for an Organization name.
#'
#' @md
#' @param theObject ipfinder class
#' @param path      Organization name.
#' @references <https://ipfinder.io/docs/#response-objects-details-3>
#' @return rang data
#' @export
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

#' Get Firewall data
#'
#' @md
#' @param theObject ipfinder class
#' @param path      AS number, alpha-2 country only.
#' @param formats   list formats supported
#' @references <https://ipfinder.io/docs/#response-details>
#' @return Firewall data
#' @export
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

#' Get Domain IP
#'
#' @md
#' @param theObject ipfinder class
#' @param path      The API supports passing in a single website name domain name
#' @references <https://ipfinder.io/docs/#domain-ip-objects-details>
#' @return Domain IP data
#' @export

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

#' Get Domain History IP
#'
#' @md
#' @param theObject ipfinder class
#' @param path      The API supports passing in a single website name domain name
#' @references <https://ipfinder.io/docs/#domain-ip-history-objects-details>
#' @return Domain History data
#' @export
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

#' Get list Domain By ASN, Country,Ranges
#'
#' @md
#' @param theObject ipfinder class
#' @param path      The API supports passing in a single ASN,Country,Ranges
#' @references <https://ipfinder.io/docs/#domain-by-asn-objects-details>
#' @return list Domain data
#' @export
setMethod(f="getDomainBy",
          signature="Ipfinder",
          definition=function(theObject,path)
          {
                  return (Call(theObject,paste0(DOMAIN_BY_PATH,path,NULL)))
          }
)


