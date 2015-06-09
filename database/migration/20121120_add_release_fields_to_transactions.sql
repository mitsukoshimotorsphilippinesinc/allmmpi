ALTER TABLE  `is_payment_transaction_products` ADD  `is_released` TINYINT( 1 ) NOT NULL DEFAULT  '0',
ADD  `released_timestamp` DATETIME NOT NULL DEFAULT  '0000-00-00 00:00:00';
