#' Retrieve weather condition data from Metars
#'
#' This function allows the user to retrieve data from
#' airport surface stations (Metar), coded and made
#' available by the meteorological network of the
#' Aeronautics Command - REDEMET
#'
#' @usage metar(x)
#' @param x A character vector with the desired weather station(s) code(s)
#' @return The function returns a data frame
#' @author  Renato Prado Siqueira \email{rpradosiqueira@@gmail.com}
#' @seealso \code{\link{estacoes_metar}}
#' @examples
#' ## Requesting weather condition from SBGR and SBTK stations
#' metar(c("SBGR", "SBTK"))
#'
#' ## Requesting weather condition from SBVG (Varginha) station
#' metar("SBVG")
#'
#' @keywords weather forecast brazil
#' @export

metar <- function(x) {

  if(!is.character(x)) stop("'x' must be of a character type")

  df <- data.frame()

  for (i in 1:length(x)) {

    url_temp <- xml2::read_xml(paste0("http://servicos.cptec.inpe.br/XML/estacao/",x[i],"/condicoesAtuais.xml"))

    codigo <- xml2::xml_text(xml2::xml_find_all(url_temp, "//codigo"))
    atualizacao <- xml2::xml_text(xml2::xml_find_all(url_temp, "//atualizacao"))
    pressao <- xml2::xml_double(xml2::xml_find_all(url_temp, "//pressao"))
    temperatura <- xml2::xml_double(xml2::xml_find_all(url_temp, "//temperatura"))
    tempo <- xml2::xml_text(xml2::xml_find_all(url_temp, "//tempo"))
    tempo_desc <- xml2::xml_text(xml2::xml_find_all(url_temp, "//tempo_desc"))
    umidade <- xml2::xml_double(xml2::xml_find_all(url_temp, "//umidade"))
    vento_dir <- xml2::xml_double(xml2::xml_find_all(url_temp, "//vento_dir"))
    vento_int <- xml2::xml_double(xml2::xml_find_all(url_temp, "//vento_int"))
    visibilidade <- trimws(xml2::xml_text(xml2::xml_find_all(url_temp, "//visibilidade")))

    df_temp <- data.frame(codigo = codigo,
                          atualizacao = atualizacao,
                          pressao = pressao,
                          temperatura = temperatura,
                          tempo = tempo,
                          tempo_desc = tempo_desc,
                          umidade = umidade,
                          vento_dir = vento_dir,
                          vento_int,
                          visibilidade = visibilidade)

    df <- rbind.data.frame(df, df_temp)

  }

  df

}
