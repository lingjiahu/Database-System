#!/bin/bash

# runs all queries

db2 -t -v < 5a.sql
db2 -t -v < 5b.sql
db2 -t -v < 5c.sql
db2 -t -v < 5d.sql
db2 -t -v < 5e.sql

db2 -t -v < 6a.sql
db2 -t -v < 6c.sql
db2 -t -v < 6d.sql
db2 -t -v < 6e.sql

db2 -t -v < 7.sql
