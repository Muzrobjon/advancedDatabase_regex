--Exercise 2: Format Phone Numbers in a Standard Format
CREATE OR REPLACE FUNCTION format_phone_number(phone TEXT)
RETURNS TEXT AS $$
DECLARE
    clean_phone TEXT;
BEGIN
    -- Extract only numeric digits from the phone input
    clean_phone := REGEXP_REPLACE(phone, '[^0-9]', '', 'g');

    -- Format the number based on its length
    IF LENGTH(clean_phone) < 10 THEN
        clean_phone :=  RPAD(clean_phone, 10, '0');
    ELSIF LENGTH(clean_phone) < 10 THEN
        clean_phone := RIGHT(clean_phone, 10);
    END IF;
     clean_phone := REGEXP_REPLACE(clean_phone, '(\d{3})(\d{3})(\d{4})', '(\1) \2-\3'); 
  
     return clean_phone;
END;
$$ LANGUAGE plpgsql;
-- to check
SELECT 
    phone AS original_phone,
    format_phone_number(phone) AS formatted_phone
FROM 
    northwind.customers;