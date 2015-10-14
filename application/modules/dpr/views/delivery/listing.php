<<<<<<< HEAD
<?php
	$breadcrumb_container = assemble_breadcrumb();
?>

<?= $breadcrumb_container; ?>
<div class='alert alert-danger'><h2>Delivery</h2></div>
<br>

<div >
	<form id='search_details' method='get' action =''>

		<strong>Status:&nbsp;</strong>
		<select name="search_status" id="search_status" style="width:250px;margin-left:20px" value="<?= $search_status ?>">
			<option value="ALL">ALL</option>						
			<option value="APPROVED">RECEIVED</option>
			<option value="CANCELLED">REJECTED</option>
			<option value="RETURNED">RETURNED</option>
		</select>  
	
		<br/>

		<strong>Search By:&nbsp;</strong>
		<select name="search_option" id="search_option" style="width:250px;" value="<?= $search_by ?>">
			<option value="request_code">Code</option>
			<option value="name">Name</option>
		</select>                 

		<input title="Search" class="input-large search-query" style="margin-top:-10px;margin-left:5px;" type="text" id="search_string" name="search_string" value="" maxlength='25' autofocus="">	

		<button id="button_search" class='btn btn-primary' style="margin-top:-10px;margin-left:5px;"><span>Search</span></button>
		<button id='button_refresh' class='btn' style="margin-top:-10px;"><span>Refresh</span></button>
	
		<br/>
		<span id="search_error" class="label label-important" style="display:none">Search String must be at least three (3) characters.</span>	
	
		<?php
		if ($search_text == "") {
		?>	
			<div id="search_summary" style="display:none;">
		<?php
		} else {
		?>	
			<div id="search_summary">
		<?php
		};
		?>		
		
			<span class="label label-important">Search Results for:</span>
			<span class="label label-default"><?= $search_status ?></span>
			<span class="label label-default"><?= $search_by ?></span>
			<span class="label label-default"><?= $search_text ?></span>
		</div>		
	</form>
</div>

<table class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style='width:80px;'>Request Code</th>
			<th>Status</th>
			<th style=''>Branch</th>
			<th style=''>Last Serial Number</th>
			<th style=''>Form</th>
			<th style=''>Is Accountable</th>			
			<th style=''>Quantity</th>			
			<th style='width:70px;'>Date Created</th>
			<th style='width:118px;'>Action</th>
		</tr>
	</thead>
	<tbody>
	<?php if(empty($request_detail)):?>
		<tr><td colspan='9' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($request_detail as $rd): 
		
		$request_summary_detail = $this->dpr_model->get_request_summary_by_id($rd->request_summary_id);

		$branch_details = $this->human_relations_model->get_branch_by_id($rd->branch_id);

		if (empty($branch_details)) {
			$branch_name = "N/A"; 
		} else {
			$branch_name = $branch_details->branch_name;
		}
	?>
		<tr>									
			<td><?= $request_summary_detail->request_code; ?></td>
			
			<?php								

			$status_class = strtolower(trim($rd->status));			
			$status_class = str_replace(" ", "-", $status_class);
		
			echo "<td><span class='label label-" . $status_class . "' >{$rd->status}</span></td>";

			// get form details
			$form_type_details = $this->dpr_model->get_form_type_by_id($rd->form_type_id);

			?>				
			<td><?= $branch_name; ?></td>
			<td style='text-align:right;'><?= $rd->last_serial_number; ?></td>
			<td><?= $form_type_details->name; ?></td>
			<td><?=($form_type_details->is_accountable == 1) ? "YES" : "NO" ?></td>
			<td style='text-align:right;'><?= $rd->quantity; ?></td>
			<td><?= $rd->insert_timestamp; ?></td>

			<td data1="<?= $rd->request_detail_id ?>" data2="<?= $request_summary_detail->request_code ?>">				
				<a class='btn btn-small btn-info view-details' data='info' title="View Details"><i class="icon-white icon-list"></i></a>	
				<?php				
				
				if (($rd->status == 'COMPLETED') || ($rd->status == 'RETURNED')) {
					echo "<a class='btn btn-small btn-success process-btn' data='receive delivery' title='Receive to Inventory'><i class='icon-white icon-ok'></i></a>
							<a class='btn btn-small btn-danger process-btn' data='return delivery' title='Return to Dealer'><i class='icon-white icon-remove'></i></a>";
				}					

				?>
			</td>
		</tr>
	<?php endforeach; ?>
	<?php endif; ?>
	</tbody>
</table>
<div>
<?= $this->pager->create_links($search_url);  ?>
</div>
<script type="text/javascript">

	$(document).ready(function(){
                		
		var _search_by = '<?= $search_by; ?>';
		$("#search_option").val(_search_by);

		var _search_status = '<?= $search_status; ?>';
		$("#search_status").val(_search_status);             

	});

	$(".view-details").click(function(){
		var request_detail_id = $(this).parent().attr("data1");
		var request_code = $(this).parent().attr("data2");
		var listing_action = $(this).attr("data");
		showLoading();
		b.request({
			url: "/dpr/view_details",
			data: {
				"request_detail_id" : request_detail_id,
				"request_code" : request_code,				
			},
			on_success: function(data){
				hideLoading();
				if (data.status == "1")	{
					viewDetailsModal = b.modal.new({
						title: data.data.title,
						width:800,
						//disableClose: true,
						html: data.data.html,  
					});
				
					viewDetailsModal.show();
				} else {					
					// show add form modal					
					var errorViewDetailsModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Close' : function() {
								errorViewDetailsModal.hide();								 							
							}
						}
					});
					errorViewDetailsModal.show();		
				}
			}, on_error: function() {
				hideLoading();
			}					
		});
		return false;			
	});
	

	$(".process-btn").click(function(){
		processButtonAction($(this).parent().attr("data1"), $(this).parent().attr("data2"), $(this).attr("data"));	
	});

	var processButtonAction = function(_request_detail_id, _request_code, _listing_action) {

		showLoading();
		b.request({
			url: "/dpr/delivery/for_listing_confirm",
			data: {
				'request_detail_id' : _request_detail_id,
				'request_code' : _request_code,
				'listing_action' : _listing_action,
			},
			on_success: function(data){

				hideLoading();
				if (data.status == "1")	{
									
					// show add form modal					
					approveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Cancel' : function() {
								approveRequestModal.hide();								 							
							},
							'Proceed' : function() {

								$("#error-reasonremarks").hide();


								if (_listing_action == 'cancel') {
									
									if ($.trim($("#txt-remarks").val()) == "") {
										$("#error-reasonremarks").show();
										return;
									}
								}	
								$("#error-reasonremarks").hide();
								
								showLoading();
								// ajax request
								b.request({
									url : '/dpr/delivery/for_listing_proceed',
									data : {				
										'request_detail_id' : _request_detail_id,
										'request_code' : _request_code,
										'listing_action' : _listing_action,
										'remarks' : $("#txt-remarks").val(),
									},
									on_success : function(data) {
										
										hideLoading();
										if (data.status == "1")	{
											approveRequestModal.hide();
											
											// show add form modal					
											proceedApproveRequestModal = b.modal.new({
												title: data.data.title,
												width:450,
												disableClose: true,
												html: data.data.html,
												buttons: {
													'Ok' : function() {
														proceedApproveRequestModal.hide();
														redirect('dpr/delivery/listing');
													}
												}
											});
											proceedApproveRequestModal.show();

											
										} else {
											hideLoading();
											// show add form modal
											approveRequestModal.hide();					
											errorApproveRequestModal = b.modal.new({
												title: data.data.title,
												width:450,	
												html: data.data.html,
											});
											errorApproveRequestModal.show();	

										}
									}

								})
								return false;
								
							}									
						}
					});
					approveRequestModal.show();
					
				} else {
					// show add form modal					
					var errorApproveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Close' : function() {
								errorApproveRequestModal.hide();								 							
							}
						}
					});
					errorApproveRequestModal.show();		
				}
			}	
				
		})
		return false;
	}
	




























	$(".assign-mtr").click(function(){

		var _request_id = $(this).parent().attr("data1");
		var _request_code = $(this).parent().attr("data2")

		b.request({
			url: "/spare_parts/load_assign_mtr",
			data: {
				'request_id' : _request_id,
				'request_code' : _request_code,				
			},
			on_success: function(data){

				if (data.status == "1")	{
					
					// show add form modal					
					confirmAssignMTRModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Cancel' : function() {
								confirmAssignMTRModal.hide();								
							},
							'Proceed' : function() {
								if ($.trim($("#txt-mtrnumber").val()) == "") {
									$("#error-mtrnumber").show();
									return;
								
								} else {									
									b.request({
										url : '/spare_parts/check_mtr',
										data : {
											'request_id' : _request_id,
											'request_code' : _request_code,																
											'mtr_number' : $("#txt-mtrnumber").val(),
										},
										on_success : function(data) {
											if (data.status == "1")	{													
												b.request({
													url : '/spare_parts/proceed_assign_mtr',
													data : {
														'request_id' : _request_id,
														'request_code' : _request_code,																
														'mtr_number' : $("#txt-mtrnumber").val(),
													},
													on_success : function(data) {
														if (data.status == "1")	{													
															// show add form modal
															confirmAssignMTRModal.hide();					
															proceedAssignMTRModal = b.modal.new({
																title: data.data.title,
																width:450,	
																html: data.data.html,
																buttons: {
																	'Ok' : function() {
																		proceedAssignMTRModal.hide();
																		redirect('spare_parts/warehouse_request/listing');
																	}
																}
															});
															proceedAssignMTRModal.show();
														} else {
															confirmAssignMTRModal.hide();					
															errorAssignMTRModal = b.modal.new({
																title: data.data.title,
																width:450,	
																html: data.data.html,
															});
															errorAssignMTRModal.show();
														}												
													} 
												})
											} else {
												$("#error-mtrnumber").text(data.data.html);
												$("#error-mtrnumber").show();												
												return;
											}												
										} 
									})

								}
							}
						}
					});
					confirmAssignMTRModal.show();

					
				} else {
					// show add form modal
					approveRequestModal.hide();					
					errorApproveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,	
						html: data.data.html,
					});
					errorApproveRequestModal.show();	

				}		
			}	
				
		})
		return false;
		
	});
	






	
	

















	$("#download-btn").click(function(){
		var download_modal = b.modal.new({});
		var years = "";
		var months = "";
		var days = "";

		var _search_status = '<?= $search_status ?>';
		var _search_by = '<?= $search_by ?>';
		var _search_text = '<?= $search_text ?>';

		download_modal.init({

			title: "Download Warehouse Requests",
			width: 350,
			html: '<label for="start_date">Start Date: </label>\n<div class="form-inline wc-date">\n<div class="input-append"><input type="text" class="input-medium" id="pp_start_date" name="pp_start_date" readonly="readonly" style="cursor:pointer;z-index:2050" /><span id="pp_start_date_icon" class="add-on" style="cursor:pointer;"><i class="icon-calendar"></i></span></div>\n</div>\n\
			<br>\n\
			<label for="end_date">End Date: </label>\n<div class="form-inline wc-date">\n<div class="input-append"><input type="text" class="input-medium" id="pp_end_date" name="pp_end_date" readonly="readonly" style="cursor:pointer;z-index:2050" /><span id="pp_end_date_icon" class="add-on" style="cursor:pointer;"><i class="icon-calendar"></i></span></div>\n</div>\n\
			<br/>\n',
			buttons:{
				"Proceed": function(e){
					var this_button = $("#"+$(download_modal).attr("id")+"_btn_proceed");
					var start_date =  $("#"+$(download_modal).attr("id")+" #pp_start_date").val();
					var end_date = $("#"+$(download_modal).attr("id")+" #pp_end_date").val();
		
					if(!$(this_button).hasClass("no_clicking"))
					{
						$(this_button).addClass("no_clicking");

						b.request({
							url: "/spare_parts/warehouse_request/download_check",
							data: {
								"start_date": start_date,
								"end_date": end_date
							},
							on_success: function(data){
								var download_confirm_modal = b.modal.new({});
								if(data.status == "error")
								{
									download_confirm_modal.init({
										title: "Error Notification",
										html: "<p>"+data.msg+"</p>",
										width: 250
									});

									download_confirm_modal.show();
								}
								else if(data.status == "ok")
								{
									download_modal.hide();

									download_confirm_modal.init({
										title: "Download Confirmation",
										html: "<p>"+data.msg+"</p>",
										disableClose: true,
										buttons: {
											"Cancel": function(){
												download_confirm_modal.hide();
											},
											"Proceed": function(){
												var download_proceed_modal = b.modal.new({});

												var this_button = $("#"+$(download_confirm_modal).attr("id")+"_btn_proceed");

												if(!$(this_button).hasClass("no_clicking"))
												{
													$(this_button).addClass("no_clicking")
													b.request({
														url: "/spare_parts/warehouse_request/download_proceed",
														data: {
															"start_date": start_date,
															"end_date": end_date,															
														},
														on_success: function(data){
															var download_xls_modal = b.modal.new({});
															if(data.status == "error")
															{
																download_xls_modal.init({
																	title: "Error Notification",
																	html: "<p>"+data.msg+"</p>",
																	width: 250
																});

																download_xls_modal.show();
															}
															else if(data.status == "ok")
															{
																download_xls_modal.init({
																	title: "Download Pending Requests",
																	html: "<p>"+data.msg+"</p>",
																	disableClose: true,
																	buttons:{
																		"Cancel": function(){
																			download_xls_modal.hide();
																		},
																		"Download": function(){
																			download_xls_modal.hide();
																																		
																			redirect('/spare_parts/warehouse_request/export_xls/'+ start_date +'/' + end_date +'/' + _search_status +'/' + _search_by +'/' + _search_text);
																
																			
																		}
																	}
																});

																download_xls_modal.show();
															}
															$(this_button).removeClass("no_clicking")
														},
														on_error: function(){
															$(this_button).removeClass("no_clicking")
														}
													});
												}
												download_confirm_modal.hide();
											}
										}
									});
									download_confirm_modal.show();
								}
								$(this_button).removeClass("no_clicking");
							},
							on_error: function(){
								$(this_button).removeClass("no_clicking");
							}
						});
					}
				}
			}
		});
		
		download_modal.show();
	
		var currDate = new Date();
		var currYear = new Date().getFullYear();
		var yrRange = "2008:" + currYear;
		
		// from date
 		$("#pp_start_date").datepicker({
            'timeFormat': 'hh:mm tt',
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		
		var _end_date = new Date();
		_end_date.setDate(_end_date.getDate() - 7);
		$("#pp_start_date").datepicker('setDate', _end_date);
		
		$("#pp_start_date_icon").click(function(e) {
			$("#pp_start_date").datepicker("show");
		});
		
		
		// end date
 		$("#pp_end_date").datepicker({
            'timeFormat': 'hh:mm tt',
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		$("#pp_end_date").datepicker('setDate', '<?= date("Y-m-d") ?>');
		
		$("#pp_end_date_icon").click(function(e) {
			$("#pp_end_date").datepicker("show");
		});
		
	});
	
=======
<?php
	$breadcrumb_container = assemble_breadcrumb();
?>

<?= $breadcrumb_container; ?>
<div class='alert alert-danger'><h2>Delivery</h2></div>
<br>

<div >
	<form id='search_details' method='get' action =''>

		<strong>Status:&nbsp;</strong>
		<select name="search_status" id="search_status" style="width:250px;margin-left:20px" value="<?= $search_status ?>">
			<option value="ALL">ALL</option>						
			<option value="APPROVED">RECEIVED</option>
			<option value="CANCELLED">REJECTED</option>
			<option value="RETURNED">RETURNED</option>
		</select>  
	
		<br/>

		<strong>Search By:&nbsp;</strong>
		<select name="search_option" id="search_option" style="width:250px;" value="<?= $search_by ?>">
			<option value="request_code">Code</option>
			<option value="name">Name</option>
		</select>                 

		<input title="Search" class="input-large search-query" style="margin-top:-10px;margin-left:5px;" type="text" id="search_string" name="search_string" value="" maxlength='25' autofocus="">	

		<button id="button_search" class='btn btn-primary' style="margin-top:-10px;margin-left:5px;"><span>Search</span></button>
		<button id='button_refresh' class='btn' style="margin-top:-10px;"><span>Refresh</span></button>
	
		<br/>
		<span id="search_error" class="label label-important" style="display:none">Search String must be at least three (3) characters.</span>	
	
		<?php
		if ($search_text == "") {
		?>	
			<div id="search_summary" style="display:none;">
		<?php
		} else {
		?>	
			<div id="search_summary">
		<?php
		};
		?>		
		
			<span class="label label-important">Search Results for:</span>
			<span class="label label-default"><?= $search_status ?></span>
			<span class="label label-default"><?= $search_by ?></span>
			<span class="label label-default"><?= $search_text ?></span>
		</div>		
	</form>
</div>

<table class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style='width:80px;'>Request Code</th>
			<th>Status</th>
			<th style=''>Branch</th>
			<th style=''>Last Serial Number</th>
			<th style=''>Form</th>
			<th style=''>Is Accountable</th>			
			<th style=''>Quantity</th>			
			<th style='width:70px;'>Date Created</th>
			<th style='width:118px;'>Action</th>
		</tr>
	</thead>
	<tbody>
	<?php if(empty($request_detail)):?>
		<tr><td colspan='9' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($request_detail as $rd): 
		
		$request_summary_detail = $this->dpr_model->get_request_summary_by_id($rd->request_summary_id);

		$branch_details = $this->human_relations_model->get_branch_by_id($rd->branch_id);

		if (empty($branch_details)) {
			$branch_name = "N/A"; 
		} else {
			$branch_name = $branch_details->branch_name;
		}
	?>
		<tr>									
			<td><?= $request_summary_detail->request_code; ?></td>
			
			<?php								

			$status_class = strtolower(trim($rd->status));			
			$status_class = str_replace(" ", "-", $status_class);
		
			echo "<td><span class='label label-" . $status_class . "' >{$rd->status}</span></td>";

			// get form details
			$form_type_details = $this->dpr_model->get_form_type_by_id($rd->form_type_id);

			?>				
			<td><?= $branch_name; ?></td>
			<td style='text-align:right;'><?= $rd->last_serial_number; ?></td>
			<td><?= $form_type_details->name; ?></td>
			<td><?=($form_type_details->is_accountable == 1) ? "YES" : "NO" ?></td>
			<td style='text-align:right;'><?= $rd->quantity; ?></td>
			<td><?= $rd->insert_timestamp; ?></td>

			<td data1="<?= $rd->request_detail_id ?>" data2="<?= $request_summary_detail->request_code ?>">				
				<a class='btn btn-small btn-info view-details' data='info' title="View Details"><i class="icon-white icon-list"></i></a>	
				<?php				
				
				if (($rd->status == 'COMPLETED') || ($rd->status == 'RETURNED')) {
					echo "<a class='btn btn-small btn-success process-btn' data='receive delivery' title='Receive to Inventory'><i class='icon-white icon-ok'></i></a>
							<a class='btn btn-small btn-danger process-btn' data='return delivery' title='Return to Dealer'><i class='icon-white icon-remove'></i></a>";
				}					

				?>
			</td>
		</tr>
	<?php endforeach; ?>
	<?php endif; ?>
	</tbody>
</table>
<div>
<?= $this->pager->create_links($search_url);  ?>
</div>
<script type="text/javascript">

	$(document).ready(function(){
                		
		var _search_by = '<?= $search_by; ?>';
		$("#search_option").val(_search_by);

		var _search_status = '<?= $search_status; ?>';
		$("#search_status").val(_search_status);             

	});

	$(".view-details").click(function(){
		var request_detail_id = $(this).parent().attr("data1");
		var request_code = $(this).parent().attr("data2");
		var listing_action = $(this).attr("data");
		showLoading();
		b.request({
			url: "/dpr/view_details",
			data: {
				"request_detail_id" : request_detail_id,
				"request_code" : request_code,				
			},
			on_success: function(data){
				hideLoading();
				if (data.status == "1")	{
					viewDetailsModal = b.modal.new({
						title: data.data.title,
						width:800,
						//disableClose: true,
						html: data.data.html,  
					});
				
					viewDetailsModal.show();
				} else {					
					// show add form modal					
					var errorViewDetailsModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Close' : function() {
								errorViewDetailsModal.hide();								 							
							}
						}
					});
					errorViewDetailsModal.show();		
				}
			}, on_error: function() {
				hideLoading();
			}					
		});
		return false;			
	});
	

	$(".process-btn").click(function(){
		processButtonAction($(this).parent().attr("data1"), $(this).parent().attr("data2"), $(this).attr("data"));	
	});

	var processButtonAction = function(_request_detail_id, _request_code, _listing_action) {

		showLoading();
		b.request({
			url: "/dpr/delivery/for_listing_confirm",
			data: {
				'request_detail_id' : _request_detail_id,
				'request_code' : _request_code,
				'listing_action' : _listing_action,
			},
			on_success: function(data){

				hideLoading();
				if (data.status == "1")	{
									
					// show add form modal					
					approveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Cancel' : function() {
								approveRequestModal.hide();								 							
							},
							'Proceed' : function() {

								$("#error-reasonremarks").hide();


								if (_listing_action == 'cancel') {
									
									if ($.trim($("#txt-remarks").val()) == "") {
										$("#error-reasonremarks").show();
										return;
									}
								}	
								$("#error-reasonremarks").hide();
								
								showLoading();
								// ajax request
								b.request({
									url : '/dpr/delivery/for_listing_proceed',
									data : {				
										'request_detail_id' : _request_detail_id,
										'request_code' : _request_code,
										'listing_action' : _listing_action,
										'remarks' : $("#txt-remarks").val(),
									},
									on_success : function(data) {
										
										hideLoading();
										if (data.status == "1")	{
											approveRequestModal.hide();
											
											// show add form modal					
											proceedApproveRequestModal = b.modal.new({
												title: data.data.title,
												width:450,
												disableClose: true,
												html: data.data.html,
												buttons: {
													'Ok' : function() {
														proceedApproveRequestModal.hide();
														redirect('dpr/delivery/listing');
													}
												}
											});
											proceedApproveRequestModal.show();

											
										} else {
											hideLoading();
											// show add form modal
											approveRequestModal.hide();					
											errorApproveRequestModal = b.modal.new({
												title: data.data.title,
												width:450,	
												html: data.data.html,
											});
											errorApproveRequestModal.show();	

										}
									}

								})
								return false;
								
							}									
						}
					});
					approveRequestModal.show();
					
				} else {
					// show add form modal					
					var errorApproveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Close' : function() {
								errorApproveRequestModal.hide();								 							
							}
						}
					});
					errorApproveRequestModal.show();		
				}
			}	
				
		})
		return false;
	}
	




























	$(".assign-mtr").click(function(){

		var _request_id = $(this).parent().attr("data1");
		var _request_code = $(this).parent().attr("data2")

		b.request({
			url: "/spare_parts/load_assign_mtr",
			data: {
				'request_id' : _request_id,
				'request_code' : _request_code,				
			},
			on_success: function(data){

				if (data.status == "1")	{
					
					// show add form modal					
					confirmAssignMTRModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Cancel' : function() {
								confirmAssignMTRModal.hide();								
							},
							'Proceed' : function() {
								if ($.trim($("#txt-mtrnumber").val()) == "") {
									$("#error-mtrnumber").show();
									return;
								
								} else {									
									b.request({
										url : '/spare_parts/check_mtr',
										data : {
											'request_id' : _request_id,
											'request_code' : _request_code,																
											'mtr_number' : $("#txt-mtrnumber").val(),
										},
										on_success : function(data) {
											if (data.status == "1")	{													
												b.request({
													url : '/spare_parts/proceed_assign_mtr',
													data : {
														'request_id' : _request_id,
														'request_code' : _request_code,																
														'mtr_number' : $("#txt-mtrnumber").val(),
													},
													on_success : function(data) {
														if (data.status == "1")	{													
															// show add form modal
															confirmAssignMTRModal.hide();					
															proceedAssignMTRModal = b.modal.new({
																title: data.data.title,
																width:450,	
																html: data.data.html,
																buttons: {
																	'Ok' : function() {
																		proceedAssignMTRModal.hide();
																		redirect('spare_parts/warehouse_request/listing');
																	}
																}
															});
															proceedAssignMTRModal.show();
														} else {
															confirmAssignMTRModal.hide();					
															errorAssignMTRModal = b.modal.new({
																title: data.data.title,
																width:450,	
																html: data.data.html,
															});
															errorAssignMTRModal.show();
														}												
													} 
												})
											} else {
												$("#error-mtrnumber").text(data.data.html);
												$("#error-mtrnumber").show();												
												return;
											}												
										} 
									})

								}
							}
						}
					});
					confirmAssignMTRModal.show();

					
				} else {
					// show add form modal
					approveRequestModal.hide();					
					errorApproveRequestModal = b.modal.new({
						title: data.data.title,
						width:450,	
						html: data.data.html,
					});
					errorApproveRequestModal.show();	

				}		
			}	
				
		})
		return false;
		
	});
	






	
	

















	$("#download-btn").click(function(){
		var download_modal = b.modal.new({});
		var years = "";
		var months = "";
		var days = "";

		var _search_status = '<?= $search_status ?>';
		var _search_by = '<?= $search_by ?>';
		var _search_text = '<?= $search_text ?>';

		download_modal.init({

			title: "Download Warehouse Requests",
			width: 350,
			html: '<label for="start_date">Start Date: </label>\n<div class="form-inline wc-date">\n<div class="input-append"><input type="text" class="input-medium" id="pp_start_date" name="pp_start_date" readonly="readonly" style="cursor:pointer;z-index:2050" /><span id="pp_start_date_icon" class="add-on" style="cursor:pointer;"><i class="icon-calendar"></i></span></div>\n</div>\n\
			<br>\n\
			<label for="end_date">End Date: </label>\n<div class="form-inline wc-date">\n<div class="input-append"><input type="text" class="input-medium" id="pp_end_date" name="pp_end_date" readonly="readonly" style="cursor:pointer;z-index:2050" /><span id="pp_end_date_icon" class="add-on" style="cursor:pointer;"><i class="icon-calendar"></i></span></div>\n</div>\n\
			<br/>\n',
			buttons:{
				"Proceed": function(e){
					var this_button = $("#"+$(download_modal).attr("id")+"_btn_proceed");
					var start_date =  $("#"+$(download_modal).attr("id")+" #pp_start_date").val();
					var end_date = $("#"+$(download_modal).attr("id")+" #pp_end_date").val();
		
					if(!$(this_button).hasClass("no_clicking"))
					{
						$(this_button).addClass("no_clicking");

						b.request({
							url: "/spare_parts/warehouse_request/download_check",
							data: {
								"start_date": start_date,
								"end_date": end_date
							},
							on_success: function(data){
								var download_confirm_modal = b.modal.new({});
								if(data.status == "error")
								{
									download_confirm_modal.init({
										title: "Error Notification",
										html: "<p>"+data.msg+"</p>",
										width: 250
									});

									download_confirm_modal.show();
								}
								else if(data.status == "ok")
								{
									download_modal.hide();

									download_confirm_modal.init({
										title: "Download Confirmation",
										html: "<p>"+data.msg+"</p>",
										disableClose: true,
										buttons: {
											"Cancel": function(){
												download_confirm_modal.hide();
											},
											"Proceed": function(){
												var download_proceed_modal = b.modal.new({});

												var this_button = $("#"+$(download_confirm_modal).attr("id")+"_btn_proceed");

												if(!$(this_button).hasClass("no_clicking"))
												{
													$(this_button).addClass("no_clicking")
													b.request({
														url: "/spare_parts/warehouse_request/download_proceed",
														data: {
															"start_date": start_date,
															"end_date": end_date,															
														},
														on_success: function(data){
															var download_xls_modal = b.modal.new({});
															if(data.status == "error")
															{
																download_xls_modal.init({
																	title: "Error Notification",
																	html: "<p>"+data.msg+"</p>",
																	width: 250
																});

																download_xls_modal.show();
															}
															else if(data.status == "ok")
															{
																download_xls_modal.init({
																	title: "Download Pending Requests",
																	html: "<p>"+data.msg+"</p>",
																	disableClose: true,
																	buttons:{
																		"Cancel": function(){
																			download_xls_modal.hide();
																		},
																		"Download": function(){
																			download_xls_modal.hide();
																																		
																			redirect('/spare_parts/warehouse_request/export_xls/'+ start_date +'/' + end_date +'/' + _search_status +'/' + _search_by +'/' + _search_text);
																
																			
																		}
																	}
																});

																download_xls_modal.show();
															}
															$(this_button).removeClass("no_clicking")
														},
														on_error: function(){
															$(this_button).removeClass("no_clicking")
														}
													});
												}
												download_confirm_modal.hide();
											}
										}
									});
									download_confirm_modal.show();
								}
								$(this_button).removeClass("no_clicking");
							},
							on_error: function(){
								$(this_button).removeClass("no_clicking");
							}
						});
					}
				}
			}
		});
		
		download_modal.show();
	
		var currDate = new Date();
		var currYear = new Date().getFullYear();
		var yrRange = "2008:" + currYear;
		
		// from date
 		$("#pp_start_date").datepicker({
            'timeFormat': 'hh:mm tt',
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		
		var _end_date = new Date();
		_end_date.setDate(_end_date.getDate() - 7);
		$("#pp_start_date").datepicker('setDate', _end_date);
		
		$("#pp_start_date_icon").click(function(e) {
			$("#pp_start_date").datepicker("show");
		});
		
		
		// end date
 		$("#pp_end_date").datepicker({
            'timeFormat': 'hh:mm tt',
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		$("#pp_end_date").datepicker('setDate', '<?= date("Y-m-d") ?>');
		
		$("#pp_end_date_icon").click(function(e) {
			$("#pp_end_date").datepicker("show");
		});
		
	});
	
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
</script>