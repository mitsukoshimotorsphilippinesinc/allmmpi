<?php
	
	//$this->load->model("spare_parts_model");
	//$this->load->model("dpr_model");
	// get all department modules excluding current segment (alphabetically)
	if ($this->uri->segment(1) == "spare_parts") {
		$where = "is_active = 1 AND segment_name <> '{$segment_name}'";
		$department_module_details = $this->spare_parts_model->get_department_module($where);

		$active_segment = $this->spare_parts_model->get_department_module_by_segment($segment_name);

		// get all submodules of current segment
		$where = "department_module_id = " . $active_segment->department_module_id;
		$module_submodule_details = $this->spare_parts_model->get_department_module_submodule($where, NULL,'priority_order');
	} else {
		$where = "is_active = 1 AND segment_name <> '{$segment_name}'";
		$department_module_details = $this->dpr_model->get_department_module($where);

		$active_segment = $this->dpr_model->get_department_module_by_segment($segment_name);

		// get all submodules of current segment
		$where = "department_module_id = " . $active_segment->department_module_id;
		$module_submodule_details = $this->dpr_model->get_department_module_submodule($where, NULL,'priority_order');
	}

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
					<?php
						foreach ($module_submodule_details as $msd) {
							$url = '/' . $system_name . '/' . $segment_name . $msd->submodule_url;
							echo "<li>
									<a href='{$url}'>{$msd->submodule_name}</a>
								  </li>";
						}
					?>	
				</ul>
			</li>	
			<li>
				<a href="#"><hr/></a>	
			</li>
			
			<?php foreach ($department_module_details as $dmd) { 
				echo "<li>
						<a href='{$this->config->item('base_url')}/{$system_name}/{$dmd->segment_name}'>{$dmd->module_name}</a>	
					  </li>";
			 } ?>
		</ul>	
	</div>
</div>

<!--script type="text/javascript">
	$("#sidebar-wrapper").click(function(){
		alert('test');
		$('#sidebar-wrapper').removeClass('hidden-xs');     
	});
</script-->