# Autor: Eduard Martinez
# Colaboradores:
# Elaborado: 15/01/2020
# Ultima modificacion: 05/02/2020  

# clean environment and load packages
rm(list=ls())
options("scipen"=100, "digits"=4) # Forzar a R a no usar e+
pacman::p_load(here,tidyverse,sf,raster,gdalUtils,sp,rgdal,rgeos)

# opciones paquete raster
rasterOptions(progress = "text", timer = TRUE)

#///////////////////#
# extrac .tif tiles #
#///////////////////#

# function
f_extrac = function(year){
           files = list.files(path = here('input/raw/',year), pattern = "\\.hdf", full.names = TRUE)
           for (i in 1:length(files)) {
                tile = get_subdatasets(files[i])  
                gdal_translate(tile[1], dst_dataset = paste0(here('input/temp/land_cover_'),year,'_tile_',i,'.tif'))
           }
}

# apply function
years = 2001:2018
lapply(years, function(x) f_extrac(year = x))

#////////////////////#
# merge raster files #
#////////////////////#

# function
f_merge = function(year){
          files = list.files(path = here('input/temp'), full.names = TRUE) %>%
                  .[grep(year,.)]
          lc = lapply(files,raster)  
          if(year == 2001){land = raster::merge(lc[[1]], lc[[2]], lc[[3]], lc[[4]], lc[[5]], lc[[6]], lc[[7]])} 
          else {land = raster::merge(lc[[1]], lc[[2]], lc[[3]], lc[[4]], lc[[5]], lc[[6]])}
return(land)      
}

# apply function
years = 2001:2018
land_layer = lapply(years, function(x) f_merge(year = x)) %>% stack()
names(land_layer) = years %>% as.character() %>% paste0('cover_',.)

# crop raster layer 
country = readRDS(here('input/layers/colombia disolve (sin sa).rds')) %>% 
          as_Spatial() %>% spTransform(.,crs(land_layer))
land_colombia = crop(land_layer,country) %>% mask(.,country)

# export raster layer
saveRDS(object = land_colombia , file = here('output/colombia 2001-2018 (raster).rds'))

# delete temp files
#lapply(list.files(here('input/temp'),full.names = T) , function(x) file.remove(x))

#//////////////#
# raster to sf #
#//////////////#

### raster to sf
point_sp = rasterToPoints(x = land_colombia , spatial = T) 
point_sp = spTransform(point_sf ,CRSobj = '+proj=longlat +datum=WGS84 +no_defs')
crs(point_sp) #= '+proj=longlat +datum=WGS84 +no_defs'
point_sf = st_as_sf(point_sp)
saveRDS(object = point_sf , file = here('output/colombia 2001-2018 (points).rds'))


#point_sp = rasterToPolygons(x = land_colombia$cover_2001) 
# crs("+proj=merc +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
