-- add registration_type
ALTER TABLE  `cm_members` ADD  `registration_type` VARCHAR( 64 ) NOT NULL DEFAULT  'INDIVIDUAL' AFTER  `is_active`