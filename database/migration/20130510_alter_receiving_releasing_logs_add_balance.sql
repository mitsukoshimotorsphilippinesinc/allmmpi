ALTER TABLE tr_facility_items_releasing ADD balance decimal(11, 3) DEFAULT 0.00 AFTER qty;

ALTER TABLE tr_facility_items_receiving ADD balance decimal(11, 3) DEFAULT 0.00 AFTER qty;