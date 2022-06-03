#' Data frame containing "tempo" descriptions
#'
#' @usage condicoes_tempo()
#' @return The function returns a sigle data frame.
#' @author  Renato Prado Siqueira \email{rpradosiqueira@@gmail.com}
#' @seealso \code{\link{estacoes_metar}}
#' @examples
#'
#' \dontrun{
#'
#' condicoes_tempo()
#'
#' }
#'
#' @keywords weather forecast brazil
#' @importFrom magrittr %>%
#' @export

condicoes_tempo <- function() {

  url1 <- xml2::read_html("http://servicos.cptec.inpe.br/XML/#req-estacoes-meteorologicas")

  tabela <- url1 %>% rvest::html_nodes("#condicoes-tempo td") %>% rvest::html_text()

  tabela <- data.frame(matrix(tabela, byrow = TRUE, ncol = 2))
  names(tabela) <- c("Sigla", "Descricao")

  tabela

}
