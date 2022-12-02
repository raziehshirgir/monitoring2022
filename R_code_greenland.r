R code for greenland ice melting
# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
# install.packages("rasterVis")
library(raster)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

# library(rasterVis)

# library(rgdal)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# list f files:
rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist,raster)
import

TGr <- stack(import)
TGr
plot(TGr)
ggplot() +
geom_raster(lst_2000 , mapping = aes(x=x, y=y, fill=lst_2000)) + 
scale_fill_viridis(option="magma" , direction=1, alpha=0.2) +
ggtitle("Temperature 2000")
ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000")
scale_fill_viridis(option="magma" , direction=1, alpha=0.2) +
ggtitle("Temperature 2000")
# using viridis
ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000") +
scale_fill_viridis(option="inferno")

# using viridis with alpha
ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000") +
scale_fill_viridis(option="inferno", alpha=0.8)

# using viridis changing direction
ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000") +
scale_fill_viridis(option="inferno", alpha=0.8, direction=-1)

# options:
# • "magma" (or "A")
# • "inferno" (or "B")
# • "plasma" (or "C")
# • "viridis" (or "D")
# • "cividis" (or "E")
# • "rocket" (or "F")
# • "mako" (or "G")
# • "turbo" (or "H")

#2015
ggplot() +
geom_raster(TGr[[4]], mapping = aes(x=x, y=y, fill=lst_2015)) +
ggtitle("lst 2015") +
scale_fill_viridis(option="inferno", alpha=0.8, direction=-1)

#plot them together via patchwork
p1 <- ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000") +
scale_fill_viridis(option="inferno", alpha=0.8, direction=-1)

p2 <- ggplot() +
geom_raster(TGr[[4]], mapping = aes(x=x, y=y, fill=lst_2015)) +
ggtitle("lst 2015") +
scale_fill_viridis(option="inferno", alpha=0.8, direction=-1)

p1 + p2

# Exercise: do the same via mako
p1 <- ggplot() +
geom_raster(TGr[[1]], mapping = aes(x=x, y=y, fill=lst_2000)) +
ggtitle("lst 2000") +
scale_fill_viridis(option="mako", alpha=0.8, direction=-1)

p2 <- ggplot() +
geom_raster(TGr[[4]], mapping = aes(x=x, y=y, fill=lst_2015)) +
ggtitle("lst 2015") +
scale_fill_viridis(option="mako", alpha=0.8, direction=-1)

p1 + p2

# Exercise. make the difference between 2015 and 2000
dift = TGr[[4]] - TGr[[1]]

# Exercise plot it in the same graph of the previous plots
p3 <- ggplot() +
geom_raster(TGr[[4]], mapping = aes(x=x, y=y, fill=lst_2015)) +
ggtitle("lst 2015") +
scale_fill_viridis(option="viridis", alpha=0.8)

p1 + p2 + p3
