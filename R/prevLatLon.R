#' Retrieve 7 days weather forecast data from CPTEC/INPE
#'
#' This function allows the user to retrieve data from
#' CPTEC/INPE weather forecast API for the next 7 days
#' informing latitude and longitude of the local.
#' The data frame returned contain maximum and minimum
#' temperature, ultra violet index and weather condition.
#'
#' @usage prevLatLon(lat, lon)
#' @param lat The latitude numeric/character vector
#' @param lon The longitude numeric/character vector
#' @return The function returns a data frame printed by the parameters input
#' @author  Renato Prado Siqueira \email{rpradosiqueira@@gmail.com}
#' @seealso \code{\link{prev7dias}}
#' @examples
#' \dontrun{
#' ## Requesting weather forecast with a latitude/longitude information
#' prevLatLon("-20.432257", "-54.569751")
#' }
#'
#' @keywords weather forecast brazil
#' @export

prevLatLon <- function(lat, lon) {

  if (length(lat) != 1 | length(lon) != 1) stop("The 'lat' and 'lon' argument must be of length 1, in this order")

  url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/cidade/7dias/", lat, "/", lon,"/previsaoLatLon.xml"))

  nome <- xml2::xml_text(xml2::xml_find_all(url1, "//nome"))
  uf <- xml2::xml_text(xml2::xml_find_all(url1, "//uf"))
  atualizacao <- xml2::xml_text(xml2::xml_find_all(url1, "//atualizacao"))
  tempo <- xml2::xml_text(xml2::xml_find_all(url1, "//tempo"))
  iuv <- xml2::xml_double(xml2::xml_find_all(url1, "//iuv"))
  dia <- xml2::xml_text(xml2::xml_find_all(url1, "//dia"))
  maxima <- xml2::xml_double(xml2::xml_find_all(url1, "//maxima"))
  minima <- xml2::xml_double(xml2::xml_find_all(url1, "//minima"))

  df <- data.frame(cidade = nome,
                   uf = uf,
                   atualizacao = atualizacao,
                   dia = dia,
                   tempo = tempo,
                   maxima = maxima,
                   minima = minima,
                   iuv = iuv)

  df

}
