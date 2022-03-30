-- for each WHO region, output the region, number of countries and the total number of vaccinated people in those countries
-- Order the output by the region

-- select who_region, count(country), count(persons_fully_vaccinated)
-- from vdatacsv
-- group by who_region
-- order by who_region

-- load data and define schema
vdatacsv = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);

-- projection on (country, who_region, persons_fully_vaccinated)
proj = FOREACH vdatacsv GENERATE country, who_region, persons_fully_vaccinated;

-- group by who_region
grpd = GROUP proj BY who_region;

-- count countries & vaccinated people
smmd = FOREACH grpd GENERATE group, COUNT(proj.country), SUM(proj.persons_fully_vaccinated); 

-- order by who_region
srtd = ORDER smmd BY group;

-- display result
DUMP srtd;