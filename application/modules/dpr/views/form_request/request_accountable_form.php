<html>
<head>

<?PHP
?>
<div class='alert alert-danger'><h2>Request List(Accountable Forms)</div>
</head>

<body>

	<Label>Select Status</Label>
	<Label style = "position:fixed; left:515px; top:213px;">Enter Search</Label>
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
			<th style=''>Branch</th>
			<th style=''>TIN</th>
			<th style='width:50px;'>Type Of Form</th>
			<th style='width:100px;'>QTY</th>		
			<th style='width:118px;'>Printing Press</th>
			<th style='width:118px;'>Status</th>
			<th style='width:118px;'>Action</th>
		</tr>
	</thead>
	</table>

	<a class = 'btn' href = "add_new_accountables" >Create New Request</a>
	<a class = 'btn' >Print Request</a>

</body>

</html>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
 
<SCRIPT TYPE = "text/javascript">

</SCRIPT>








<a href='/spare_parts/salary_deduction/add'></a>