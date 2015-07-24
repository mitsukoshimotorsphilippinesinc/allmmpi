<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function assemble_breadcrumb () {

	$ci = ci();
	
	$ci->load->model('spare_parts_model');
	$ci->load->model('human_relations_model');

	if ($ci->uri->segment(1)) {	
		
		// get department name
		$department_details = $ci->human_relations_model->get_department_by_url($ci->uri->segment(1));

		if (!empty($department_details)) {
			$first_segment = $department_details->department_name;
		} else {
			$first_segment = str_replace("_", " ", $ci->uri->segment(1));
			$first_segment = ucwords($first_segment);
		}

		$breadcrumb = $first_segment;
	}	

	if ($ci->uri->segment(2)) {	

		// get department name
		$department_module_details = $ci->spare_parts_model->get_department_module_by_segment_name($ci->uri->segment(2));

		if (!empty($department_module_details)) {
			$second_segment = $department_module_details->module_name;
		} else {
			$second_segment = str_replace("_", " ", $ci->uri->segment(2));
			$second_segment = ucwords($second_segment);
		}

		$breadcrumb .= "/ " . $second_segment;
	}

	if ($ci->uri->segment(3)) {
		// get submodule name
		$department_submodule_details = $ci->spare_parts_model->get_department_module_submodule_by_submodule_url($ci->uri->segment(3));

		if (!empty($department_submodule_details)) {
			$third_segment = $department_submodule_details->submodule_name;
		} else {
			$third_segment = str_replace("_", " ", $ci->uri->segment(3));
			$third_segment = ucwords($third_segment);
		}

		$breadcrumb .= " / " . $third_segment;

		$html = "<div class='breadcrumb'>{$breadcrumb}</div>";

	}

	return $html;
}	
