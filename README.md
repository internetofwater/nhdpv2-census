# nhgf-census
USGS National Hydrologic Geospatial Fabric intersected with US Census Blocks.

This repository hosts code to create a geospatial intersection of NHDPlusV2 catchment polygons (as represented in NHGF) with the 2000, 2010, and 2020 U.S. Census Blocks, and to deploy the resulting feature collections as OGC-API Features endpoints with an associated OGC-API process helper service.

## Motivation
There are many use cases within social and environmental science and policy for being able to create summaries of sociodemographic for hydrologic areas in a consistent manner, which requires conflating Census geographies with the hydrologic landscape (most notably represented in digital form by the NHD products). For policy in particular, summarization methods and any resulting data products need to be open, well-documented, and agreed upon by key stakeholders. Some example use cases include: 

1. Prioritizing small basins for investments and subsidies for relevant wastewater control based on demographics and known water quality/ impairment information
1. Prioritizing basins for monitoring/surveillance infrastructure or activity based on demographics and known water quality, scarcity, and/or flooding risks at fine resolution.
1. Estimating water availability in rural areas net modeled withdrawals.
1. Studying relationships between demographics, land use/ land cover, runoff/downstream water quality and economic activity at the watershed scale at higher resolution than HUC12.

## Method

Implementation code is in the `src` directory

NHDPlusV2 Catchment Polygons were retrieved from the USGS National Hydrologic Geospatial Fabric (NHGF) Reference Hydrofabric [data release](https://www.sciencebase.gov/catalog/item/61295190d34e40dd9c06bcd7). 

Census Block polygons for 2000, 2010, 2020 were retrieved from the US Census Bureau Geographies ([TIGER/Line Shapefiles](https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html)) program. 

For each year, the geospatial intersection of catchments and blocks was computed. Then for each intersection polygon, the following information was created:

* an identifier of the form [] was constructed
* 

For each census year, 
