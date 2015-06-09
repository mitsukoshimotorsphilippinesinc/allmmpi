ALTER TABLE  tr_member_acct_credit_logs DROP COLUMN member_account_id;
ALTER TABLE  tr_member_acct_debit_logs DROP COLUMN member_account_id;
ALTER TABLE  tr_member_acct_credit_points_logs DROP COLUMN member_account_id;
ALTER TABLE  tr_member_acct_debit_points_logs DROP COLUMN member_account_id;

ALTER TABLE tr_member_acct_credit_logs ADD COLUMN from_account_id VARCHAR(64) DEFAULT NULL AFTER card_id;
ALTER TABLE tr_member_acct_credit_points_logs ADD COLUMN from_account_id VARCHAR(64) DEFAULT NULL AFTER card_id;
