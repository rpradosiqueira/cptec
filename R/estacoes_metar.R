#' Data frame containing "Metar" initials and descriptions
#'
#' @usage estacoes_metar()
#' @return The function returns a sigle data frame.
#' @author  Renato Prado Siqueira \email{<rpradosiqueira@gmail.com>}
#' @seealso \code{\link{condicoes_tempo}}
#' @examples
#' estacoes_metar()
#'
#' @keywords weather forecast brazil
#' @importFrom magrittr %>%
#' @export

estacoes_metar <- function() {

  url1 <- xml2::read_html("http://servicos.cptec.inpe.br/XML/#req-estacoes-meteorologicas")

  tabela <- url1 %>% rvest::html_nodes("#estacoes-metar td") %>% rvest::html_text()

  tabela <- data.frame(matrix(tabela, byrow = TRUE, ncol = 3))
  names(tabela) <- c("Sigla", "Aeroporto", "Estado")

  tabela

}
