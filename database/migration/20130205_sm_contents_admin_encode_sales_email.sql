INSERT INTO `vitalc`.`sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '1', 'Encode Sales Via Admin', 'admin_encode_sales_email', '<p>Hi {@=first_name},</p>
<p>We have encoded a Repeat Sales Card under your account. Please see details below:</p>
<br/>
<p>Name : <b>{@=proper_name}</b></p>
<p>Control Code: <b>{@=control_code}</b></p>
<p>Position: <b>{@=position}</b></p>
<p>Encoded As: <b>{@=encoded_as}</b></p>
<p>Period: <b>{@=maintenance_period}</b></p>
<p>Date Encoded: <b>{@=current_timestamp}</b></p>
<br/><br/>
<p>If you have any queries, kindly email us using the Contact Us page at www.vital-c.com</p>
<br/>
<p>
{@=link}
</p>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email_template', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
