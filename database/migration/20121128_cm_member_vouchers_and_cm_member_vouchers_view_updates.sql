-- cm_member_vouchers / cm_member_vouchers_view updates
ALTER TABLE `cm_member_vouchers` DROP `member_code`;
ALTER TABLE `cm_member_vouchers` CHANGE  `product_id`  `cart_id` INT( 11 ) UNSIGNED NULL DEFAULT  '0';

DROP VIEW cm_member_vouchers_view;
CREATE VIEW cm_member_vouchers_view AS 
SELECT `cm_member_vouchers`.`voucher_id` AS `voucher_id`,
`cm_member_vouchers`.`voucher_type_id` AS `voucher_type_id`,
`cm_member_vouchers`.`voucher_code` AS `voucher_code`,
`cm_member_vouchers`.`confirmation_code` AS `confirmation_code`,
`cm_member_vouchers`.`redemption_code` AS `redemption_code`,
`cm_member_vouchers`.`member_id` AS `member_id`,
`cm_member_vouchers`.`voucher_product_id` AS `voucher_product_id`,
`cm_member_vouchers`.`cart_id` AS `cart_id`,
`cm_member_vouchers`.`product_text` AS `product_text`,
`cm_member_vouchers`.`last_name` AS `last_name`,
`cm_member_vouchers`.`first_name` AS `first_name`,
`cm_member_vouchers`.`middle_name` AS `middle_name`,
`cm_member_vouchers`.`email` AS `email`,
`cm_member_vouchers`.`mobile_number` AS `mobile_number`,
`cm_members`.`home_address` AS `home_address`,
`cm_members`.`birthdate` AS `birthdate`,
`cm_members`.`sex` AS `sex`,
`cm_members`.`nationality` AS `nationality`,
`cm_members`.`marital_status` AS `marital_status`,
`cm_members`.`tin` AS `tin`,
`cm_members`.`beneficiary1` AS `beneficiary1`,
`cm_members`.`beneficiary2` AS `beneficiary2`,
`cm_member_vouchers`.`user_id` AS `user_id`,
`cm_member_vouchers`.`status` AS `status`,
`cm_member_vouchers`.`remarks` AS `remarks`,
`cm_member_vouchers`.`start_timestamp` AS `start_timestamp`,
`cm_member_vouchers`.`end_timestamp` AS `end_timestamp`,
`cm_member_vouchers`.`update_timestamp` AS `update_timestamp`,
`cm_member_vouchers`.`insert_timestamp` AS `insert_timestamp` 
FROM (`cm_member_vouchers` left join `cm_members` on((`cm_members`.`member_id` = `cm_member_vouchers`.`member_id`)));