-- Add is_to_all to cm_member_deductions
ALTER TABLE  `cm_member_deductions` ADD  `is_to_all` TINYINT( 1 ) NOT NULL DEFAULT  '0' AFTER  `lapsed_balance`