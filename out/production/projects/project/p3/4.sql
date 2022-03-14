-- Create an index that will help retrieve a mother’s address,
-- assuming that we only have a phone number to start the search with.

CREATE INDEX address
ON mothers(mtel, maddress);

CREATE UNIQUE INDEX address
    ON mothers(mramq) INCLUDE(maddress);