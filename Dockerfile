FROM rocker/tidyverse:4.6

# bibliotecas de sistema extras
# (libglpk-dev: exigida pelo igraph, dependência do mixOmics)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libmagick++-dev \
    libglpk-dev \
 && rm -rf /var/lib/apt/lists/*

# pacotes R do projeto (CRAN)
RUN install2.r --error --skipinstalled \
    tidymodels ranger xgboost janitor magick devtools roxygen2