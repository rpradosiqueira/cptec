#' Search for cities ID
#'
#' This function allows the user to discover which are
#' the city's ID of interest.
#'
#' @usage listaCidades(x)
#' @param x A single character to search.
#' @return The function returns a data frame with the results of the search.
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{prev4dias}}
#' @examples
#' ## Looking for the city of Campo Grande
#' listaCidades("campo grande")
#'
#' ## Looking for the city of Rio de Janeiro
#' listaCidades("rio de janeiro")
#'
#' @keywords weather forecast brazil
#' @export

listaCidades <- function(x) {

  if(!is.character(x)) stop("'x' must be of a character type")
  if(length(x) != 1) stop("Expecting a single string value")

  x <- gsub(" ", "%20", x)

  url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/listaCidades?city=", x))

  nome <- xml2::xml_text(xml2::xml_find_all(url1, "//nome"))
  uf <- xml2::xml_text(xml2::xml_find_all(url1, "//uf"))
  id <- xml2::xml_double(xml2::xml_find_all(url1, "//id"))

  df <- data.frame(cidade = nome,
                   uf = uf,
                   id = id)

  df

}
