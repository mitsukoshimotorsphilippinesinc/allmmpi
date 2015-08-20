<html>
<head>

<?PHP
?>

<div class='alert alert-danger'><h2>Request List(Non-Accountable Forms)</div>
</head>

<body>

	<label>Select Status</label>
	<Label style = "position:fixed; left:500px; top:213px;">Enter Search</Label>
	<Select>
	<option>All</option>
	<option>Pending</option>
	<option>Received</option>
	</Select>
	<input TYPE = "TEXT" ID = "txtsearch" onClick="SelectAll('txtsearch')";>
	<table class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style='width:100px;'>Date Requested</th>
			<th style='width:80px;'>Reference No.</th>
			<th style='width:100px;'>QTY</th>		
			<th style='width:118px;'>Status</th>
			<th style='width:118px;'>Action</th>
		</tr>
	</thead>
	</table>

	<a class = 'btn' href = "add_new_non_accountables">Create New Request</a>
	<a class = 'btn' >Print Request</a>
		
</body>

</html>
 
<SCRIPT TYPE = "text/javascript">

</SCRIPT>