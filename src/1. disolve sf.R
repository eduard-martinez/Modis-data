# Autor: Eduard Martinez
# Colaboradores:
# Elaborado: 15/01/2020
# Ultima modificacion: 06/02/2020  

# clean environment and load packages
rm(list=ls())
options('scipen'=100, 'digits'=4) # Forzar a R a no usar e+
pacman::p_load(here,tidyverse,sf,sp,rgeos,rgdal)

# load layers
country = st_read(dsn = here('input/layers/MGN_MPIO_POLITICO.shp')) %>%
          subset(!as.character(as.numeric(MPIO_CCNCT)) %in% c(88001,88564))
country = as_Spatial(country) %>% gUnaryUnion() %>% st_as_sf()
st_crs(country) = 4326 

# save layer
saveRDS(country,here('input/layers/colombia disolve (sin sa).rds'))

