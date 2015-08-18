<?php
	
	$ci = ci();	
	$ci->db_gen = $ci->load->database($this->uri->segment(1), TRUE);

	$module_title = str_replace("_", " ", $this->uri->segment(1));
	$module_title = strtoupper($module_title);

	$where = "is_active = 1 AND segment_name <> '{$segment_name}'";

	$department_module_details_sql = "SELECT * FROM rf_department_module WHERE {$where}";
	$department_module_details = $ci->db_gen->query($department_module_details_sql);
	$department_module_details = $department_module_details->result();		
	
	$active_segment_sql = "SELECT * FROM rf_department_module WHERE segment_name = '{$segment_name}'";
	$active_segment = $ci->db_gen->query($active_segment_sql);
	$active_segment = $active_segment->result();		
	$active_segment = $active_segment[0];				

	// get all submodules
	$where = "department_module_id = " . $active_segment->department_module_id;
	$module_submodule_details_sql = "SELECT * FROM rf_department_module_submodule WHERE {$where}";
	$module_submodule_details = $ci->db_gen->query($module_submodule_details_sql);
	$module_submodule_details = $module_submodule_details->result();		

?>


<div id="wrapper">
	<div id="sidebar-wrapper" style="background-color:#6D6E71;margin-top: -15px;font-family:Tahoma">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a href="#"><strong><?= $module_title ?></strong></a>
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