SELECT * FROM portpulse_db.containers;
-- Insight 5: Container Utilization Efficiency
SELECT 
    shipment_id,
    used_containers,
    max_capacity,
    ROUND((used_containers / max_capacity) * 100, 2) AS utilization_percent
FROM 
    containers
WHERE 
    max_capacity IS NOT NULL AND max_capacity != 0
ORDER BY 
    utilization_percent ASC
LIMIT 10;


