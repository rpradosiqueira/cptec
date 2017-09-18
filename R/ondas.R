#' Forecast of sea waves for coastal locations
#'
#' This function allows the user to retrieve data from
#' CPTEC/INPE weather forecast API for sea waves.
#' The data frame returned contain last updat, day, hour of
#' the day, sea turmoil, wave's height and wind's direction
#' and intensity
#'
#' @usage ondas(id, dia = "todos")
#' @param id The city's ID
#' @param dia "todos" (default) or a numeric/character value with "0", "1" or "2"
#' @details
#'   The \code{dia} argument can be set to:
#'   \itemize{
#'      \item 0: Return only the actual's day data
#'      \item 1: Return only the tomorrow's data
#'      \item 2: Return only the after tomorrow's data
#'      \item todos: Return all data available
#'      }
#' @return The function returns a data frame printed by parameters input
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{iuv}}
#' @examples
#' \dontrun{
#' ## Requesting sea waves' forecast from the city of Rio de Janeiro/RJ
#' ondas(241)
#' }
#'
#' @keywords wave forecast brazil litoral
#' @export

ondas <- function(id, dia = "todos") {

  dia <- as.character(dia)
  confs <- c("0", "1", "2", "todos")

  if (!(dia %in% confs)) stop("The 'dia' argument is misspecified")
  if (length(dia) != 1) stop("The 'dia' argument must be of length 1")
  if (length(id) != 1) stop("The 'id' argument must be of length 1")

  if (dia == "todos") {

    url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/cidade/", id,"/todos/tempos/ondas.xml"))

  } else {

    url1 <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/cidade/", id,"/dia/", dia, "/ondas.xml"))

  }

  nome <- xml2::xml_text(xml2::xml_find_all(url1, "//nome"))
  uf <- xml2::xml_text(xml2::xml_find_all(url1, "//uf"))
  atualizacao <- xml2::xml_text(xml2::xml_find_all(url1, "//atualizacao"))
  dia <- xml2::xml_text(xml2::xml_find_all(url1, "//dia"))
  agitacao <- xml2::xml_text(xml2::xml_find_all(url1, "//agitacao"))
  altura <- xml2::xml_double(xml2::xml_find_all(url1, "//altura"))
  direcao <- xml2::xml_text(xml2::xml_find_all(url1, "//direcao"))
  vento <- xml2::xml_double(xml2::xml_find_all(url1, "//vento"))
  vento_dir <- xml2::xml_text(xml2::xml_find_all(url1, "//vento_dir"))

  df <- data.frame(cidade = nome,
                   uf = uf,
                   atualizacao = atualizacao,
                   dia = dia,
                   agitacao = agitacao,
                   altura = altura,
                   direcao = direcao,
                   vento = vento,
                   vento_dir = vento_dir)

  df

}
