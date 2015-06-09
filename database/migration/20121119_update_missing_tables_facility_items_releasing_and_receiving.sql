DROP TABLE IF EXISTS `rt_facility_items`;
CREATE TABLE IF NOT EXISTS `rt_facility_items` (
  `facility_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `insert_date` date NOT NULL,
KEY (insert_date),
KEY(facility_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP VIEW IF EXISTS `rt_facility_items_view`;
CREATE VIEW rt_facility_items_view AS
SELECT
	r.facility_id,
	r.item_id,
	i.item_name,
	r.qty,
	r.unit_id,
	r.insert_date
FROM
	rt_facility_items r
LEFT JOIN
	is_items i ON r.item_id = i.item_id;

DROP TABLE IF EXISTS `rt_facility_items_receiving`;
CREATE TABLE rt_facility_items_receiving
(
	facility_id int(11) NOT NULL,
	item_id int(11),
	qty decimal(11,2),
	unit_id int,
	insert_date date,
	KEY (insert_date),
	KEY(facility_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `rt_facility_items_releasing`;
CREATE TABLE rt_facility_items_releasing
(
	facility_id int(11) NOT NULL,
	item_id int(11),
	qty decimal(11,2),
	unit_id int,
	insert_date date,
	KEY (insert_date),
	KEY(facility_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP VIEW IF EXISTS rt_facility_items_releasing_view;
CREATE VIEW rt_facility_items_releasing_view AS
SELECT
	r.facility_id,
	r.item_id,
	i.item_name,
	i.item_code,
	r.qty,
	r.unit_id,
	u.unit_name,
	r.insert_date
FROM
	rt_facility_items_releasing r, is_items i, is_units u
WHERE
	r.item_id = i.item_id
AND
	r.unit_id = u.unit_id;
	

DROP VIEW IF EXISTS rt_facility_items_receiving_view;
CREATE VIEW rt_facility_items_receiving_view AS
SELECT
	r.facility_id,
	r.item_id,
	i.item_name,
	i.item_code,
	r.qty,
	r.unit_id,
	u.unit_name,
	r.insert_date
FROM
	rt_facility_items_receiving r, is_items i, is_units u
WHERE
	r.item_id = i.item_id
AND
	r.unit_id = u.unit_id;