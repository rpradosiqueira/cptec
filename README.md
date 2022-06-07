cptec
=====

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/cptec)](https://CRAN.R-project.org/package=cptec) [![CRAC\_Downloads](https://cranlogs.r-pkg.org/badges/grand-total/cptec)](https://CRAN.R-project.org/package=cptec)

The goal of *cptec* is to allows the user to retrieve data from the CPTEC/INPE weather forecast API. CPTEC stands for 'Centro de Previsão de Tempo e Estudos Climáticos' and INPE for 'Instituto Nacional de Pesquisas Espaciais'. CPTEC is the most advanced numerical weather and climate forecasting center in Latin America, with high-precision short and medium-term weather forecasting since the beginning of 1995. See <https://www.cptec.inpe.br/> for more information.

Installation
------------

Install the release version from CRAN:

``` r
install.packages("cptec")
```

or the development version from github

``` r
# install.packages("devtools")
devtools::install_github("rpradosiqueira/cptec")
```

Functions
---------

The "cptec" package contains the functions:

``` r
prev4dias          It retrieve 4 days weather forecast data
                   according to the 'id' provided
                   
prev7dias          It retrieve 7 days weather forecast data
                   according to the 'id' provided
                   
listaCidades       It allows the user to discover which are
                   the city`s ID of interest

metar              It allows the user to retrieve data from
                   airport surface stations
                   
ondas              It allows the user to retrieve data from
                   sea waves
                   
prevEstendida      It retrieve 14 days weather forecast data
                   according to the 'id' provided
                    
prevLatLon         It retrieve 7 days weather forecast data
                   according to the latitude/longitude provided
                   
estendidaLatLon    It retrieve 14 days weather forecast data
                   according to the latitude/longitude provided
                   
iuv                It retrieve the last updated data from CPTEC/INPE
                   ultra violet index for a determined city
                   
estacoes_metar     List "Metar" initials and descriptions

condicoes_tempo    List "tempo" descriptions

capitais           It allows the user to retrieve data from
                   current weather conditions of capitals
```

Example
-------

Let's assume that we want the next 7 days weather forecast for the city of Rio de Janeiro/RJ. To do this simply execute:

``` r
library(cptec)

prev7dias(id = 241)
#>           cidade uf atualizacao        dia tempo maxima minima iuv
#> 1 Rio de Janeiro RJ  2017-09-21 2017-09-22    vn     33     17   9
#> 2 Rio de Janeiro RJ  2017-09-21 2017-09-23    pn     33     18   9
#> 3 Rio de Janeiro RJ  2017-09-21 2017-09-24    vn     35     17   9
#> 4 Rio de Janeiro RJ  2017-09-21 2017-09-25    pn     27     17   9
#> 5 Rio de Janeiro RJ  2017-09-21 2017-09-26    vn     31     17   9
#> 6 Rio de Janeiro RJ  2017-09-21 2017-09-27    vn     32     17   9
```
