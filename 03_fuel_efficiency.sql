SELECT * FROM portpulse_db.fuel_usage;
-- Insight 3 – Fuel Efficiency
SELECT 
    s.vessel_id,
    ROUND(SUM(f.fuel_consumed_liters) / SUM(f.nautical_miles_travelled), 4) AS fuel_per_mile,
    COUNT(*) AS total_shipments
FROM 
    shipments s
JOIN 
    fuel_usage f ON s.shipment_id = f.shipment_id
GROUP BY 
    s.vessel_id
HAVING 
    SUM(f.nautical_miles_travelled) > 0
ORDER BY 
    fuel_per_mile ASC
LIMIT 5;
