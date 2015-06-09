ALTER TABLE rf_is_transaction_codes ADD is_visible tinyint(1) DEFAULT 1;

UPDATE rf_is_transaction_codes SET transaction_description = "Admin Update (+)" WHERE transaction_code = 100;
UPDATE rf_is_transaction_codes SET transaction_description = "Build Items (+)" WHERE transaction_code = 102;
UPDATE rf_is_transaction_codes SET transaction_description = "Break Items (+)" WHERE transaction_code = 103;
UPDATE rf_is_transaction_codes SET transaction_description = "Admin Update (-)" WHERE transaction_code = 200;
UPDATE rf_is_transaction_codes SET transaction_description = "Ordering System" WHERE transaction_code = 204;
UPDATE rf_is_transaction_codes SET transaction_description = "Build Items (-)" WHERE transaction_code = 205;
UPDATE rf_is_transaction_codes SET transaction_description = "Break Items (-)" WHERE transaction_code = 206;

UPDATE rf_is_transaction_codes SET is_visible = 0 WHERE transaction_code = 207;
UPDATE rf_is_transaction_codes SET is_visible = 0 WHERE transaction_code = 203;