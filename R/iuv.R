#' Get current ultra violet index
#'
#' This function allows the user to retrieve the last updated
#' data from CPTEC/INPE ultra violet index for a determined city
#'
#' @usage iuv(id)
#' @param id The city's ID
#' @return The function returns a data frame printed by city id
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{prevEstendida}}
#' @examples
#' ## Requesting the last updated of the ultra violet index drom Campo Grande/MS
#' iuv(225)
#'
#' ## The same for the city of Rio de Janeiro
#' iuv(241)
#'
#' @keywords weather forecast brazil ultra violet index
#' @export

iuv <- function(id) {

  url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/cidade/", id,"/condicoesAtuaisUV.xml"))

  nome <- xml2::xml_text(xml2::xml_find_all(url1, "//nome"))
  uf <- xml2::xml_text(xml2::xml_find_all(url1, "//uf"))
  data <- xml2::xml_text(xml2::xml_find_all(url1, "//data"))
  hora <- xml2::xml_text(xml2::xml_find_all(url1, "//hora"))
  iuv <- xml2::xml_double(xml2::xml_find_all(url1, "//iuv"))

  df <- data.frame(cidade = nome,
                   uf = uf,
                   data = data,
                   hora = hora,
                   iuv = iuv)

  df

}
