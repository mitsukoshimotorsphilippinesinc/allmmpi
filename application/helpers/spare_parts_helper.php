<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function return_reserved_items($request_code, $reservation_status, $remarks) {
	
	$ci = ci();
	
	$ci->load->model('spare_parts_model');

	// identify which module

	// get items from details table (with status = 'PENDING')
	$convert = $ci->spare_parts_model->get_unit_conversion_by_codes($convert_from, $item_id);

	// update tr_warehouse_reservation status = $reservation_status and remarks = $remarks

	// loop items and add to inventory based on item_id

	// return result






	//base case
	if($base_unit == $convert_from)
	{
		//return converted quantity
		$return_data = array(
			'quantity' => $quantity,
			'convert_unit' => $convert_from,
			'message' => "Conversion success",
			'status' => 1
		);
		return $return_data;
	}
	
	//else, convert
	//get conversion
	$ci->load->model('items_model');
	$convert = $ci->items_model->get_unit_conversion_by_codes($convert_from, $item_id);
	if(empty($convert)) //no conversion exists
	{
		$error_data = array(
			'status' => 0,
			'message' => "Error: No conversion found."
		);
		return $error_data;
	}
	else //conversion exists
	{
		$new_convert_from = $convert->conversion_unit_code;
		$new_quantity = $quantity * $convert->conversion_qty;
		//recursion
		$converted_units = convert_units($new_quantity, $base_unit, $new_convert_from, $item_id);
		return $converted_units;
	}

} // end function

