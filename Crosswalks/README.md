# Crosswalks/

This folder contains Geographic Relationship Files (aka crosswalks) which define the geographic relationship between BCHC cities and various geographic units. The primary key which links all of these files is the column name 'city'. 

## xwalk_fips_bchc.csv

One of the aims of this project is to compare COVID-19 outcomes across BCHC cities; however, city-level data is not always available. Therefore, it is necessary to use county-level data as a proxy for some cities. Cities for which we use county data are linked to their respective county proxies is detailed in xwalk_fips_bchc.csv. Note that New York City is a special case where the city is the aggregate of five counties. 
