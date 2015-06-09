ALTER TABLE cm_member_user_accounts ADD session_token varchar(100) DEFAULT NULL AFTER login_hash;
ALTER TABLE cm_member_user_accounts ADD session_token_validity timestamp DEFAULT '0000-00-00 00:00:00' AFTER session_token;
ALTER TABLE cm_member_user_accounts ADD KEY ( `session_token` ) ;