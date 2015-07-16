<?php
	
	$this->load->model("spare_parts_model");
	// get all department modules excluding current segment (alphabetically)
	$where = "is_active = 1 AND segment_name <> '{$segment_name}'";
	$department_module_details = $this->spare_parts_model->get_department_module($where);

	$active_segment = $this->spare_parts_model->get_department_module_by_segment($segment_name);

?>


<div id="wrapper">
	<div id="sidebar-wrapper" style="background-color:#6D6E71;margin-top: -15px;font-family:Tahoma">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a href="#"><strong>Spare Parts</strong></a>
			</li>	
			<li>
				<a class="collapsed" data-target="#dealer-menu" data-toggle="collapse" href="javascript:;" aria-expanded="false">		
					<strong><span style="font-size:13px;color:black;"> <?= $active_segment->module_name ?> </span><i class='icon-arrow-down'></i></strong>
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
				<a href="#"><hr/></a>	
			</li>
			
			<?php foreach ($department_module_details as $dmd) { 
			?>

			<li>
				<a href="#"><?= $dmd->module_name ?></a>	
			</li>
			<?php } ?>
		</ul>	
	</div>
</div>

<!--script type="text/javascript">
	$("#sidebar-wrapper").click(function(){
		alert('test');
		$('#sidebar-wrapper').removeClass('hidden-xs');     
	});
</script-->