-- INSIGHT 1: Top 5 Most Delayed Ports
SELECT * FROM portpulse_db.delays;
SELECT 
    s.destination_port,
    ROUND(AVG(d.delay_duration_days), 2) AS avg_delay_days,
    COUNT(*) AS total_delayed_shipments
FROM 
    shipments s
JOIN 
    delays d ON s.shipment_id = d.shipment_id
GROUP BY 
    s.destination_port
ORDER BY 
    avg_delay_days DESC
LIMIT 5;

-- Insight 2: Top Delay Reasons Across All Shipments
SELECT 
    delay_reason,
    COUNT(*) AS occurrences
FROM 
    delays
GROUP BY 
    delay_reason
ORDER BY 
    occurrences DESC;
    


