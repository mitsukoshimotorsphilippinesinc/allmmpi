<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function return_reserved_items($request_code, $reservation_status, $remarks) {
	
	$ci = ci();
	
	$ci->load->model('spare_parts_model');
	//$this->db_spare_parts = $this->load->database('spare_parts', TRUE);	
	$ci->db_spare_parts = $ci->load->database('spare_parts', TRUE);

	// identify which module
	$module_code = substr($request_code, 0, 2);
	$department_module_details = $ci->spare_parts_model->get_department_module_by_code($module_code);

	// request_summary
	$request_summary_sql = "SELECT a." . $department_module_details->segment_name . "_id as id, a.* FROM
							is_" . $department_module_details->segment_name . " a
						WHERE
						a.request_code = '" . $request_code . "'";

	$request_summary = $ci->db_spare_parts->query($request_summary_sql);
	$request_summary = $request_summary->result();		
	$request_summary = $request_summary[0];				
	
	// get request details
	$request_details_sql = "SELECT a." . $department_module_details->segment_name . "_id as id, a.* FROM
								is_" . $department_module_details->segment_name . "_detail a
							WHERE
							a." . $department_module_details->segment_name . "_id = '" . $request_summary->id . "' AND a.status IN ('PENDING')";
	
	//var_dump($update_detail_status_sql);						

	$request_details = $ci->db_spare_parts->query($request_details_sql);
	$request_details = $request_details->result();		

	foreach ($request_details as $rd) {
		// return good and bad qty per item
		$update_is_item_sql = "UPDATE is_item 
								SET
									good_quantity = good_quantity + ". abs($rd->good_quantity) .",
									bad_quantity = bad_quantity + ". abs($rd->bad_quantity) ."
								WHERE
									item_id = " . $rd->item_id;

		$ci->db_spare_parts->query($update_is_item_sql);

		$current_datetime = date("Y-m-d H:i:s");

		// update status = $reservation_status
		$complete_remarks = "[" . $current_datetime . "] " . $remarks . "\n" . $rd->remarks;

		$update_detail_status_sql =  "UPDATE is_" . $department_module_details->segment_name . "_detail
										SET
											status = '" . $reservation_status . "',
											update_timestamp = '" . $current_datetime . "',
											remarks = '" . $complete_remarks . "'
										WHERE
											" . $department_module_details->segment_name . "_detail_id = " . $rd->id ;

		
		$ci->db_spare_parts->query($update_detail_status_sql);

	}

	$current_datetime = date("Y-m-d H:i:s");
	// update status = $reservation_status
	$complete_remarks = "[" . $current_datetime . "] " . $remarks . "\n" . $request_summary->remarks;

	$update_summary_status_sql =  "UPDATE is_" . $department_module_details->segment_name . "
										SET
											status = '" . $reservation_status . "',
											update_timestamp = '" . $current_datetime . "',
											remarks = '" . $complete_remarks . "'
										WHERE
											" . $department_module_details->segment_name . "_id = " . $request_summary->id;

	$ci->db_spare_parts->query($update_summary_status_sql);

	// update tr_warehouse_reservation
	$data = array(
			'status' => 'DENIED',
			'update_timestamp' => $current_datetime
		);

	$ci->spare_parts_model->update_warehouse_reservation($data, "transaction_number = '" . $request_code . "'");

	return true;

} // end function

