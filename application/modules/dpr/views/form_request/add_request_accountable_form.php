

<div class='alert alert-danger'><h2>Add New Request(Accountable Forms) <a class = 'btn' style = "float:right;">Save Request</a></div>

<body>

	<span>Reference No.</span>
	<input TYPE = "TEXT" disabled = "disabled">
	<Label>Branch</Label>
	
	<Select id = "branch_option">
	<?php
		$where = "is_active = 1";
		$branch_list=$this->human_relations_model->get_branch($where,null,'branch_name ASC');
		foreach ($branch_list as $bl) {
			$branch_name = $bl->branch_name;
			echo "<option name = 'branch_data' value = {$bl->branch_id} data-address='{$bl->address_street}'>{$branch_name}</option>";
		}
	?>
	</Select>

	<br>
	<Label style = "position:absolute";>TIN</Label>
	<Label style = "position:absolute; left:500px;">Address</Label>

	<br>
	<input placeholder="TIN"  TYPE = "TEXT" disabled = "disabled">
	<Label style = "position:absolute; left:500px;">Last Series No.</Label>
	<Label style = "position:absolute; left:730px;">Pcs. Per Booklet</Label>
	<Label style = "position:absolute; left:955px;">Quantity</Label>
	<input id = 'txtaddress' placeholder="Address" style = "width:500px;" TYPE = "TEXT" disabled = "disabled">

	<br>
	<Label>Form Type</Label>

	<Select id = "form_option">
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
	<?php
		$where = "is_active = 1";
		$press_list=$this->dpr_model->get_press_name($where,null,'complete_name ASC');
		foreach($press_list as $pl){
			$press_name = $pl->complete_name;
			echo "<option>{$press_name}</option>";
		}
	?>
	</Select>

	<br>
	<a class = 'btn' >Add</a>
	<br>
	<br>
	<table class='table table-striped table-bordered'>
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
	</table>
	<br>
		
</body>
 
<SCRIPT TYPE = "text/javascript">

	$('#branch_option').change(function(){
		//alert ($('#branch_option').val());
		$('#txtaddress').val( $(this).find(':selected').data('address'));
	});

	$('#form_option').change(function(){
		//alert ( $(this).find(':selected').data('pcs'));
		$('#txtpcs').val( $(this).find(':selected').data('pcs'));
	});

</SCRIPT>