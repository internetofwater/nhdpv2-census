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

* an identifier of the form https://geoconnex.us/iow/nhdpv2-census/(2000|2010|2020)/comid/{NHDPlusV2 ComID}/block/{Census Block GEOID} was constructed
* The area of the orginal census block
* The area of the original catchment polygon
* The % area of the original census block covered by the intersection
* THe % area of the orginal catchment polygon covered by the intersection

This information, combined with the population estimate from the US Census for the year of choice, is sufficient to construct [population-area weightings]() to summarize arbitrary census variables for arbitrary collections of census block intersctions that correspond to arbitrary hydrographies made up of NHDPlusV2 Catchments. 

## Data Availability

### Bulk download

* https://storage.googleapis.com/nhgf/2000CensusPolys.gpkg
* https://storage.googleapis.com/nhgf/2010CensusPolys.gpkg
* https://storage.googleapis.com/nhgf/2020CensusPolys.gpkg

### API Access

#### OGC-API Features

For each year, a collection at https://nhdpv2-census.geoconnex.dev/collections is available. 

#### OGC-API Process for intersection by reference

A tool is available to return a GeoJSON feature collection consisting of all intersection polygons for the desired Census decade and a polygon supplied as geojson via a url.

The tool is available as an OGC-API Process at https://nhdpv2-census.geoconnex.dev/processes/intersector 

For example

```
curl -X 'POST' \
  'https://nhdpv2-census.geoconnex.dev/processes/intersector/execution' \
  --compressed \
  -H 'Content-Type: application/json' \
  -d '{
  "inputs": {
    "url": "https://geoconnex.us/ref/pws/NC0241010"
  }
}
```

