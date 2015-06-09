CREATE TABLE `rf_payment_transaction_modes` (
  `payment_mode_id` int(11) DEFAULT NULL,
  `payment_mode_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_payment_transaction_modes` (`payment_mode_id`, `payment_mode_name`)
VALUES
	(1, 'Regular'),
	(2, 'GC'),
	(3, 'C Points');

ALTER TABLE is_payment_transactions ADD payment_mode tinyint(1) DEFAULT 0 AFTER transaction_type;

-- update is_payment_transactions_copy set payment_mode = 1 where transaction_id IN (select DISTINCT(transaction_id) from is_payment_transaction_details where transaction_id IN (select transaction_id from is_payment_transactions where payment_mode = 0) and payment_method IN ('cash', 'card', 'cheque', 'funds') group by transaction_id);
-- update is_payment_transactions_copy set payment_mode = 2 where transaction_id IN (select DISTINCT(transaction_id) from is_payment_transaction_details where transaction_id IN (select transaction_id from is_payment_transactions where payment_mode = 0) and payment_method IN ('giftcheque', 'onlinegiftcheque', 'gcep') group by transaction_id);
-- update is_payment_transactions_copy set payment_mode = 3 where transaction_id IN (select DISTINCT(transaction_id) from is_payment_transaction_details where transaction_id IN (select transaction_id from is_payment_transactions where payment_mode = 0) and payment_method IN ('cpoints') group by transaction_id);