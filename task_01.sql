--Exercise 1: Identify Email Addresses in Contacts

-- This query selects all suppliers from the "northwind.suppliers" table
-- whose homepage contains characters that are not alphanumeric,
-- periods, colons, or slashes (nonstandard Latin symbols).
SELECT *
FROM northwind.suppliers
WHERE homepage ~* '[^a-zA-Z0-9.:/]';
