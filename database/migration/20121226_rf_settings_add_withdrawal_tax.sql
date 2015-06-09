INSERT INTO  `rf_settings` (
`slug` ,
`value` ,
`default` ,
`system_code` ,
`is_locked` ,
`insert_timestamp`
)
VALUES (
'withdrawal_tax',  '0.10',  '',  'system',  '0', 
CURRENT_TIMESTAMP
);

INSERT INTO  `rf_settings` (
`slug` ,
`value` ,
`default` ,
`system_code` ,
`is_locked` ,
`insert_timestamp`
)
VALUES (
'withdrawal_limit',  '{"minimum":1000,"maximum":"100000"}',  '',  'system',  '0', 
CURRENT_TIMESTAMP
);