

<div class='alert alert-danger'><h2>Add New Request(Accountable Forms) <a id = "btn_save_request" class = 'btn' style = "float:right;" href = "add_new_accountables">New Request</a></div>

<body>

	<span>Reference No.</span>
	<input id = "txtrequestcode" TYPE = "TEXT" disabled = "disabled">
	<Label>Branch</Label>
	
	<Select id = "branch_option">
		<option value = '0'>Select Branch</option>
	<?php
		$where = "is_active = 1";
		$branch_list=$this->human_relations_model->get_branch($where,null,'branch_name ASC');
		foreach ($branch_list as $bl) {
			$branch_name = $bl->branch_name;
			echo "<option name = 'branch_data' value = {$bl->branch_id} data-tin='{$bl->tin}' data-address='{$bl->address_street}'>{$branch_name}</option>";
		}
	?>
	</Select>
	<br>

	<Label style = "position:absolute";>TIN</Label>
	<Label style = "position:absolute; left:500px;">Address</Label>

	<br>
	
	<input id = "txttin" placeholder="TIN"  TYPE = "TEXT" disabled = "disabled">
	<Label style = "position:absolute; left:500px;">Last Series No.</Label>
	<Label style = "position:absolute; left:730px;">Pcs. Per Booklet</Label>
	<Label style = "position:absolute; left:955px;">Quantity</Label>
	<input id = 'txtaddress' placeholder="Address" style = "width:500px;" TYPE = "TEXT" disabled = "disabled">

	<br>
	<Label>Form Type</Label>

	<Select id = "form_option">
		<option value = '0'>Select Form</option>
	<?php
		$where = "is_accountable = 1";
		$form_list=$this->dpr_model->get_form_type($where,null,'name ASC');
		foreach($form_list as $fl){
			$form_name = $fl->name;
			echo"<option name = 'form_data' value = {$fl->form_type_id} data-pcs='{$fl->pieces_per_booklet}'>{$form_name}</option>";
		}
	?>
	</Select>

	<input placeholder="Last Series Number" TYPE = "TEXT" disabled = "disabled">
	<input id = "txtpcs" placeholder="Pcs. Per Booklet" TYPE = "TEXT" disabled = "disabled">
	<input id = "txtqty" placeholder="0" TYPE = "TEXT" style = "text-align:right;">
	<br>
	<Label>Select Printing Press</Label>

	<Select id = "press_option" style = "width:450px;">
		<option value = '0'>Select Printing Press</option>
	<?php
		$where = "is_active = 1";
		$press_list=$this->dpr_model->get_press_name($where,null,'complete_name ASC');
		foreach($press_list as $pl){
			$press_name = $pl->complete_name;
			echo "<option value = '{$pl->printing_press_id}'>{$press_name}</option>";
		}
	?>
	</Select>
	<br>

	<a id = "btn_add_new" class = 'btn' >Add</a>
	<span id = "Error_Message_Branch" style = "color:red; display:none;">Select branch first...</span>
	<span id = "Error_Message_Form" style = "color:red; display:none;">Select form first...</span>
	<span id = "Error_Message_Press" style = "color:red; display:none;">Select Printing Press first...</span>
	<span id = "Error_Message_QTY" style = "color:red; display:none;">Invalid Quantity Value...</span>
	<br>
	<br>

	<table id = "request_list" class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th>Branch</th>
			<th>TIN</th>
			<th>Type Of Form</th>
			<th>Last Series No.</th>
			<th>Pcs. Per Booklet</th>
			<th>QTY</th>		
			<th>Printing Press</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody id = "record_data">
	</tbody>
</table>
	
	<div id = "record_result">
	</div>

	<br>
		
</body>
 
<SCRIPT TYPE = "text/javascript">

	$("#txtqty").keypress(function (e) {
	if( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)) {
	return false;
	}
	});

	$('#branch_option').change(function(){
		//alert ($('#branch_option').val());
		$('#txttin').val( $(this).find(':selected').data('tin'));
		$('#txtaddress').val( $(this).find(':selected').data('address'));
		$('#Error_Message_Branch').hide();
	});

	$('#form_option').change(function(){
		//alert ( $(this).find(':selected').data('pcs'));
		$('#txtpcs').val( $(this).find(':selected').data('pcs'));
		$('#Error_Message_Form').hide();
	});

	$('#press_option').change(function(){
		//alert ( $(this).find(':selected').data('pcs'));
		$('#Error_Message_Press').hide();
	});

	$('#txtqty').keypress(function(){
		if (_.isNumber($('#txtqty').val() * 1)){
			$('#Error_Message_QTY').hide();
			return;
		}
		$('#Error_Message_QTY').show();
	});

	$('#btn_add_new').click(function(){
		if ($('#branch_option').val() == 0){
			$('#Error_Message_Branch').show();
			return;
		}
		if ($('#form_option').val() == 0){
			$('#Error_Message_Form').show();
			return;
		}
		if ($('#press_option').val() == 0){
			$('#Error_Message_Press').show();
			return;
		}
		if ($('#txtqty').val() <= 0){
			$('#Error_Message_QTY').show();
			return;
		}

		proceedAddNewModal = b.modal.new({
		title: "Add New Request",
		width:450,
		disableClose: false,
		html: "Are you sure you want to save this Item?",
		buttons: {
			'Ok' : function() {
				proceedAddNewModal.hide();

				b.request({
					url: "/dpr/form_request/add_new_item",
					data: {
					"branch_id": $('#branch_option').val(),
					"last_serial_number": 0,
					"form_id": $('#form_option').val(),
					"quantity": $('#txtqty').val(),
					"printing_press_id": $('#press_option').val(),
					"request_code": $('#txtrequestcode').val()
					},

					on_success: function(data){

						if (data.status == "1") {

							// show add form modal 
							proceedAddNewItemModal = b.modal.new({
								title: 'Add New Item',
								width:450,
								disableClose: true,
								html: 'Successfully add new item...',
								buttons: {
									'Ok' : function() {
										proceedAddNewItemModal.hide();
										//alert(data.data.request_code);
										$('#txtrequestcode').val(data.data.request_code);

										b.request({
											url:"/dpr/form_request/refresh_list_details",
											data:{
											"request_code": $('#txtrequestcode').val()	
											},

										on_success: function(data){
											//alert(data.data.html);
											$('#record_data').html(data.data.html);
										}

										})
									}
								}
							});
						proceedAddNewItemModal.show();
						}
					}
				});
			}
		}	
		})
		proceedAddNewModal.show();
	});

	$('.delete_item').live('click',function(){
		//alert($(this).attr('data'));
		b.request({
			url: "/dpr/form_request/delete_item",
			data:{
				"request_detail_id": $(this).attr('data')
			},
			on_success: function(data){
				proceedDeleteItemModal = b.modal.new({
					title: 'Delete Item',
					width:450,
					disableClose: true,
					html: 'Successfully delete item...',
					buttons: {
						'Ok' : function() {
							proceedDeleteItemModal.hide();
							
							b.request({
								url:"/dpr/form_request/refresh_list_details",
								data:{
								"request_code": $('#txtrequestcode').val()	
								},

								on_success: function(data){
								//alert(data.data.html);
								$('#record_data').html(data.data.html);
								}	
							});						
						}
					}
				})
				proceedDeleteItemModal.show();
			}
		});
	});

</SCRIPT>
