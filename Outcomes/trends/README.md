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

