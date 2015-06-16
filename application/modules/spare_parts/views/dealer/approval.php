<div><h2>For Approval<a class='btn btn-small btn-default'id="download-btn" style="float:right;" title='Download'><i class='icon-download'></i>&nbsp;Download</a></h2></div>

<br>
<table class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style=''>Request Code</th>
			<th>Status</th>
			<th style=''>Dealer Name</th>
			<th style=''>Agent Name</th>
			<th style=''>PO Number</th>
			<th style=''>Remarks</th>
			<th style=''>Date Created</th>			
			<th style=''>Action</th>
		</tr>
	</thead>
	<tbody>
	<?php if(empty($transfers)):?>
		<tr><td colspan='9' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($transfers as $t): ?>
		<tr>
									
			<td><?= $t->request_code; ?></td>
			
			<?php
			if ($t->status == 'PENDING') {
				echo "<td><span class='label label-important' >{$t->status}</span></td>";
			} else if ($t->status == 'PROCESSING') {
				echo "<td><span class='label label-info' >{$t->status}</span></td>";
			} else if ($t->status == 'FOR APPROVAL') {
				echo "<td><span class='label label-warning' >{$t->status}</span></td>";
			} else {
				echo "<td><span class='label label-success' >{$t->status}</span></td>";
			}			
			?>

			<?php
				// get dealer name
				$dealer = $this->spare_parts_model->get_dealer_by_id($t->dealer_id);

				if (empty($dealer)) {
					echo "<td>N/A</td>";
				} else {
					echo "<td><?= $dealer->complete_name; ?></td>";
				}
			?>	

			<?php
			// get agent name
			$agent = $this->spare_parts_model->get_agent_by_id($t->agent_id);

			if (empty($agent)) {
				echo "<td>N/A</td>";
			} else {
				echo "<td><?= $agent->complete_name; ?></td>";
			}

			?>	

			<td><?= $t->purchase_order_number; ?></td>
			<td><?= $t->remarks; ?></td>
			<td><?= $t->insert_timestamp; ?></td>

			

			<td data1="<?= $t->dealer_request_id ?>" data2="<?= $t->request_code ?>">
				<a class='view-details' style="cursor:pointer;">Details</a> |
				<a class='btn btn-small btn-primary process-btn' data='yes' title="Yes"><i class="icon-white icon-ok"></i>&nbsp;Yes</a>				
				<a class='btn btn-small btn-danger process-btn' data='no' title='No'><i class='icon-white icon-remove'></i>&nbsp;No</a>
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
	
	$(".process-btn").click(function(){
		var dealer_request_id = $(this).parent().attr("data1");
		var dealer_request_code = $(this).parent().attr("data2");
		var is_approved = $(this).attr("data");
	
		b.request({
			url: "/spare_parts/dealer/for_approval_confirm",
			data: {
				'dealer_request_id' : dealer_request_id,
				'dealer_request_code' : dealer_request_code,
				'is_approved' : is_approved,
			},
			on_success: function(data){

				//alert(dealer_request_id + '|' + dealer_request_code + '|' + is_approved);

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

								if (is_approved == 'no') {
									
									if ($.trim($("#txt-remarks").val()) == "") {
										$("#error-reasonremarks").show();
										return;
									}
								}	

								$("#error-reasonremarks").hide();

								// ajax request
								b.request({
									url : '/spare_parts/dealer/for_approval_proceed',
									data : {				
										'dealer_request_id' : dealer_request_id,
										'dealer_request_code' : dealer_request_code,
										'is_approved' : is_approved,
										'remarks' : $("#txt-remarks").val(),
									},
									on_success : function(data) {
										
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
														redirect('spare_parts/dealer/approval');
													}
												}
											});
											proceedApproveRequestModal.show();

											
										} else {
											// show add form modal
											approveRequestModal.hide();					
											errorApproveRequestModal = b.modal.new({
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
	});
	
	$(".view-details").click(function(){
		var dealer_request_id = $(this).parent().attr("data1");
		var dealer_request_code = $(this).parent().attr("data2");
	
		b.request({
			url: "/spare_parts/dealer/view_details",
			data: {
				"dealer_request_id" : dealer_request_id,
				"dealer_request_code" : dealer_request_code,
			},
			on_success: function(data){
				if (data.status == "1")	{
				
					// show add form modal					
					viewDetailsModal = b.modal.new({
						title: data.data.title,
						width:450,
						disableClose: true,
						html: data.data.html,
						buttons: {
							'Close' : function() {
								viewDetailsModal.hide();								 							
							}									
						}
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
			}	
				
		})
		return false;			
	});
	
	$("#download-btn").click(function(){
		var download_modal = b.modal.new({});
		var years = "";
		var months = "";
		var days = "";

		download_modal.init({

			title: "Download Dealer Requests",
			width: 300,
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
							url: "/spare_parts/dealer/download_check",
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
														url: "/spare_parts/dealer/download_proceed",
														data: {
															"start_date": start_date,
															"end_date": end_date
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
																																		
																			redirect('/spare_parts/dealer/export_xls/'+ start_date +'/' + end_date);
																
																			
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
	
</script>