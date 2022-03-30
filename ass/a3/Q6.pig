-- list each country, its population, the percentage of fully vaccinated people and the number of vaccine brands used in that country. 
-- For countries with population above 100 million
-- Order the output by the decreasing order of their population. 

-- (France ,64721 ,65.91931521456 ,5) 
-- (Italy ,59430 ,68.6257445734 ,5)

-- with brands(iso3, productCnt) AS
-- (
--     select iso3, count(product_name)
--     from vaccination-metadata
--     group by iso3
-- ),
-- vaccinated(iso3, country, vaccinatedCnt, population) AS
-- (
--     select iso3, country, persons_fully_vaccinated, population
--     from pop join vaccination-data on country
--     where population > 100000
-- )
-- select country, population, (vaccinatedCnt/(population*1000))
-- from brands join vaccinated on iso3
-- order by population desc 

-- load data and define schema
popcsv = LOAD '/data/pop.csv' USING PigStorage(',') AS (country:CHARARRAY, population:FLOAT);
vmetacsv = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);
vdatacsv = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:FLOAT);

-- brands
-- group by iso3
grpd = GROUP vmetacsv BY iso3;

-- schema after group
DESCRIBE grpd;

-- count number of products per country
smmd1 = FOREACH grpd GENERATE group, COUNT(vmetacsv.product_name) AS productCnt;

-- vaccinated
-- select countries with population > 100,000
fltrd = FILTER popcsv BY population > 100000;

-- join pop & vaccination-data on country
jnd1 = JOIN fltrd BY country, vdatacsv BY country;

-- projection on (iso3, country, persons_fully_vaccinated, population)
proj = FOREACH jnd1 GENERATE vdatacsv::iso3, fltrd::country, vdatacsv::persons_fully_vaccinated, fltrd::population;

-- join brands & vaccinated
jnd2 = JOIN smmd1 BY group, proj BY iso3;

-- calculate percentage of fully vaccinated people (vaccinatedCnt/(population*1000))
smmd2 = FOREACH jnd2 GENERATE proj::fltrd::country, (int)proj::fltrd::population, (proj::vdatacsv::persons_fully_vaccinated/(proj::fltrd::population*1000))*100 AS percentage;

-- order by population
srtd = ORDER smmd2 BY country;

-- display result
DUMP srtd;


