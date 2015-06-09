-- set is_product_rebate as primary key to avoid clashing of product rebate and non-product rebate items

ALTER TABLE `is_payment_transaction_products` DROP PRIMARY KEY ,
ADD PRIMARY KEY ( `transaction_id` , `package_product_id` , `product_id` , `is_product_rebate` ) ;