<html>
<head>

<?PHP
?>
<div class='alert alert-danger'><h2>Request List(Accountable Forms)</div>
</head>

<body>

	<form id = "accountable_search" method = "get"> 

	<span>Select Status</span>
	<span style = "margin-left:130px;">Enter Search</span>
	<br>
	<Select name = "status_option" id = "status_option" style ="margin-left:0px;">
	<option value = "All" >All</option>
	<option value = "PENDING">Pending</option>
	<option value = "RECEIVED">Received</option>
	<option value = "COMPLETED">Completed</option>
	</Select>

	<input TYPE = "TEXT" name = "txtsearch" ID = "txtsearch" onClick="SelectAll('txtsearch')";>
	
	<button id="button_search" class='btn btn-primary' style="margin-top:-10px;margin-left:5px;"><span>Search</span></button>
	
	<table class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style='width:100px;'>Date Requested</th>
			<th style='width:80px;'>Reference No.</th>
			<th style='width:118px;'>Status</th>
			<th style='width:118px;'>Action</th>
		</tr>
	</thead>
	<tbody>
		<?php
			//var_dump($all_record);
			If (empty($all_record)){
				echo "<tr><td colspan = 4> No Records Found... </td></tr>";
			}else{
				
				foreach ($all_record as $al) {
							$request_summary_id = $al->request_summary_id;
							$date_request = $al->insert_timestamp;
       						$reference_no = $al->request_code;
       						$status = $al->status;

       					 	 echo "<tr>			
								<td>{$date_request}</td>
								<td>{$reference_no}</td>
								<td>{$status}</td>
								";
								if (($status == "COMPLETED") || ($status == "CANCELLED") || ($status == "RECEIVED") || ($status == "RETURNED")){
								echo 	
								"<td><a href='{$this->config->item('base_url')}/dpr/form_request/view_accountable_details/{$request_summary_id}' class = 'btn view_details' data = '{$request_summary_id}'>View Details</a> <a disabled = 'disabled' class = 'btn delete_item' data = '{$request_summary_id}'>Cancel</a></td></tr>";
								}else{
								echo 	
								"<td><a href='{$this->config->item('base_url')}/dpr/form_request/view_accountable_details/{$request_summary_id}' class = 'btn view_details' data = '{$request_summary_id}'>View Details</a> <a class = 'btn delete_item' data = '{$request_summary_id}'>Cancel</a></td></tr>";	
								}			
       					};
			}
		?>
		<tr>

		</tr>
	</tbody>
	</table>

	<a class = 'btn' href = "add_new_accountables" >Create New Request</a>
	<a class = 'btn' >Print Request</a>

</form>
<?= $this->pager->create_links($search_url);  ?>
</body>

</html>
 
<SCRIPT TYPE = "text/javascript">


</SCRIPT>
