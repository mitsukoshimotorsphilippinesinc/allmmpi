ALTER TABLE rt_facility_items ADD item_date date DEFAULT 0 AFTER unit_id;

ALTER TABLE rt_facility_items ADD item_name varchar(64) DEFAULT "" AFTER item_id;