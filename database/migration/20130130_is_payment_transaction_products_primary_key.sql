-- set group as primary key to avoid clashing of products in packages

ALTER TABLE `is_payment_transaction_products` DROP PRIMARY KEY ,
ADD PRIMARY KEY ( `transaction_id` , `package_product_id` , `product_id` , `is_product_rebate`, `group` ) ;