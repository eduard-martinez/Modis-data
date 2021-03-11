#/////////////////////#
# USO DEL SUELO MODIS #
#/////////////////////#

Los datos fueron descargados el 26/08/2020 de la pagina EARTHDATA de NASA. Los datos se descargan anuales, empezando por el 2001/12/31 hasta 2018/12/31.

#---------------------#
# Descargar los datos # 
#---------------------#

Los datos pueden ser descargados ingresando al siguiente link:

https://worldview.earthdata.nasa.gov/?v=-88.78952143772011,-4.191920934872545,-58.9630839975232,15.327855721681622&t=2002-01-01-T00%3A00%3A00Z&z=1&i=1&l=Reference_Features,MODIS_Combined_L3_IGBP_Land_Cover_Type_Annual,Particulate_Matter_Below_2.5micrometers_2010-2012(hidden),Particulate_Matter_Below_2.5micrometers_2001-2010(hidden),VIIRS_SNPP_Thermal_Anomalies_375m_Night(hidden),VIIRS_SNPP_Thermal_Anomalies_375m_Day(hidden),Coastlines(hidden),VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor(hidden)&download=MCD12Q1

#--------------------------#
# Descripcion de los datos #
#--------------------------#

Los raster de MODIS contienen varias bandas, pero usaremos los datos de MCD12Q1 los cuales constan de 17 categorias de acuerdo con International Geosphere-Biosphere Programme (IGBP) legend and classdescriptions. Usando la Tabla 3 del documento MCD12_User_Guide_V6.pdf tenemos: 

|-------------------------------------|-------|
|                  Name               | Value |
|-------------------------------------|-------|
| Evergreen Needleleaf Forests        |   1   | 
| Evergreen Broadleaf Forests         |   2   |  
| Deciduous Needleleaf Forests        |   3   |  
| Deciduous Broadleaf Forests         |   4   |  
| Mixed Forests                       |   5   | 
| Closed Shrublands                   |   6   |  
| Open Shrublands                     |   7   |  
| Woody Savannas                      |   8   |  
| Savannas                            |   9   |
| Grasslands                          |   10  |  
| Permanent Wetlands                  |   11  | 
| Croplands                           |   12  |  
| Urban and Built-up Lands            |   13  | 
| Cropland/Natural Vegetation Mosaics |   14  |  
| Permanent Snow and Ice              |   15  |  
| Barren                              |   16  | 
| Water Bodies                        |   17  |  
| Unclassified                        |   255 | 
|-------------------------------------|-------|
Nota: Un diccionario completo de estos datos se encuentra en https://icdc.cen.uni-hamburg.de/fileadmin/user_upload/icdc_Dokumente/MODIS/mcd12_user_guide_v6.pdf


#-------------------------------#
# Descripcion de cada categoria #
#-------------------------------#

# Value 1
Dominated by evergreen conifer trees (canopy >2m). Tree cover >60%.

# Value 2
Dominated by evergreen broadleaf and palmate trees (canopy >2m). Tree cover >60%.

# Value 3
Dominated by deciduous needleleaf (larch) trees (canopy >2m). Tree cover >60%.

# Value 4
Dominated by deciduous broadleaf trees (canopy >2m). Tree cover >60%.

# Value 5
Dominated by neither deciduous nor evergreen (40-60% of each) tree type (canopy >2m). Tree cover >60%.

# Value 6
Dominated by woody perennials (1-2m height) >60% cover.

# Value 7
Dominated by woody perennials (1-2m height) 10-60% cover.

# Value 8
Tree cover 30-60% (canopy >2m).

# Value 9
Tree cover 10-30% (canopy >2m).

# Value 10
Dominated by herbaceous annuals (<2m).

# Value 11
Permanently inundated lands with 30-60% water cover and >10% vegetated cover.

# Value 12
At least 60% of area is cultivated cropland.

# Value 13
At least 30% impervious surface area including building materials, asphalt, and vehicles.

# Value 14
Mosaics of small-scale cultivation 40-60% with natural tree, shrub, or herbaceous vegetation.

# Value 15
At least 60% of area is covered by snow and ice for at least 10 months of the year.

# Value 16
At least 60% of area is non-vegetated barren (sand, rock, soil) areas with less than 10% veg- etation.

# Value 17
At least 60% of area is covered by permanent wa- ter bodies.

# Value 255
Has not received a map label because of missing inputs.

