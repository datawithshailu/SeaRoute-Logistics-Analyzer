SELECT * FROM portpulse_db.shipments;
-- Insight 4 – Monthly Shipping Volume by Port
SELECT 
    MONTH(departure_date) AS month,
    destination_port,
    COUNT(*) AS total_shipments
FROM 
    shipments
GROUP BY 
    MONTH(departure_date), destination_port
ORDER BY 
    month, total_shipments DESC;
    
 -- Insight 6 – % of On-Time Shipments
 SELECT 
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN actual_arrival <= eta THEN 1 ELSE 0 END) AS on_time_shipments,
    ROUND(SUM(CASE WHEN actual_arrival <= eta THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS on_time_percentage
FROM 
    shipments;
    
-- Insight 7 – Most Active Shipping Routes
SELECT 
    source_port,
    destination_port,
    COUNT(*) AS total_shipments
FROM 
    shipments
GROUP BY 
    source_port, destination_port
ORDER BY 
    total_shipments DESC
LIMIT 10;



