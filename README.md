<!-- README.md is generated from README.Rmd. Please edit that file -->

# [AFSC RACE Groundfish and Shellfish Survey MetaData](https://github.com/afsc-gap-products/metadata/) <img src="https://avatars.githubusercontent.com/u/91760178?s=96&amp;v=4" alt="Logo." align="right" width="139" height="139"/>

## This code is primarily maintained by:

**Emily Markowitz** (Emily.Markowitz AT noaa.gov;
[@EmilyMarkowitz-NOAA](https://github.com/EmilyMarkowitz-NOAA))  
Research Fisheries Biologist  
*Bering Sea Groundfish Survey Team*

**Chris Anderson** (Christopher Anderson AT noaa.gov;
[@ChrisAnderson-NOAA](https://github.com/ChrisAnderson-NOAA))  
Fisheries Biologist  
*Bering Sea Groundfish Survey Team*

**Alex Dowlin** (Alexandra.Dowlin AT noaa.gov;
[@AlexandraDowlin-NOAA](https://github.com/AlexandraDowlin-NOAA))
Fisheries Biologist  
*Gulf of Alaska and Aleutian Islands Groundfish Survey Team*

Alaska Fisheries Science Center,  
National Marine Fisheries Service,  
National Oceanic and Atmospheric Administration,  
Seattle, WA 98195

## Table of contents

> - [*This code is primarily maintained
>   by:*](#this-code-is-primarily-maintained-by:)
> - [*Table of contents*](#table-of-contents)
> - [*Metadata*](#metadata)
>   - [*User resources*](#user-resources)
>   - [*Relevant technical
>     memorandums*](#relevant-technical-memorandums)
>   - [*Table-level metadata*](#table-level-metadata)
>   - [*Column-level metadata*](#column-level-metadata)
> - [*Access the data in Oracle*](#access-the-data-in-oracle)
> - [*Suggestions and comments*](#suggestions-and-comments)
>   - [*R version metadata*](#r-version-metadata)
>   - [*NOAA README*](#noaa-readme)
>   - [*NOAA License*](#noaa-license)

# Metadata

These metadata were last updated on January 29, 2023.

## User resources

- [AFSC’s Resource Assessment and Conservation Engineering
  Division](https://www.fisheries.noaa.gov/about/resource-assessment-and-conservation-engineering-division).
- For more information about codes used in the tables, please refer to
  the [survey code
  books](https://www.fisheries.noaa.gov/resource/document/groundfish-survey-species-code-manual-and-data-codes-manual)
  (Resource Assessment and Division, 2021).
- Find [past
  reports](http://apps-afsc.fisheries.noaa.gov/RACE/surveys/cruise_results.htm)
  about these surveys.
- [GitHub repository](https://github.com/afsc-gap-products/metadata/).
- Learn more about other [Research Surveys conducted at
  AFSC](https://www.fisheries.noaa.gov/alaska/ecosystems/alaska-fish-research-surveys).
  \## Relevant technical memorandums

(Markowitz et al., 2022) (Von Szalay and Raring, 2018) (Von Szalay and
Raring, 2020)

<div id="refs" class="references csl-bib-body hanging-indent"
line-spacing="2">

<div id="ref-2021NEBS2022" class="csl-entry">

Markowitz, E. H., Dawson, E. J., Charriere, N. E., Prohaska, B. K.,
Rohan, S. K., Stevenson, D. E., and Britt, L. L. (2022). *Results of the
2021 eastern and northern Bering Sea continental shelf bottom trawl
survey of groundfish and invertebrate fauna* \[NOAA Tech. Memo.\].
*NMFS-F/SPO-452*, 227. <https://doi.org/10.25923/g1ny-y360>

</div>

<div id="ref-cb2021" class="csl-entry">

Resource Assessment, A. F. S. C. (U.S.)., and Division, C. E. (2021).
*Groundfish survey data codes and forms*.
<https://repository.library.noaa.gov/view/noaa/31570>

</div>

<div id="ref-GOA2018" class="csl-entry">

Von Szalay, P. G., and Raring, N. W. (2018). *Data report: 2017 gulf of
alaska bottom trawl survey* \[NOAA Tech. Memo.\]. *NMFS-AFSC-374*.
<https://apps-afsc.fisheries.noaa.gov/Publications/AFSC-TM/NOAA-TM-AFSC-374.pdf>

</div>

<div id="ref-AI2018" class="csl-entry">

Von Szalay, P. G., and Raring, N. W. (2020). *Data report: 2018 aleutian
islands bottom trawl survey* \[NOAA Tech. Memo.\]. *NMFS-AFSC-409*.
<https://repository.library.noaa.gov/view/noaa/26367>

</div>

</div>

## Table-level metadata

Here are some stock sentence users can use to document their tables:

| Sentence Type      | Sentence | NA                                                                                                                                                          |
|:-------------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|
| survey_institution | fragment | by the Resource Assessment and Conservation Engineering Division (RACE) Groundfish Assessment Program (GAP) of the Alaska Fisheries Science Center (AFSC).  |
| legal_restrict     | sentence | There are no legal restrictions on access to the data.                                                                                                      |
| foss               | sentence | The data from this dataset are shared on the Fisheries One Stop Stop (FOSS) platform (<https://www.fisheries.noaa.gov/foss/f?p=215:28:2283554735243>:::::). |
| github             | sentence | The GitHub repository for the scripts that created this code can be found at ‘INSERT_REPO’.                                                                 |
| last_updated       | sentence | These data were last updated INSERT_DATE.                                                                                                                   |
| codebook           | sentence | For more information about codes used in the tables, please refer to the survey code books (INSERT_CODE_BOOK).                                              |
| surveys            | fragment | the northern Bering Sea (NBS), eastern Bering Sea (EBS), Gulf of Alaska (GOA), Aleutian Islands (AI), Bering Sea Slope (BSS) Surveys                        |

## Column-level metadata

Here are stock metadata that users can use to document their table
columns:

| Column name from data | Descriptive column Name | Units      | Column description     | NA                                                       | NA                                              | NA                                          | NA                                                                                                                                                                                                                                                                  |
|:----------------------|:------------------------|:-----------|:-----------------------|:---------------------------------------------------------|:------------------------------------------------|:--------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NA                    | NA                      | All Levels | year                   | Year                                                     | numeric                                         | NUMBER(38,0)                                | Year the survey was conducted in.                                                                                                                                                                                                                                   |
| NA                    | NA                      | NA         | srvy                   | Survey                                                   | Abbreviated text                                | VARCHAR2(255 BYTE)                          | Abbreviated survey names. The column ‘srvy’ is associated with the ‘survey’ and ‘survey_id’ columns. Northern Bering Sea (NBS), Southeastern Bering Sea (EBS), Bering Sea Slope (BSS), Gulf of Alaska (GOA), Aleutian Islands (AI).                                 |
| NA                    | NA                      | NA         | survey                 | Survey Name                                              | text                                            | VARCHAR2(255 BYTE)                          | Name and description of survey. The column ‘survey’ is associated with the ‘srvy’ and ‘survey_id’ columns.                                                                                                                                                          |
| NA                    | NA                      | NA         | survey_id              | Survey ID                                                | ID code                                         | NUMBER(38,0)                                | This number uniquely identifies a survey. Name and description of survey. The column ‘survey_id’ is associated with the ‘srvy’ and ‘survey’ columns. For a complete list of surveys, review the \[code books\](<https://www.fisheries.noaa.gov/resource/document/g> |
| NA                    | NA                      | NA         | cruise                 | Cruise ID                                                | ID code                                         | NUMBER(38,0)                                | This is a six-digit number identifying the cruise number of the form: YYYY99 (where YYYY = year of the cruise; 99 = 2-digit number and is sequential; 01 denotes the first cruise that vessel made in this year, 02 is the second, etc.).                           |
| NA                    | NA                      | NA         | haul                   | Haul Number                                              | ID code                                         | NUMBER(38,0)                                | This number uniquely identifies a sampling event (haul) within a cruise. It is a sequential number, in chronological order of occurrence.                                                                                                                           |
| NA                    | NA                      | NA         | hauljoin               | Haul ID                                                  | ID Code                                         | NUMBER(38,0)                                | This is a unique numeric identifier assigned to each (vessel, cruise, and haul) combination.                                                                                                                                                                        |
| NA                    | NA                      | NA         | stratum                | Stratum ID                                               | ID Code                                         | VARCHAR2(255 BYTE)                          | RACE database statistical area for analyzing data. Strata were designed using bathymetry and other geographic and habitat-related elements. The strata are unique to each survey series. Stratum of value 0 indicates experimental tows.                            |
| NA                    | NA                      | NA         | station                | Station ID                                               | ID code                                         | VARCHAR2(255 BYTE)                          | Alpha-numeric designation for the station established in the design of a survey.                                                                                                                                                                                    |
| NA                    | NA                      | NA         | vessel_id              | Vessel ID                                                | ID Code                                         | NUMBER(38,0)                                | ID number of the vessel used to collect data for that haul. The column ‘vessel_id’ is associated with the ‘vessel_name’ column. Note that it is possible for a vessel to have a new name but the same vessel id number. For a complete list of vessel ID codes,     |
| NA                    | NA                      | NA         | vessel_name            | Vessel Name                                              | text                                            | VARCHAR2(255 BYTE)                          | Name of the vessel used to collect data for that haul. The column ‘vessel_name’ is associated with the ‘vessel_id’ column. Note that it is possible for a vessel to have a new name but the same vessel id number. For a complete list of vessel ID codes, revi     |
| NA                    | NA                      | NA         | date_time              | Date and Time of Haul                                    | MM/DD/YYYY HH::MM                               | TO_CHAR(START_TIME,‘MM/DD/YYYY HH24:MI:SS’) | The date (MM/DD/YYYY) and time (HH:MM) of the beginning of the haul.                                                                                                                                                                                                |
| NA                    | NA                      | NA         | longitude_dd_start     | Start Longitude (decimal degrees)                        | decimal degrees, 1e-05 resolution               | NUMBER(38,6)                                | Longitude (one hundred thousandth of a decimal degree) of the start of the haul.                                                                                                                                                                                    |
| NA                    | NA                      | NA         | latitude_dd_start      | Start Latitude (decimal degrees)                         | decimal degrees, 1e-05 resolution               | NUMBER(38,6)                                | Latitude (one hundred thousandth of a decimal degree) of the start of the haul.                                                                                                                                                                                     |
| NA                    | NA                      | NA         | longitude_dd_end       | End Longitude (decimal degrees)                          | decimal degrees, 1e-05 resolution               | NUMBER(38,6)                                | Longitude (one hundred thousandth of a decimal degree) of the end of the haul.                                                                                                                                                                                      |
| NA                    | NA                      | NA         | latitude_dd_end        | End Latitude (decimal degrees)                           | decimal degrees, 1e-05 resolution               | NUMBER(38,6)                                | Latitude (one hundred thousandth of a decimal degree) of the end of the haul.                                                                                                                                                                                       |
| NA                    | NA                      | NA         | species_code           | Taxon Code                                               | ID code                                         | NUMBER(38,0)                                | The species code of the organism associated with the ‘common_name’ and ‘scientific_name’ columns. For a complete species list, review the \[code books\](<https://www.fisheries.noaa.gov/resource/document/groundfish-survey-species-code-manual-and-data-codes-ma> |
| NA                    | NA                      | NA         | common_name            | Taxon Common Name                                        | text                                            | VARCHAR2(255 BYTE)                          | The common name of the marine organism associated with the ‘scientific_name’ and ‘species_code’ columns. For a complete species list, review the \[code books\](<https://www.fisheries.noaa.gov/resource/document/groundfish-survey-species-code-manual-and-data-c> |
| NA                    | NA                      | NA         | scientific_name        | Taxon Scientific Name                                    | text                                            | VARCHAR2(255 BYTE)                          | The scientific name of the organism associated with the ‘common_name’ and ‘species_code’ columns. For a complete taxon list, review the \[code books\](<https://www.fisheries.noaa.gov/resource/document/groundfish-survey-species-code-manual-and-data-codes-manu> |
| NA                    | NA                      | NA         | taxon_confidence       | Taxon Confidence Rating                                  | rating                                          | VARCHAR2(255 BYTE)                          | Confidence in the ability of the survey team to correctly identify the taxon to the specified level, based solely on identification skill (e.g., not likelihood of a taxon being caught at that station on a location-by-location basis). Quality codes follow:     |
| NA                    | NA                      | NA         | taxon_confidence0      | Taxon Confidence Rating                                  | numeric rating                                  | NUMBER(38,0)                                | Confidence in the ability of the survey team to correctly identify the taxon to the specified level, based solely on identification skill (e.g., not likelihood of a taxon being caught at that station on a location-by-location basis). Quality codes follow:     |
| NA                    | NA                      | NA         | cpue_kgha              | Weight CPUE (kg/ha)                                      | kilograms/hectare                               | NUMBER(38,6)                                | Relative Density. Catch weight (kilograms) divided by area (hectares) swept by the net.                                                                                                                                                                             |
| NA                    | NA                      | NA         | cpue_kgkm2             | Weight CPUE (kg/km<sup>2</sup>)                          | kilograms/kilometers<sup>2</sup>                | NUMBER(38,6)                                | Relative Density. Catch weight (kilograms) divided by area (squared kilometers) swept by the net.                                                                                                                                                                   |
| NA                    | NA                      | NA         | cpue_noha              | Number CPUE (no./ha)                                     | count/hectare                                   | NUMBER(38,6)                                | Relative Abundance. Catch number (in number of organisms) per area (hectares) swept by the net.                                                                                                                                                                     |
| NA                    | NA                      | NA         | cpue_nokm2             | Number CPUE (no./km<sup>2</sup>)                         | count/kilometers<sup>2</sup>                    | NUMBER(38,6)                                | Relative Abundance. Catch number (in number of organisms) per area (squared kilometers) swept by the net.                                                                                                                                                           |
| NA                    | NA                      | NA         | weight_kg              | Taxon Weight (kg)                                        | kilograms, thousandth resolution                | NUMBER(38,3)                                | Weight (thousandths of a kilogram) of individuals in a haul by taxon.                                                                                                                                                                                               |
| NA                    | NA                      | NA         | count                  | Taxon Count                                              | count, whole number resolution                  | NUMBER(38,0)                                | Total number of individuals caught in haul by taxon, represented in whole numbers.                                                                                                                                                                                  |
| NA                    | NA                      | Production | bottom_temperature_c   | Bottom Temperature (Degrees Celsius)                     | degrees Celsius, tenths of a degree resolution  | NUMBER(38,1)                                | Bottom temperature (tenths of a degree Celsius); NA indicates removed or missing values.                                                                                                                                                                            |
| NA                    | NA                      | NA         | surface_temperature_c  | Surface Temperature (Degrees Celsius)                    | degrees Celsius, tenths of a degree resolution  | NUMBER(38,1)                                | Surface temperature (tenths of a degree Celsius); NA indicates removed or missing values.                                                                                                                                                                           |
| NA                    | NA                      | NA         | bottom_temperature_c   | Bottom Temperature (Degrees Celsius)                     | degrees Celsius, tenths of a degree resolution  | NUMBER(38,1)                                | Bottom temperature (tenths of a degree Celsius); NA indicates removed or missing values.                                                                                                                                                                            |
| NA                    | NA                      | NA         | depth_m                | Depth (m)                                                | meters, tenths of a meter resolution            | NUMBER(38,1)                                | Bottom depth (tenths of a meter).                                                                                                                                                                                                                                   |
| NA                    | NA                      | NA         | distance_fished_km     | Distance Fished (km)                                     | kilometers, thousandths of kilometer resolution | NUMBER(38,3)                                | Distance the net fished (thousandths of kilometers).                                                                                                                                                                                                                |
| NA                    | NA                      | NA         | net_width_m            | Net Width (m)                                            | meters                                          | NUMBER(38,1)                                | Measured or estimated distance (meters) between wingtips of the trawl.                                                                                                                                                                                              |
| NA                    | NA                      | NA         | net_height_m           | Net Height (m)                                           | meters                                          | NUMBER(38,1)                                | Measured or estimated distance (meters) between footrope and headrope of the trawl.                                                                                                                                                                                 |
| NA                    | NA                      | NA         | area_swept_ha          | Area Swept (ha)                                          | hectares                                        | NUMBER(38,1)                                | The area the net covered while the net was fishing (hectares), defined as the distance fished times the net width.                                                                                                                                                  |
| NA                    | NA                      | NA         | duration_hr            | Tow Duration (decimal hr)                                | decimal hours                                   | NUMBER(38,1)                                | This is the elapsed time between start and end of a haul (decimal hours).                                                                                                                                                                                           |
| NA                    | NA                      | NA         | performance            | Haul Performance Code (rating)                           | rating                                          | NUMBER(38,0)                                | This denotes what, if any, issues arose during the haul. For more information, review the [code books](https://www.fisheries.noaa.gov/resource/document/groundfish-survey-species-code-manual-and-data-codes-manual).                                               |
| NA                    | NA                      | NA         | itis                   | ITIS Taxonomic Serial Number                             | ID code                                         | NUMBER(38,0)                                | Species code as identified in the Integrated Taxonomic Information System (<https://itis.gov/>). Codes were last updated NA.                                                                                                                                        |
| NA                    | NA                      | NA         | worms                  | World Register of Marine Species Taxonomic Serial Number | ID code                                         | NUMBER(38,0)                                | Species code as identified in the World Register of Marine Species (WoRMS) (<https://www.marinespecies.org/>). Codes were last updated NA.                                                                                                                          |
| NA                    | NA                      | NA         | metadata_colname       | Column name                                              | text                                            | VARCHAR2(255 BYTE)                          | Name of the column in a table.                                                                                                                                                                                                                                      |
| NA                    | NA                      | NA         | metadata_colname_long  | Column name spelled out                                  | text                                            | VARCHAR2(255 BYTE)                          | Long name for the column.                                                                                                                                                                                                                                           |
| NA                    | NA                      | NA         | metadata_units         | Units                                                    | text                                            | VARCHAR2(255 BYTE)                          | Units of the column.                                                                                                                                                                                                                                                |
| NA                    | NA                      | NA         | metadata_colname_desc  | column description                                       | text                                            | VARCHAR2(255 BYTE)                          | Descritpion of the column.                                                                                                                                                                                                                                          |
| NA                    | NA                      | NA         | metadata_sentence_type | Sentence type                                            | text                                            | VARCHAR2(255 BYTE)                          | Type of sentence to have in table metadata.                                                                                                                                                                                                                         |
| NA                    | NA                      | NA         | metadata_sentence      | Sentence                                                 | text                                            | VARCHAR2(255 BYTE)                          | Table metadata sentence.                                                                                                                                                                                                                                            |
| NA                    | NA                      | NA         | dummy                  | dummy                                                    | dummy                                           | VARCHAR2(255 BYTE)                          | dummy                                                                                                                                                                                                                                                               |

# Access the data in Oracle

Check out the `functions_oracle.R` script.

# Suggestions and comments

If the data or metadata can be improved, please create a pull request,
[submit an issue to the GitHub
organization](https://github.com/afsc-gap-products/data-requests/issues)
or [submit an issue to the code’s
repository](https://github.com/afsc-gap-products/metadata//issues).

## R version metadata

This data was compiled using the below `R` environment and `R` packages:

``` r
sessionInfo()
```

    ## R version 4.2.2 (2022-10-31 ucrt)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 19045)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_United States.utf8  LC_CTYPE=English_United States.utf8    LC_MONETARY=English_United States.utf8
    ## [4] LC_NUMERIC=C                           LC_TIME=English_United States.utf8    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] knitr_1.42        badger_0.2.2      RODBC_1.3-20      janitor_2.1.0     xlsx_0.6.5        googledrive_2.0.0 magrittr_2.0.3   
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] lubridate_1.9.1     xlsxjars_0.6.1      assertthat_0.2.1    digest_0.6.31       utf8_1.2.2          R6_2.5.1            evaluate_0.20      
    ##  [8] httr_1.4.4          ggplot2_3.4.0       pillar_1.8.1        yulab.utils_0.0.6   rlang_1.0.6         curl_5.0.0          data.table_1.14.6  
    ## [15] rstudioapi_0.14     rmarkdown_2.20      readr_2.1.3         stringr_1.5.0       dlstats_0.1.6       bit_4.0.5           munsell_0.5.0      
    ## [22] compiler_4.2.2      xfun_0.36           pkgconfig_2.0.3     askpass_1.1         htmltools_0.5.4     openssl_2.0.5       tidyselect_1.2.0   
    ## [29] tibble_3.1.8        fansi_1.0.4         crayon_1.5.2        dplyr_1.0.10        tzdb_0.3.0          withr_2.5.0         rappdirs_0.3.3     
    ## [36] grid_4.2.2          jsonlite_1.8.4      gtable_0.3.1        lifecycle_1.0.3     DBI_1.1.3           scales_1.2.1        cli_3.6.0          
    ## [43] stringi_1.7.12      vroom_1.6.1         fs_1.6.0            snakecase_0.11.0    ellipsis_0.3.2      rvcheck_0.2.1       generics_0.1.3     
    ## [50] vctrs_0.5.2         RColorBrewer_1.1-3  tools_4.2.2         bit64_4.0.5         glue_1.6.2          purrr_1.0.1         hms_1.1.2          
    ## [57] parallel_4.2.2      fastmap_1.1.0       yaml_2.3.7          timechange_0.2.0    colorspace_2.1-0    gargle_1.2.1        BiocManager_1.30.19
    ## [64] readtext_0.81       rJava_1.0-6

## NOAA README

This repository is a scientific product and is not official
communication of the National Oceanic and Atmospheric Administration, or
the United States Department of Commerce. All NOAA GitHub project code
is provided on an ‘as is’ basis and the user assumes responsibility for
its use. Any claims against the Department of Commerce or Department of
Commerce bureaus stemming from the use of this GitHub project will be
governed by all applicable Federal law. Any reference to specific
commercial products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of Commerce.
The Department of Commerce seal and logo, or the seal and logo of a DOC
bureau, shall not be used in any manner to imply endorsement of any
commercial product or activity by DOC or the United States Government.

## NOAA License

Software code created by U.S. Government employees is not subject to
copyright in the United States (17 U.S.C. §105). The United
States/Department of Commerce reserve all rights to seek and obtain
copyright protection in countries other than the United States for
Software authored in its entirety by the Department of Commerce. To this
end, the Department of Commerce hereby grants to Recipient a
royalty-free, nonexclusive license to use, copy, and create derivative
works of the Software outside of the United States.

<img src="https://raw.githubusercontent.com/nmfs-general-modeling-tools/nmfspalette/main/man/figures/noaa-fisheries-rgb-2line-horizontal-small.png" alt="NOAA Fisheries" height="75"/>

[U.S. Department of Commerce](https://www.commerce.gov/) \| [National
Oceanographic and Atmospheric Administration](https://www.noaa.gov) \|
[NOAA Fisheries](https://www.fisheries.noaa.gov/)
