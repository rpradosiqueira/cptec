#' Current weather conditions of capitals
#'
#' This function allows the user to retrieve data from
#' CPTEC/INPE current weather conditions of capitals.
#' The data frame returned contain actual temperature,
#' atmospheric pressure, humidity, direction and wind
#' intensity
#'
#' @usage capitais()
#' @return The function returns a data frame
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{prev4dias}}
#' @examples
#' capitais()
#'
#' @keywords weather forecast brazil
#' @export

capitais <- function() {

  url_temp <- xml2::read_xml("http://servicos.cptec.inpe.br/XML/capitais/condicoesAtuais.xml")

  codigo <- xml2::xml_text(xml2::xml_find_all(url_temp, "//codigo"))
  atualizacao <- xml2::xml_text(xml2::xml_find_all(url_temp, "//atualizacao"))
  pressao <- xml2::xml_double(xml2::xml_find_all(url_temp, "//pressao"))
  temperatura <- xml2::xml_double(xml2::xml_find_all(url_temp, "//temperatura"))
  tempo <- xml2::xml_text(xml2::xml_find_all(url_temp, "//tempo"))
  tempo_desc <- xml2::xml_text(xml2::xml_find_all(url_temp, "//tempo_desc"))
  umidade <- xml2::xml_double(xml2::xml_find_all(url_temp, "//umidade"))
  vento_dir <- xml2::xml_double(xml2::xml_find_all(url_temp, "//vento_dir"))
  vento_int <- xml2::xml_double(xml2::xml_find_all(url_temp, "//vento_int"))

  df <- data.frame(codigo = codigo,
                   atualizacao = atualizacao,
                   pressao = pressao,
                   temperatura = temperatura,
                   tempo = tempo,
                   tempo_desc = tempo_desc,
                   umidade = umidade,
                   vento_dir = vento_dir,
                   vento_int = vento_int)

  df

}
