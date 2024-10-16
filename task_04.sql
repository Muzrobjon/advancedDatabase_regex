-- Task 4: Create a trigger function to validate ProductName before insertion  
CREATE OR REPLACE FUNCTION validate_product_name()    
RETURNS TRIGGER AS $$    
BEGIN    
    -- Check if the new ProductName starts with an uppercase letter and is at least 5 characters long  
    IF NEW.ProductName !~ '^[A-Z].{4,}$' THEN    
        RAISE EXCEPTION 'Product name must start with an uppercase letter and be at least five characters long.';  -- Raise an exception if validation fails  
    END IF;    
    RETURN NEW;  -- Return the new row if validation passes  
END;    
$$ LANGUAGE plpgsql;    
  
-- Drop the existing trigger if it exists to avoid conflicts  
DROP TRIGGER IF EXISTS product_name_validation ON northwind.products;    
  
-- Create the trigger for the Products table to validate ProductName before insertion  
CREATE TRIGGER product_name_validation    
BEFORE INSERT ON northwind.products    
FOR EACH ROW    
EXECUTE FUNCTION validate_product_name();    


 BEGIN 
-- Insert a new product with a specific ProductID and name  
INSERT INTO northwind.products (ProductID, ProductName) VALUES (21, 'Mango');    
-- Display all products to verify the insertion  
SELECT * FROM northwind.products;    
  
-- This should fail due to validation rules in the trigger  
INSERT INTO northwind.products (ProductID, ProductName) VALUES (22, 'banana');    
  
-- This should also fail due to validation rules in the trigger  
INSERT INTO northwind.products (ProductID, ProductName) VALUES (23, 'd');    
--******  