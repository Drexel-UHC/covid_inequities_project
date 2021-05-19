# trends/

This folder the data presented on the dashboard including: cumulative rates (by city, by ZCTA, by Race/Ethnicity), trends and inequities. Please see below for details about each file.


## trends_outcome_byCity_bchc.csv

Daily trends for various COVID-19 cases, deaths, hospitalizations for each BCHC city, where data was available. Indicators include:

| Column            | Description                                                                                                            |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| city              | City for which data is presented                                                                                |
| date              | Date for which data is presented                                                                                    |
| new_cases_raw     | Unsmoothed new confirmed cases. If blank then this outcome was not available for this city on this date.               |
| new_cases_7dayMA  | 7 day moving average of new confirmed cases. If blank then this outcome was not available for this city on this date.  |
| new_deaths_raw    | Unsmoothed new deaths. If blank then this outcome was not available for this city on this date.                        |
| new_deaths_7dayMA | 7 day moving average of new deaths. If blank then this outcome was not available for this city on this date.           |
| new_hosp_raw      | Unsmoothed new hospitalizations. If blank then this outcome was not available for this city on this date.              |
| new_hosp_7dayMA   | 7 day moving average of new hospitalizations. If blank then this outcome was not available for this city on this date. |
| date_of_access | Date   that the county/city data source was accessed. For example, a value of   04/01/21 indicates that the data presented in this row consists of cumulative   counts from the start of the epidemic to 04/01/21. Note- there are often   reporting lags, so this value may lag by a number of days or weeks depending   on the county/city data source. |    
| source         | Data was collected from one of three sources: LHD (Local Health Department's publicly available data), JHU (Johns Hopkins University's COVID-19 data repository) or CDC (Centers for Disease Control and Prevention, COVID-19 Surveillance data).                                                                                                                                                                                                                                                                                                                                                    |     
| geo_level| This column incidates whether the data collected was at the county or city level. Note, all city-county consolidates (Baltimore, New York City, Philadelphia, San Francisco, Washington, Denver) have been labeled as city.                                                                                                                                                                                                                                                                                                                                                                        | |
<hr>

## trends_testing_byCity_bchc.csv

Daily trends for COVID-19 testing for each BCHC city, where data was available. Indicators include:

| Column              | Description                                                                                                                          |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| city                | City for which data is presented                                                                                              |
| date                | Date for which data is presented                                                                                           |
| n_pos_test_7dayMA   | 7 day moving average of positive tests. If blank then this outcome was not available for this city on this date.                      |
| n_total_test_7dayMA | 7 day moving average of total number of tests. If blank then this outcome was not available for this city on this date.              |
| pct_positive_7dayMA | 7 day moving average of % of total test that were positive. If blank then this outcome was not available for this city on this date. |
| date_of_access | Date   that the county/city data source was accessed. For example, a value of   04/01/21 indicates that the data presented in this row consists of cumulative   counts from the start of the epidemic to 04/01/21. Note- there are often   reporting lags, so this value may lag by a number of days or weeks depending   on the county/city data source. |    
| source         | Data was collected from one of three sources: LHD (Local Health Department's publicly available data), JHU (Johns Hopkins University's COVID-19 data repository) or CDC (Centers for Disease Control and Prevention, COVID-19 Surveillance data).                                                                                                                                                                                                                                                                                                                                                    |     
| geo_level| This column incidates whether the data collected was at the county or city level. Note, all city-county consolidates (Baltimore, New York City, Philadelphia, San Francisco, Washington, Denver) have been labeled as city.                                                                                                                                                                                                                                                                                                                                                                        | |
