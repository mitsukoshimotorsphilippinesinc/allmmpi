INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES ('0', '1', 'A Private Message For You via Vital-C.Net', 'send_private_message', '<div><label><b>From:</b>&nbsp;{@=sender_name}</label><br/>
					  <label><b>Contact Number:</b>&nbsp;{@=mobile_number_from}</label><br/>
					  <label><b>Email Address:</b>&nbsp;{@=email_from}</label>
					  <br/><br/>
					  <div>{@=message}</div>
				    </div>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
