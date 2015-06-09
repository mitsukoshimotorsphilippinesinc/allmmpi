ALTER TABLE  `cm_member_accounts` 
ADD  `funds` DECIMAL( 10, 2 ) NOT NULL DEFAULT  '0.00' AFTER  `node_type` ,
ADD  `gift_cheques` DECIMAL( 10, 2 ) NOT NULL DEFAULT  '0.00' AFTER  `funds`