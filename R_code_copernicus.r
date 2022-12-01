how to download and analyse copernicus data
# R_code_snow.r

# Copernicus set:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

# Register and Login
# Download data from Criosphere
# The arrow should be blue
# Info: https://land.copernicus.eu/global/content/sce-nhemi-product-s-npp-viirs-data-affected

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

# install.packages("ncdf4")
library(ncdf4) #reading nc files
library(raster) #usual package
library(ggplot2) #beautiful plots
library(RStoolbox) #RS functions
library(viridis) # legend - colour
library(patchwork)
setwd("/Users/alireza/Desktop/lab/")

snow <- raster("~/Downloads/c_gls_SCE_202012210000_NHEMI_VIIRS_V1.0.1.nc")

ggplot() +
geom_raster(snow, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="mako")
ggplot() +
geom_raster(snow, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

# Crop over Europe
ext <- c(-2, 50, 20, 70)
snow.europe <- crop(snow, ext)
ext <- c(-20, 70, 20, 50)
snow.europe <- crop(snow,ext)
ggplot() +
geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="mako")

ggplot() +
geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="inferno")

p1 <- ggplot() +
geom_raster(snow, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="mako")

p2 <- ggplot() +
geom_raster(snow.europe, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="mako")

p1 + p2

#----------
