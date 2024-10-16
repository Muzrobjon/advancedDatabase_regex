--Exercise 3: Classify Customers Based on Postal Codes
CREATE OR REPLACE FUNCTION classify_customer_by_postal_code(postal_code VARCHAR)    
RETURNS VARCHAR AS $$    
BEGIN    
    -- Check if the postal code matches the Local format (5 digits)  
    IF postal_code ~ '^\d+$' THEN    
        RETURN 'Local';  -- Return 'Local' if the format is valid  
    -- Check if the postal code matches the National format (3 digits-3 digits)  
    ELSIF postal_code ~ '^\d+-\d+$' THEN    
        RETURN 'National';  -- Return 'National' if the format is valid  
    ELSE    
        RETURN 'International';  -- Return 'International' for any other format  
    END IF;    
END;    
$$ LANGUAGE plpgsql;    
  
-- Test the function on the Customers table to classify customers based on their postal codes  
SELECT CustomerID, classify_customer_by_postal_code(PostalCode) AS classification    
FROM northwind.customers    
LIMIT 10;  -- Limit the output to the first 10 results  