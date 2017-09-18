#' Retrieve 7 days weather forecast data from CPTEC/INPE
#'
#' This function allows the user to retrieve data from
#' CPTEC/INPE weather forecast API for the next 7 days.
#' The data frame returned contain maximum and minimum
#' temperature, ultra violet index and weather condition.
#'
#' @usage prev7dias(id)
#' @param id The city's ID
#' @return The function returns a data frame printed by city id
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{prev7dias}}
#' @examples
#' \dontrun{
#' ## Requesting weather forecast from the city of Campo Grande/MS
#' prev7dias(225)
#' }
#'
#' @keywords weather forecast brazil
#' @export

prev7dias <- function(id) {

  if (length(id) != 1) stop("Only one city per time")

  url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/cidade/7dias/", id,"/previsao.xml"))

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
