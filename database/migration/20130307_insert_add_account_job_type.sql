-- Add Account Job Type
INSERT INTO  `rf_job_types` (
`job_type_id` ,
`job_code` ,
`scripts` ,
`insert_timestamp`
)
VALUES (
'5',  'add_account',  'jobs/register/add_account', 
CURRENT_TIMESTAMP
);