<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<<<<<<< HEAD
	<title>Mitsukoshi Motors Philippines Inc</title>
=======
	<title>MMPI</title>
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
	<meta name="description" content="">
	<meta name="author" content="">

	<link rel="shortcut icon" href="<?= image_url('/favicon.ico'); ?>" />
	<?php echo css('bootstrap.css');?>
	<?php echo css('main.css');?>
	<?php echo css('mmpi.css');?>
	<?php echo css('slider.css');?>
	<?php echo css('webpoi.css');?>
	<?php echo css('jquery-ui/jquery-ui-1.9.1.css');?>

	<?php echo js('libs/jquery-1.8.3.min.js'); ?>
	<?php echo js('libs/jquery-ui-1.9.1.min.js'); ?>
	<?php echo js('libs/dropdown.js'); ?>
	<?php echo js('libs/modernizr-2.5.3-respond-1.1.0.min.js'); ?>
	<?php echo js('libs/jquery-ui-timepicker-addon.js'); ?>
	<?php echo js('libs/underscore-min.js'); ?>
	<?php echo js('libs/bootstrap.min.js'); ?>
	<?php echo js('libs/tweet/jquery.tweet.js'); ?>
	<?php echo js('libs/uploadrr.js'); ?>
	<?php echo js('apps/core.js'); ?>
	<?php echo js('apps/site.js'); ?>
	<?php if($this->member->member_id>0) : ?>
		<script type="text/javascript" >
			vitalc.member.member_id = <?=$this->member->member_id;?>;
			vitalc.member.first_name = "<?=$this->member->first_name;?>";
			vitalc.member.last_name = "<?=$this->member->last_name;?>";
			vitalc.member.funds = <?=$this->member->funds;?>;
			vitalc.member.gift_cheques = <?=$this->member->gift_cheques;?>;
			vitalc.member.gcep = <?=$this->member->gcep;?>;
			vitalc.member.on_hold_funds = <?=$this->member->on_hold_funds;?>;
			vitalc.member.is_paycard_corpo = <?=$this->member->is_paycard_corpo;?>;
			<?php
				if (!isset($this->session->userdata('selected_account')->account_id))
				{
					$accounts = $this->members_model->get_member_accounts("member_id = {$this->member->member_id}",array("rows"=>1,"offset"=>0),"insert_timestamp ASC");
					$selected_account_id = $accounts[0]->account_id;
				}
				else
				{
					$selected_account_id = $this->session->userdata('selected_account')->account_id;		
				}
			?>
			vitalc.member.selected_account_id = '<?=$selected_account_id?>';
		</script>
	<?php endif; ?>
	
</head>

<body>

	<div id="loading_overlay">
	    <div class="loading_message well clearfix">
		<img src='/assets/img/loading.gif' class='pull-left' style='height: 55px;' alt='' />
		<p>Please wait while processing...</p>
		</div>
	</div>	
	
	
	<header>
		<div style="clearfix">
<<<<<<< HEAD
			<h1 class="pull-left" style="margin-top:-10px;">
				<a href="/">MMPI</a>
				<!--a href="/">MMPI</a-->
=======
			<h1 class="pull-left">
				<a href="/">lemon</a>
				<a href="/">VitalC</a>
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
			</h1>
			<?= $this->load->view('snippets/menu', NULL, TRUE,'main');  ?>
			<?= $this->load->view('snippets/navigation', NULL, TRUE,'main');  ?>
		</div>
	</header>
	<div id='content'>
<<<<<<< HEAD
		<div class='content-area'>			
=======
		<div class='content-area'>
			<?= $this->load->view('snippets/alerts', NULL, TRUE,'main');  ?>			
			<div class='row promo-links'>
				<div class='span4'>
					<div class='well well-small' style='text-align:center;'>
						<h5 style='margin-top:0; font-size:13px; text-align:left;'>Wellness Consultant Program Mechanics</h5>
						<a href='/assets/media/pdf/Wellness Consultant Program Mechanics.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Wellness Consultant Program Mechanics"><i class='icon-book icon-white'></i> PDF</a>
					</div>
				</div>
				<div class='span4'>
					<div class='well well-small' style='text-align:center;'>
						<h5 style='margin-top:0; text-align:left;'>RHM-PHC / MDC</h5>
						<a href='/assets/media/pdf/RHM Letter of Intent.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Letter of Intent"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/RHM Application Form.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Application Form"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/RHM Guidelines.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Guidelines"><i class='icon-book icon-white'></i> PDF</a>
					</div>
				</div>
				<div class='span4' style='margin-left:30px;'>
					<div class='well well-small' style='text-align:center;'>
						<h5 style='margin-top:0; text-align:left;'>Power 8888 Promo Video</h5>
						<a href='http://www.youtube.com/watch?v=p8Vb3gkkGc4' target='_blank' class='btn btn-primary' rel="tooltip" title="Watch the Power 8888 Promotional Video"><i class='icon-play icon-white'></i> Play Video</a>
					</div>
				</div>
				<div class='span2'>
				</div>
				<div class='span4'>
					<div class='well well-small' style='text-align:center;'>
						<h5 style='margin-top:0; text-align:left;'>Natto Shield Product Presentation</h5>
						<a href='/assets/media/pdf/NattoShield Product Presentation.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Natto Shield Product Presentation"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/NattoShield Terminology.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Natto Shield Terminology"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/NattoShield FAQ.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Natto Shield FAQ"><i class='icon-book icon-white'></i> PDF</a>
					</div>
				</div>
				<div class='span4'>
					<div class='well well-small' style='text-align:center;'>
						<h5 style='margin-top:0; text-align:left;'>Vital Gold Product Presentation</h5>
						<a href='/assets/media/pdf/Vital Gold Product Presentation.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Vital Gold Product Presentation"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/Vital Gold Terminology.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Vital Gold Terminology"><i class='icon-book icon-white'></i> PDF</a>
						<a href='/assets/media/pdf/Vital Gold FAQ.pdf' target='_blank' class='btn btn-small btn-info' rel="tooltip" title="Vital Gold FAQ"><i class='icon-book icon-white'></i> PDF</a>
					</div>
				</div>
			</div>
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
			<script type='text/javascript'>
				$(function() {
					$('.promo-links a').tooltip({'placement' : 'bottom'});
				});
			</script>
		</div>
<<<<<<< HEAD

		<?php

			$fullname = $this->employee->first_name . " " . $this->employee->last_name;
			$image_filename = "male.jpg";
			if (empty($this->employee->image_filename) || ($this->employee->image_filename == NULL) || (trim($this->employee->image_filename) == "")) {
				// check gender of member
				if (trim($this->employee->gender) == "FEMALE") {
					$image_filename = "ni_female.png";
				} else {
					$image_filename = "ni_male.png";
				}
			} else {
				$image_filename = $this->employee->image_filename;
			}
		?>
		
			<div class='content-area member-area clearfix'>
				
				<div class="alert alert-danger"><strong>ADVISORY:</strong><br/>This is message 2</div>
				
				<ul id='user-nav-box' class="nav nav-pills">
					
					<li class='<?= isset($this->uri->uri_string) ? ($this->uri->uri_string == 'employee' ? 'active' : '') : '';  ?>'><a href="/employee" >Dashboard</a></li>
					<li class='<?= isset($this->uri->uri_string) ? ($this->uri->uri_string == 'profile' ? 'active' : '') : '';  ?> dropdown'>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Profile <i class="icon-play-down" style="padding-right: 3px;"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li role="menuitem"><a href="/members/profile">My Profile</a></li>							
						</ul>
					<li class='<?= isset($this->uri->uri_string) ? ($this->uri->uri_string == 'employee/announcement' ? 'active' : '') : '';  ?>'><a href="/employee/announcement" >Announcements</a></li>	
					</li>
					
					<?php					
					
					//var_dump($this->uri->uri_string);

					$class_value = "";
					//if ($this->member->is_active == 1) {
=======
		<?php

			$fullname = $this->member->first_name . " " . $this->member->last_name;
			$image_filename = "male.jpg";
			if (empty($this->member->image_filename) || ($this->member->image_filename == NULL) || (trim($this->member->image_filename) == "")) {
				// check gender of member
				if (trim($this->member->sex) == "F") {
					$image_filename = "female.jpg";
				} else {
					$image_filename = "male.jpg";
				}
			} else {
				$image_filename = $this->member->image_filename;
			}

			// 20131111 
			// get member title/achievement
			$member_achievement_name = "";
			$html_achievement = "";
			$featured_member_details = $this->contents_model->get_featured_member_by_member_id($this->member->member_id);
			
			if (!empty($featured_member_details)) {
				// get title from rf_member_achievements
				$member_achievement_details = $this->contents_model->get_member_achievement_by_id($featured_member_details[0]->achievement_id);
				
				if (!empty($member_achievement_details)) {
					$member_achievement_name = strtoupper($member_achievement_details->achievement_name);
					
					$html_achievement .= "<label style='position:relative;left:5px;top:-5px;' class='label label-success'>{$member_achievement_name}</label>";
				}
			}
			
		?>
		
			<div class='content-area member-area clearfix'>
				<div id='user-box' class="well well-small user-box" style="height: 95px;">
					<table class="table" style="border: none;">
						<tbody>
							<tr>
								<td rowspan="2" style="width: 80px;"><img src='<?= image_url('/assets/media/members/'.$image_filename);?>' style="max-width: 80px;" /></td>
								<td rowspan="2" style="width: 45%;">
									<?php
										$font_color = "color:#000000";

										if ($this->member->funds_variance < 0) {
											$font_color = "color:#558033";
										}
									?>
									<h5 style='<?= $font_color; ?>'>
										<div style="margin-left: -5px;"><?= $html_achievement ?></div>
										<div><?= $fullname ?></div>
									</h5>
								</td>
								<td><div class='fund-box' style='font-size:12px; margin-top: 5px;'><label>Funds:</label><?= number_format($this->member->funds, 2); ?></div></td>
								<td>
									<?php if($this->settings->switch_to_cpoints) : ?>
									<div class='fund-box' style='font-size:12px; margin-top: 5px;'><label>C Points:</label><?= number_format($this->member->cpoints, 2); ?></div>
									<?php endif; ?>
								</td>
								<td><div class='fund-box' style='margin-top: 5px;'><a href="/cart" ><i class="icon-shopping-cart"></i> Cart</a></div></td>
							</tr>
							<tr>
								<td><div class='fund-box' style='font-size:12px; margin-top: 5px;'><label>GC:</label><?= number_format($this->member->gift_cheques, 2); ?></div></td>
								<td><div class='fund-box' style='font-size:12px; margin-top: 5px;'><label>GCEP:</label><?= number_format($this->member->gcep, 2); ?></div></td>
								<td>
									<div class='fund-box dropdown' style='margin-top: 5px;'>
										<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-wrench"></i> Tools <i class="icon-play-down"></i></a>
										<ul class="dropdown-menu" role="menu">
											<?php if($this->settings->switch_to_cpoints) : ?>
											<li role="menuitem"><a href="javascript:vitalc.cpoints.converter()">C-Points Converter</a></li>
											<?php endif; ?>
											<li role="menuitem"><a href="/members/fundstopaycard">Funds to Paycard</a></li>
											<li role="menuitem"><a href="/members/mytransfers">Funds Transfer</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<ul id='user-nav-box' class="nav nav-pills">
					
					<li class='<?= isset($current_page) ? ($current_page == 'dashboard' ? 'active' : '') : '';  ?>'><a href="/members" >Dashboard</a></li>
					<li class='<?= isset($current_page) ? ($current_page == 'profile' ? 'active' : '') : '';  ?> dropdown'>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Profile <i class="icon-play-down" style="padding-right: 3px;"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li role="menuitem"><a href="/members/profile">My Profile</a></li>
							<li role="menuitem"><a href="/members/orders" >Orders</a></li>
							<li role="menuitem"><a href="/members/myvouchers" >Vouchers</a></li>
							<li role="menuitem"><a href="/members/entries" >Entries</a></li>
							<li role="menuitem"><a href="/members/p2p" >(P-P)<sup>3</sup></a></li>
						</ul>
					</li>
					
					<?php					
					$class_value = "";
					if ($this->member->is_active == 1) {
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
						
						// if (isset($current_page) == "accounts") {
						// 	$class_value = isset($current_page) ? ($current_page == 'accounts' ? 'active' : '') : '';
						// }
						
						// echo "<li class='{ $class_value }'><a href='/members/accounts' >Accounts</a></li>";
												
						// if (isset($current_page) == "earnings") {
						// 	$class_value = isset($current_page) ? ($current_page == 'earnings' ? 'active' : '') : '';
						// }
						
						// echo "<li class='{ $class_value }'><a href='/members/earnings' >Encashments</a></li>";
<<<<<<< HEAD
						//$cls = isset($current_page) ? ($current_page == 'accounts' ? 'active' : '') : '';
						//echo "
						//<li class='{$cls} dropdown'>
						//	<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Accounts <i class='icon-play-down' style='padding-right: 3px;'></i></a>
						//	<ul class='dropdown-menu' role='menu'>
						//		<li role='menuitem'><a href='/members/accounts' >My Accounts</a></li>
						//		<li role='menuitem'><a href='/members/earnings' >Encashments</a></li>
						//	</ul>
						//</li>
						//";
					//}
=======
						$cls = isset($current_page) ? ($current_page == 'accounts' ? 'active' : '') : '';
						echo "
						<li class='{$cls} dropdown'>
							<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Accounts <i class='icon-play-down' style='padding-right: 3px;'></i></a>
							<ul class='dropdown-menu' role='menu'>
								<li role='menuitem'><a href='/members/accounts' >My Accounts</a></li>
								<li role='menuitem'><a href='/members/earnings' >Encashments</a></li>
							</ul>
						</li>
						";
					}
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
					?>	
					
					<!--<li class='<?= isset($current_page) ? ($current_page == 'orders' ? 'active' : '') : '';  ?>'><a href="/members/orders" >Orders</a></li>-->
					
					
<<<<<<< HEAD
					<!--?php
					//if ($this->member->is_active == 1) {
					//
					//	// if (isset($current_page) == "encoding") {
					//	// 	$class_value = isset($current_page) ? ($current_page == 'encoding' ? 'active' : '') : '';
					//	// }
					//
					//	// echo "<li class='{ $class_value }'><a href='/members/encoding' >Encode Sales</a></li>";
					//	$cls = isset($current_page) ? ($current_page == 'encoding' ? 'active' : '') : '';
					//	echo "
					//	<li class='{$cls} dropdown'>
					//		<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Encode Sales <i class='icon-play-down' style='padding-right: 3px;'></i></a>
					//		<ul class='dropdown-menu' role='menu'>
					//			<li role='menuitem'><a href='/members/encoding' >Encode Repeat Sales</a></li>
					//			<li role='menuitem'><a href='/members/rslist' >View Repeat Sales</a></li>
					//		</ul>
					//	</li>
					//	";
					//} ?-->	
=======
					<?php
					if ($this->member->is_active == 1) {
					
						// if (isset($current_page) == "encoding") {
						// 	$class_value = isset($current_page) ? ($current_page == 'encoding' ? 'active' : '') : '';
						// }
					
						// echo "<li class='{ $class_value }'><a href='/members/encoding' >Encode Sales</a></li>";
						$cls = isset($current_page) ? ($current_page == 'encoding' ? 'active' : '') : '';
						echo "
						<li class='{$cls} dropdown'>
							<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Encode Sales <i class='icon-play-down' style='padding-right: 3px;'></i></a>
							<ul class='dropdown-menu' role='menu'>
								<li role='menuitem'><a href='/members/encoding' >Encode Repeat Sales</a></li>
								<li role='menuitem'><a href='/members/rslist' >View Repeat Sales</a></li>
							</ul>
						</li>
						";
					} ?>	
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
					<!--<li class='<?= isset($current_page) ? ($current_page == 'myvouchers' ? 'active' : '') : '';  ?>'><a href="/members/myvouchers" >Vouchers</a></li>-->
					<!--<li class='<?= isset($current_page) ? ($current_page == 'rslist' ? 'active' : '') : '';  ?>'><a href="/members/rslist" >View RS</a></li>-->
					<!--<li class='<?= isset($current_page) ? ($current_page == 'entries' ? 'active' : '') : '';  ?>'><a href="/members/entries" >Entries</a></li>-->
					<!---<li class='<?= isset($current_page) ? ($current_page == 'mytransfers' ? 'active' : '') : '';  ?>'><a href="/members/mytransfers" >Transfers</a></li>-->
					<!--<li class='<?= isset($current_page) ? ($current_page == 'p2p' ? 'active' : '') : '';  ?>'><a href="/members/p2p" >P2P</a></li>-->
					<!--<li class='<?= isset($current_page) ? ($current_page == 'fundstopaycard' ? 'active' : '') : '';  ?>'><a href="/members/fundstopaycard" >F2P</a></li>-->

				</ul>
				<hr class='user-nav-divider'/>
				<div class="clearfix">
					<?= $content ?>
<<<<<<< HEAD
				</div>				
			</div>
			<!--?php echo Modules::run('raffle/raffle_box'); ?-->
=======
				</div>
				<hr/>
			</div>
			<?php echo Modules::run('raffle/raffle_box'); ?>
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
	</div>
	<footer>
		<div class="grid12">
			<div class="row">	
<<<<<<< HEAD
				<p class="span5">@2015 Mitsukoshi Motors Philippines Inc. All Rights Reserved.</p>
				<ul class="span7">
					<li><a href="#">Home</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms and Conditions</a></li>
					<li><a href="#">Careers</a></li>
                </ul>
			</div>
			<div class="row-fluid">	
				<p>Powered by<a href="http://www.mitsukoshimotors.com"> MMPI IT Department</a></p>
=======
				<p class="span4">@2015 Mitsukoshi Motors Philippines, Inc. All Rights Reserved.</p>
				<ul class="span8">
					<li><a href="/">Home</a></li>
					<li><a href="/pages/privacy-policy">Privacy Policy</a></li>
					<li><a href="/pages/terms-and-conditions">Terms and Conditions</a></li>
					<li><a href="/pages/careers-at-mmpi">Careers</a></li>
                </ul>
			</div>
			<div class="row-fluid">	
				<p class='span12'>Powered by<a href="http://www.mitsukoshimotors.com"> MMPI elITes</a></p>
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
			</div>
		</div>
	</footer>
	
</body>

</html>

