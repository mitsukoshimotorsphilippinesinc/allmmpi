-- add price column

ALTER TABLE `is_payment_transaction_products` ADD `price` DECIMAL( 11, 2 ) NOT NULL DEFAULT '0.00' AFTER `group`;