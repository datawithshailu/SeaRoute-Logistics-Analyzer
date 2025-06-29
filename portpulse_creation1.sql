CREATE DATABASE portpulse_db;
USE portpulse_db;

CREATE TABLE shipments (
    shipment_id VARCHAR(10) PRIMARY KEY,
    vessel_id VARCHAR(10),
    source_port VARCHAR(10),
    destination_port VARCHAR(10),s
    departure_date DATE,
    eta DATE,
    actual_arrival DATE
);
CREATE TABLE fuel_usage (
    shipment_id VARCHAR(10),
    fuel_consumed_liters FLOAT,
    nautical_miles_travelled INT,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id)
);
CREATE TABLE delays (
    shipment_id VARCHAR(10),
    delay_reason VARCHAR(50),
    delay_duration_days INT,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id)
);
CREATE TABLE containers (
    shipment_id VARCHAR(10),
    used_containers INT,
    max_capacity INT,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id)
);


    













