<div id="wrapper">
	<div id="sidebar-wrapper" style="background-color:#6D6E71;margin-top: -15px;">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a href="#"><strong>Spare Parts</strong></a>
			</li>	
			<li>
				<a class="collapsed" data-target="#dealer-menu" data-toggle="collapse" href="javascript:;" aria-expanded="false">		
					<strong><span style="font-size:16px;color:black;">P.O. From Dealer </span><i class='icon-arrow-down'></i></strong>
				</a>
				<ul id="dealer-menu" class="collapse" aria-expanded="true" style="">
					<li>
						<a href="/spare_parts/dealer">Dashboard</a>
					</li>
					<li>
						<a href="#">Search By Request</a>
					</li>
					<li>
						<a href="#">For Approval</a>
					</li>	
					<li>
						<a href="#">Approved Requests</a>
					</li>	
					<li>
						<a href="#">Reports</a>
					</li>	
				</ul>
			</li>	
			<li>
				<a href="#">-------------------</a>	
			</li>
			<li>
				<a href="#">Warranty Claim</a>	
			</li>
			<li>
				<a href="#">Salary Deduction</a>
			</li>
			<li>
				<a href="#">Warehouse Request</a>
			</li>
			<li>
				<a href="#">Warehouse Claim Parts</a>
			</li>
			<li>
				<a href="#">Service Unit</a>
			</li>
			<li>
				<a href="#">Free Of Charge</a>
			</li>
			<li>
				<a href="#">Walk-In</a>
			</li>
			<li>
				<a href="#">Branch Request</a>
			</li>			
		</ul>	
	</div>
</div>

<script type="text/javascript">
	$("#sidebar-wrapper").click(function(){
		alert('test');
		$('#sidebar-wrapper').removeClass('hidden-xs');     
	});
</script>