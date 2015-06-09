-- add new job type for pre payout report

INSERT INTO `rf_job_types` (`job_code`, `scripts`, `insert_timestamp`)
VALUES
	('pre_payout', 'jobs/pre_payout_report/group_status', CURRENT_TIMESTAMP);
