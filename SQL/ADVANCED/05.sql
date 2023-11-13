
/* Calculate the export and import for each company.*/

SELECT
  company_id, 
  SUM(CASE WHEN transaction_type = 'Export' THEN amount ELSE 0 END) AS total_export, 
  SUM(CASE WHEN transaction_type = 'Import' THEN amount ELSE 0 END) AS total_import
FROM  
  transactions
GROUP BY
  company_id; 
