-- add column is_on_hold on cm_members

ALTER TABLE  `cm_members` ADD  `is_on_hold` TINYINT( 1 ) NOT NULL DEFAULT  '0' AFTER  `is_active`