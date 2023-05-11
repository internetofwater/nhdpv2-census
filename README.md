# nhdpv2-census
USGS National Hydrologic Geospatial Fabric intersected with US Census Blocks.

This repository hosts code to create a geospatial intersection of NHDPlusV2 catchments with U.S. Census Blocks and deploy both the intersection polygons and the census blocks as OGC-API Features Endpoints. 

## Why?

For various socio-hydrological research questions, it can be important to summarize sociodemographic data for arbitrary catchment areas, or to summarize hydrological data for collections of areas for which sociodemographic data is collected. For example, one may wish to analyze population density, income, and racial distributions over an area for which flood, drought, or water quality indicators may be readily summarized. 

The most basic spatial unit of sociodemographic information available in the United States is the [Census Block](https://www.census.gov/newsroom/blogs/random-samplings/2011/07/what-are-census-blocks.html). These change from year to year but see significant redrawings for decadal census years. 

An important spatial unit for hydrological information in the United States is the [NHD](https://www.usgs.gov/national-hydrography/national-hydrography-dataset) Catchment polygon. Catchments describe
