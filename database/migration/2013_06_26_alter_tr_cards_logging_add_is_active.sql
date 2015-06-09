ALTER TABLE tr_cards_logging ADD is_active tinyint(1) DEFAULT 1 AFTER user_id;

ALTER TABLE tr_cards_logging DROP PRIMARY KEY;