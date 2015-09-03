<div class='alert alert-danger'><h2>Add New Item<a id = "add_item" class = 'btn' style = "float:right;" href = "add_new_tr">Add</a></div>

<span>Search Item</span>
<input id = "search_part" name = "search_part" placeholder="Enter Search"  TYPE = "TEXT">
<span>Discount</span>
<Select style = "width:60px;" id = "branch_option" name = "branch_option">
	<?php
		for($i=0;$i<=30;$i++){
			echo "
			<option value = '{$i}'>$i</option>";
		}
	?>
</Select>
<span>QTY</span>
<input style = "width:60px;" id = "quantity" name = "quantity" placeholder="Quantity"  TYPE = "TEXT">
<button id="search_item" name="search_item" class='btn' style="margin-top:-10px;float:right;"><span>Search</span></button>
<span id = "Error_Message_Part" style = "color:red; display:none;">No Keywords or Phrase to search...</span>
<table id = "parts_list" class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th>SKU</th>
			<th>Description</th>
			<th>Model</th>
			<th>Part No.</th>
			<th>Unit</th>
			<th>QTY</th>
			<th>SRP</th>
			<th>Res</th>
			<th>Location</th>
		</tr>
	</thead>
<table>

<SCRIPT TYPE = "text/javascript">

	$('#search_part').keypress(function(){		
		$('#Error_Message_Part').hide();
	});

	$('#search_item').click(function(){

		if ($('#search_part').val() == ""){
			$('#Error_Message_Part').show();
			return;
		}

	});

</SCRIPT>
