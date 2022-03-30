-- list the companies whose vaccines are used across most number of countries
-- Output the company name and the number of countries they supply to
-- Order the output with the companies that supply most countries on top
-- Restrict the output only to top 10 records. 

-- (Moderna ,65)
-- ( Janssen Pharmaceuticals ,32)

-- select company_name, count(distinct country) as countryCnt
-- from vaccination-metadata
-- group by company_name
-- order by countryCnt
-- limit 10

-- load data and define schema
vmetacsv = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);

-- projection on (company_name, iso3)
proj = FOREACH vmetacsv GENERATE company_name, iso3;

-- remove duplicates of one compnay suppying to the same country
dist = DISTINCT proj;

-- group by company_name
grpd = GROUP dist BY company_name;

-- count distinct countires
smmd = FOREACH grpd GENERATE group, COUNT(dist.iso3);

-- order by countryCnt
srtd = ORDER smmd BY $1;

-- limit 10
top10 = LIMIT srtd 10;

-- display result
DUMP top10;