<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse_request extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
	
		$this->load->model('spare_parts_model');
		$this->load->model('human_relations_model');
		$this->load->model('warehouse_model');
		$this->load->library('pager');		

		$this->db_spare_parts = $this->load->database('spare_parts', TRUE);
	}

	public function index()
	{
		//$test_id = abs($this->input->get('test_id'));		

		//$db_spare_parts = $this->load->database('spare_parts', TRUE);

		//$query = $db_spare_parts->select('sku, good_quantity, bad_quantity')->get('is_item');
  		//var_dump($query);			

		$this->template->view('Warehouse_request/dashboard');
	}

	public function approval()
	{

		$search_status = trim($this->input->get("search_status"));
		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));

		$search_url = "";
		$count_is = 0;
		$transfers = "";
		$request_search_by = "";

		if ($search_by == 'name') {
			$request_search_by = "id_number";

			// get all personal_information_id in pm_personal_information
			$where = "complete_name LIKE '%" . $search_text . "%'";
			$personal_information_details = $this->human_relations_model->get_personal_information($where, NULL, NULL, "personal_information_id, complete_name");

			$where_id_numbers = "";
			$count_id_num = 0;
			// get the id_numbers within the personal_information_id results above
			if (count($personal_information_details) > 0) {
				foreach ($personal_information_details as $pid) {
					
					$employment_information_details = $this->human_relations_model->get_employment_information("personal_information_id = ". $pid->personal_information_id);
					
					if (count($employment_information_details) > 0) {
						foreach ($employment_information_details as $eid) {
							if ($count_id_num == 0)
								$where_id_numbers = "'" . $eid->id_number . "'";
							else 		
								$where_id_numbers = $where_id_numbers . ", '" . $eid->id_number . "'";

							$count_id_num++;
						}
					}
				}	
			}
		}

		if (empty($search_status)) {
			$where = "status IN ('FOR APPROVAL', 'APPROVED')";
		} else {

			if ($search_status == 'ALL') {
				$where = "status IN ('FOR APPROVAL', 'APPROVED')";
			} else {
				$where = "status = '". $search_status ."'";
			}			
		
			if ($where != NULL) {
				if ($search_by == 'name')
					$where = $where . " AND ". $request_search_by ." IN (" . $where_id_numbers . ")";
				else
					$where = $where . " AND ". $search_by ." LIKE '%" . $search_text . "%'";
			} else {
				if ($search_by == 'name')
					$where = $request_search_by ." IN (" . $where_id_numbers . ")";
				else
					$where = $search_by ." LIKE '%" . $search_text . "%'";
			} 	
		}	

		// set pagination data
		$config = array(
				'pagination_url' => "/spare_parts/warehouse_request/approval/",
				'total_items' => $this->spare_parts_model->get_warehouse_request_count($where),
				'per_page' => 10,
				'uri_segment' => 4,
		);

		$this->pager->set_config($config);

		$transfers = $this->spare_parts_model->get_warehouse_request($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");			
		
		// search vars
		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		$this->template->transfers = $transfers;
		
		$this->template->view('warehouse_request/approval');	
		

	}	


	public function for_approval_confirm()
	{
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$warehouse_request_code = $this->input->post("warehouse_request_code");
		$is_approved = $this->input->post("is_approved");

		$warehouse_request = $this->spare_parts_model->get_warehouse_request_by_id($warehouse_request_id);

		if (empty($warehouse_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$warehouse_request_code}].</p>";
			$title = "Error: Confirm Approval";

			$this->return_json("0","Warehouse Request Code not found in DB", array("html" => $html, "title" => $title));			

		} else {

			if ($is_approved == 'yes') {

				$html = "You are about to approve the Warehouse Request with Request Code: <strong>" . $warehouse_request_code . "</strong>. Do you want to continue?";
			} else {
				$html = "<p>You are about to deny the Warehouse Request with Request Code: <strong>" . $warehouse_request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>Reason/Remarks:</strong></span></br>
								<input id='txt-remarks' style='width:400px;'/><br/>
								<span id='error-reasonremarks' style='color:red;display:none'>Remarks/Reason is required.</span>
							</div>	
							<br/>
							Do you want to continue?</p>";
			}	

			$title = "Confirm Approval :: " . $warehouse_request_code;
				
			$data = array (
				'warehouse_request_id' => $warehouse_request_id,
				'warehouse_request_code' => $warehouse_request_code,
				'is_approved' => $is_approved
				);	

			$this->return_json("1","Confirm Approval of Warehouse Request.",array("html" => $html, "title" => $title, "data" => $data));
		
		}
		
		return;
	}
	
	public function for_approval_proceed()
	{
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$warehouse_request_code = $this->input->post("warehouse_request_code");
		$is_approved = $this->input->post("is_approved");
		$remarks =  $this->input->post("remarks");
		
		$warehouse_request = $this->spare_parts_model->get_warehouse_request_by_id($warehouse_request_id);		

		if (empty($warehouse_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$warehouse_request_code}].</p>";
			$title = "Error: Proceed Approval";

			$this->return_json("0","Warehouse Request Code not found in DB", array("html" => $html, "title" => $title));	
			
		} else {
	
			// change status to DENIED
			$current_datetime = date("Y-m-d H:i:s");
			
			if ($is_approved == 'no') {
				$new_remarks = "[" . $current_datetime . "] " . $remarks . "\n" . $warehouse_request->remarks;

				$data = array(
					'status' => "DENIED",
					'approved_by' => $this->user->user_id,
					'remarks' => $new_remarks,
					'approve_timestamp' => $current_datetime
				);

				// TODO: UPDATE tr_warehouse_reservation status = 'DENIED' and update_timestamp = now()

				// TODO: RETURN ITEMS TO WAREHOUSE INVENTORY

				$html = "You have denied the Warehouse Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "Denied :: " . $warehouse_request_code;

				$this->return_json("1","Denied Warehouse Request.",array("html" => $html, "title" => $title));		

			} else {
				// change status to APPROVED
				$data = array(
					'status' => "APPROVED",
					'approved_by' => $this->user->user_id,					
					'approve_timestamp' => $current_datetime
				);

				$html = "You have successfully approved the Warehouse Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "Approved :: " . $warehouse_request_code;
			}
			
			$where = "warehouse_request_id = " . $warehouse_request_id;
			$this->spare_parts_model->update_warehouse_request($data, $where);

			$this->return_json("1","Successful Approval of Warehouse Request.",array("html" => $html, "title" => $title));
						
		}	
		return;	
	}


	public function view_details()
	{
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$warehouse_request_code = $this->input->post("warehouse_request_code");
		$listing_action = $this->input->post("listing_action");
			
		$warehouse_request = $this->spare_parts_model->get_warehouse_request_by_id($warehouse_request_id);		

		if (empty($warehouse_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$warehouse_request_code}].</p>";
			$title = "Error: View Details";

			$this->return_json("0","Warehouse Request Code not found in DB", array("html" => $html, "title" => $title));	
			
		} else {

			$where = "warehouse_request_id = {$warehouse_request_id}";
			$warehouse_request_details = $this->spare_parts_model->get_warehouse_request_detail($where);
		
			$data = array(
				'warehouse_request' => $warehouse_request,
				'warehouse_request_details' =>$warehouse_request_details,
				'listing_action' => $listing_action
			);
		
			$html = $this->load->view("warehouse_request/view_details",$data,true);
			 
			$title = "View Details :: " . $warehouse_request_code;
			$this->return_json("1","View Details Warehouse Request", array("html" => $html, "title" => $title, "request_status" => $warehouse_request->status));
			
		}
			
		return;
	}


	public function listing()
	{

		$search_status = trim($this->input->get("search_status"));
		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));

		$search_url = "";
		$count_is = 0;
		$transfers = "";
		$request_search_by = "";		

		if ($search_by == 'name') {
			$request_search_by = "id_number";

			// get all personal_information_id in pm_personal_information
			$where = "complete_name LIKE '%" . $search_text . "%'";
			$personal_information_details = $this->human_relations_model->get_personal_information($where, NULL, NULL, "personal_information_id, complete_name");

			$where_id_numbers = "";
			$count_id_num = 0;
			// get the id_numbers within the personal_information_id results above
			if (count($personal_information_details) > 0) {
				foreach ($personal_information_details as $pid) {
					
					$employment_information_details = $this->human_relations_model->get_employment_information("personal_information_id = ". $pid->personal_information_id);
					
					if (count($employment_information_details) > 0) {
						foreach ($employment_information_details as $eid) {
							if ($count_id_num == 0)
								$where_id_numbers = "'" . $eid->id_number . "'";
							else 		
								$where_id_numbers = $where_id_numbers . ", '" . $eid->id_number . "'";

							$count_id_num++;
						}
					}
				}	
			}
		} 

		if (empty($search_status)) {
			$where = "status IN ('PENDING', 'FOR APPROVAL', 'APPROVED', 'DENIED', 'PROCESSING', 'COMPLETED', 'CANCELLED', 'FORWARDED')";
		} else {

			if ($search_status == 'ALL') {
				$where = "status IN ('PENDING', 'FOR APPROVAL', 'APPROVED', 'DENIED', 'PROCESSING', 'COMPLETED', 'CANCELLED', 'FORWARDED')";
			} else {
				$where = "status = '". $search_status ."'";
			}
				
			if ($where != NULL) {
				if ($search_by == 'name')
					$where = $where . " AND ". $request_search_by ." IN (" . $where_id_numbers . ")";
				else
					$where = $where . " AND ". $search_by ." LIKE '%" . $search_text . "%'";
			} else {
				if ($search_by == 'name')
					$where = $request_search_by ." IN (" . $where_id_numbers . ")";
				else
					$where = $search_by ." LIKE '%" . $search_text . "%'";
			}
		}	
		

		// set pagination data
		$config = array(
				'pagination_url' => "/spare_parts/warehouse_request/listing/",
				'total_items' => $this->spare_parts_model->get_warehouse_request_count($where),
				'per_page' => 10,
				'uri_segment' => 4,
		);

		$this->pager->set_config($config);

		$transfers = $this->spare_parts_model->get_warehouse_request($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");			
		
		// search vars
		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		$this->template->transfers = $transfers;
		
		$this->template->view('warehouse_request/listing');	
		
	}	

	public function for_listing_confirm()
	{
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$warehouse_request_code = $this->input->post("warehouse_request_code");
		$listing_action = $this->input->post("listing_action");

		$warehouse_request = $this->spare_parts_model->get_warehouse_request_by_id($warehouse_request_id);

		if (empty($warehouse_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$warehouse_request_code}].</p>";
			$title = "Error: Confirm";

			$this->return_json("0","Warehouse Request Code not found in DB", array("html" => $html, "title" => $title));			

		} else {

			if ($listing_action == 'for approval') {
				$title = "File For Approval :: " . $warehouse_request_code;
				$html = "You are about forward the request for approval with Request Code: <strong>" . $warehouse_request_code . "</strong>. Do you want to continue?";
			}

			if ($listing_action == 'forward to warehouse') {
				$title = "Forward To Warehouse :: " . $warehouse_request_code;
				$html = "<p>You are about to forward the request to Warehouse with Request Code: <strong>" . $warehouse_request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>MTR Number:</strong></span></br>
								<input id='txt-mtrnumber' style='width:100px;' maxlength='10' placeholder='12345' /><br/>
								<span id='error-mtrnumber' style='color:red;display:none'>MTR Number is required.</span>
							</div>	
							<br/>
							Do you want to continue?</p>";
			}

			if ($listing_action == 'cancel') {
				$title = "Cancel Request :: " . $warehouse_request_code;
				$html = "<p>You are about to cancel the Warehouse Request with Request Code: <strong>" . $warehouse_request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>Reason/Remarks:</strong></span></br>
								<input id='txt-remarks' style='width:400px;' maxlength='320' placeholder='Put remarks here...' /><br/>
								<span id='error-reasonremarks' style='color:red;display:none'>Remarks/Reason is required.</span>
							</div>	
							<br/>
							Do you want to continue?</p>";
			}	
	
			$data = array (
				'warehouse_request_id' => $warehouse_request_id,
				'warehouse_request_code' => $warehouse_request_code,
				'listing_action' => $listing_action
				);	

			$this->return_json("1","Confirm Action of Warehouse Request.",array("html" => $html, "title" => $title, "data" => $data));
		
		}
		
		return;
	}

	public function for_listing_proceed()
	{
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$warehouse_request_code = $this->input->post("warehouse_request_code");
		$listing_action = $this->input->post("listing_action");
		$remarks =  $this->input->post("remarks");
		
		$warehouse_request = $this->spare_parts_model->get_warehouse_request_by_id($warehouse_request_id);		

		if (empty($warehouse_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$warehouse_request_code}].</p>";
			$title = "Error: Proceed";

			$this->return_json("0","Warehouse Request Code not found in DB", array("html" => $html, "title" => $title));	
			
		} else {
	
			// change status to DENIED
			$current_datetime = date("Y-m-d H:i:s");
			
			if ($listing_action == 'cancel') {
				$new_remarks = "[" . $current_datetime . "] " . $remarks . "\n" . $warehouse_request->remarks;

				// TODO: RETURN ITEMS TO WAREHOUSE INVENTORY

				// TODO: change tr_warehouse_reservation status = CANCELLED, update_timestamp = now()

				$data = array(
					'status' => "CANCELLED",
					'approved_by' => $this->user->user_id,
					'remarks' => $new_remarks,
					'approve_timestamp' => $current_datetime
				);

				$html = "You have cancelled the Warehouse Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "Cancelled :: " . $warehouse_request_code;	

			} else if ($listing_action == 'for approval') {

				// change status to FOR APPROVAL
				$data = array(
					'status' => "FOR APPROVAL",
					'approved_by' => $this->user->user_id,					
					'approve_timestamp' => $current_datetime
				);

				$html = "You have successfully filed the request for approval with Warehouse Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "File For Approval :: " . $warehouse_request_code;
			
			} else if ($listing_action == 'forward to warehouse') {

				// change status to FORWARDED
				$data = array(
					'status' => "FORWARDED",
					'approved_by' => $this->user->user_id,					
					'approve_timestamp' => $current_datetime
				);

				$html = "You have successfully forwaded the request to warehouse with Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "Forward To Warehouse :: " . $warehouse_request_code;
			
				// change tr_warehouse_reservation to PENDING
				$data_reservation = array(
					'status' => "PENDING",				
					'update_timestamp' => $current_datetime
				);

				$where = "transaction_number = '{$warehouse_request_code}'";
				$this->spare_parts_model->update_warehouse_reservation($data_reservation, $where);

			}
			
			$where = "warehouse_request_id = " . $warehouse_request_id;
			$this->spare_parts_model->update_warehouse_request($data, $where);
	
		}	

		$this->return_json("1","Successful Approval of Warehouse Request.",array("html" => $html, "title" => $title));

		return;	
	}




	
	public function download_check()
	{
		$start_date = trim($this->input->post("start_date"));
		$end_date = trim($this->input->post("end_date"));

		// check if start_date and end_date is null
		if (((empty($start_date)) && (empty($start_date))) || (($start_date == NULL) && ($start_date == NULL)))
		{
			$this->return_json("error","Enter both Start Date and End Date.");
			return;
		}

		if ((empty($start_date)) || ($start_date == NULL))
		{
			$this->return_json("error","Enter Start Date.");
			return;
		}

		if ((empty($end_date)) || ($end_date == NULL))
		{
			$this->return_json("error","Enter End Date.");
			return;
		}

		// check if start_date is greater than end_date
		if ($start_date > $end_date)
		{
			$this->return_json("error","Start Date must not exceed End Date.");
			return;
		}

		$current_date = date("Y-n-j");


		// start date must not exceed the current date
		if ($start_date > $current_date)
		{
			$this->return_json("error","Start Date must not exceed Current Date.");
			return;
		}

		$proper_start_date = date('F d, Y', strtotime($start_date));
		$proper_end_date = date('F d, Y', strtotime($end_date));

		// check if query will return records to execute
		$where = "insert_timestamp BETWEEN '$start_date' AND '$end_date'";

		$pending_count = $this->spare_parts_model->get_warehouse_request($where);

		if (empty($pending_count))
		{
			$return_html = "<span>No Dealer Request from <strong>{$proper_start_date}</strong> to <strong>{$proper_end_date}</strong>.</span>";
			$this->return_json("ok",$return_html);
			return;
		} else
		{
			$return_html = "<span>You are to generate a Dealer Requests Report ranging from <strong>{$proper_start_date}</strong> to <strong>{$proper_end_date}</strong>.<br/>Do you want to proceed?</span>";
			$this->return_json("ok",$return_html);
			return;
		}
	}

	public function download_proceed()
	{
		$start_date = trim($this->input->post("start_date"));
		$end_date = trim($this->input->post("end_date"));
		
		$current_timestamp = date('Y-m-d H:i:s');

		$return_html = "<span>Request Completed.<br/><br/>You may now download the generated spreadsheet file.</span>";

		$this->return_json("ok",$return_html);
		return;

	}

	function export_xls($start_date,$end_date)
	{
		$this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
		
		try {
			
			// adjusting memory limit to accomodate PHPExcel processing 
			set_time_limit(0); // eliminating the timeout
			ini_set('memory_limit', '512M');

	        $objPHPExcel = new PHPExcel();
	        $objPHPExcel->getProperties()->setTitle("dealer requests")->setDescription("none");
			$start_column_num = 3;

			$worksheet = $objPHPExcel->setActiveSheetIndex(0);

			$where = "insert_timestamp BETWEEN '$start_date' AND '$end_date'";
			$warehouse_request_count = $this->spare_parts_model->get_warehouse_request_count($where);

			$filename = "warehouse_requests_" . str_replace("-", "", $start_date) . "-" . str_replace("-", "", $end_date) . ".xls";

			//set width of first column
			$worksheet->getColumnDimension('A')->setWidth(12.00);

			// set column header to bold
			$worksheet->getStyle('A1')->getFont()->setBold(true);
			$worksheet->getStyle('A' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('B' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('C' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('D' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('E' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('F' . $start_column_num)->getFont()->setBold(true);
			$worksheet->getStyle('G' . $start_column_num)->getFont()->setBold(true);

			//center column names
			$worksheet->getStyle('A' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('B' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('C' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('D' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('E' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('F' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$worksheet->getStyle('G' . $start_column_num)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);			
			
			//set column names
			$worksheet->setCellValue('A1', "Dealer Requests from {$start_date} to {$end_date}");
			$worksheet->setCellValue('A' . $start_column_num, 'Request Code');
			$worksheet->setCellValue('B' . $start_column_num, 'Status');
			$worksheet->setCellValue('C' . $start_column_num, 'Dealer ID');
			$worksheet->setCellValue('D' . $start_column_num, 'Agent ID');
			$worksheet->setCellValue('E' . $start_column_num, 'PO Number');
			$worksheet->setCellValue('F' . $start_column_num, 'Remarks');
			$worksheet->setCellValue('G' . $start_column_num, 'Date Created');
			

			$row = 4;

			$allowed_rows = 5000;

			for($prow = 0;$prow < ceil($warehouse_request_count/$allowed_rows)+1; $prow++)
			{
				$warehouse_requests = $this->spare_parts_model->get_warehouse_request($where, array('rows' => $allowed_rows, 'offset' => $prow*$allowed_rows), 'insert_timestamp ASC');

				foreach ($warehouse_requests as $dr)
				{

					$worksheet->setCellValue('A'. $row, $dr->request_code);
					$worksheet->setCellValue('A'. $row, $dr->status);
					$worksheet->setCellValue('C'. $row, $dr->dealer_id);
					$worksheet->setCellValue('D'. $row, $dr->agent_id);
					$worksheet->setCellValue('E'. $row, $dr->purchase_order_number);
					$worksheet->setCellValue('F'. $row, $dr->remarks);
					$worksheet->setCellValue('G'. $row, $dr->insert_timestamp);
					
					// auto resize columns
					$worksheet->getColumnDimension('A')->setAutoSize(false);
					$worksheet->getColumnDimension('B')->setAutoSize(true);
					$worksheet->getColumnDimension('C')->setAutoSize(true);
					$worksheet->getColumnDimension('D')->setAutoSize(true);
					$worksheet->getColumnDimension('E')->setAutoSize(true);
					$worksheet->getColumnDimension('F')->setAutoSize(true);
					$worksheet->getColumnDimension('G')->setAutoSize(true);
					$row++;
				}
			}

			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename='.$filename.'');
			header('Cache-Control: max-age=0');

			$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel5');
			$objWriter->save('php://output');
			exit(0);
			
		} catch (Exception $e) {
			exit($e->getMessage());
		}
	}

	public function reports()
	{
		$this->template->view('warehouse_request/reports');
	}

	public function add() 
	{
		$items = $this->spare_parts_model->get_item(null,null,"sku ASC");
		$items_array = array();
		
		foreach($items as $i)
		{
			$items_array[$i->item_id] = $i;
		}

		$motorcycle_brandmodel_details = $this->warehouse_model->get_motorcycle_brand_model_class_view('','', 'brand_name', 'brand_name, brand_name, model_name');
		
		$warehouse_details = $this->warehouse_model->get_warehouse("is_active = 1", '', '', 'warehouse_id, warehouse_name, description, manager_id_number, encoder_id_number');

		//$this->template->return_url = $return_url;
		$this->template->items = $items_array;
		$this->template->motorcycle_brandmodel_details = $motorcycle_brandmodel_details;
		$this->template->warehouse_details = $warehouse_details;
		$this->template->view('warehouse_request/add');
	}

	public function get_requester()
	{
		$search_key = $this->input->get_post('search_key');
		$search_key = trim($search_key);

		if (empty($search_key)) 
		{
			$this->return_json("error","Search key is empty.");
			return;
		}
		
		$keys = explode(" ", $search_key);
		$escape_keys = array();
		for ($i = 0; $i < count($keys); $i++)
			array_push($escape_keys, $this->human_relations_model->escape("%".$keys[$i]."%") );
			
		$where_first_name = implode(' OR first_name LIKE ', $escape_keys);
		$where_last_name = implode(' OR last_name LIKE ', $escape_keys);
		
		// check if its a string name or part of a name
		$escaped_search_key1 = $this->human_relations_model->escape($search_key);
		$escaped_search_key2 = $this->human_relations_model->escape('%'.$search_key.'%');
		$where = "((complete_name like {$where_first_name}) ".(count($keys) > 1 ? "AND" : "OR")." (complete_name like {$where_last_name})) OR id_number like {$escaped_search_key2}";
		$tmp_employees = $this->human_relations_model->get_employment_information_view($where, array('offset' => 0, 'rows' => 50), "id_number ASC, complete_name ASC");
		

		$employees = array();
		if (count($tmp_employees) == 0)
		{
			// if these is reached then nothing are found.
			$this->return_json("error","Not found.", array('employees' => $employees, 'keys' => $keys));
			return;
		}

		$tmp_position = $this->human_relations_model->get_position();
		$positions = array();
		foreach ($tmp_position as $item)
			$positions[$item->position_id] = $item;

		foreach ($tmp_employees as $mem)
		{
			
			$department_name = "N/A";	
			$position_name = "N/A";
			// get company and department
			$department_details = $this->human_relations_model->get_department_by_id($mem->department_id);
			if (!empty($department_details)) {
				$department_name = $department_details->department_name;
			}

			// get position
			$position_details = $this->human_relations_model->get_position_by_id($mem->position_id);
			if (!empty($position_details)) {
				$position_name = $position_details->position_name;
			}

			// is_employed
			if ($mem->is_employed == 1)
				$is_employed = "YES";
			else
				$is_employed = "NO";

			$employees[$mem->employment_information_id] = array(
				"employment_information_id" => $mem->employment_information_id,
				"id_number" => $mem->id_number,
				"complete_name" => strtoupper($mem->complete_name),
				"company_email_address" => $mem->company_email_address,
				"department_name" => $department_name,
				"position" => $position_name,
				"is_employed" => $is_employed,
			);
		}
			
		
		$this->return_json("ok","Ok.", array('employees' => $employees, 'keys' => $keys));
		return;
		
	}

	public function search_item()
	{
		$search_key = $this->input->get_post('search_key');
		$search_key = trim($search_key);
	
		if (empty($search_key)) 
		{
			$this->return_json("error","Item Name is empty.");
			return;
		}

		$keys = explode(" ", $search_key);
		for ($i = 0; $i < count($keys); $i++)
		{
			$escaped_keys[] = mysql_real_escape_string($keys[$i]);
		}

		$key_count = count($escaped_keys);  

		// get possible combinations
		$combinations = array();

		$this->load->library('Math_Combinatorics');
		$combinatorics = new Math_Combinatorics;
		foreach( range(1, count($escaped_keys)) as $subset_size ) {
    		foreach($combinatorics->permutations($escaped_keys, $subset_size) as $p) {
	  			$combinations[sizeof($p)-1][] = $p;
    		}
		}

		$combinations = array_reverse($combinations);

		// exact match search
		$has_exact = false;
		$tmp_items = array();

		foreach($combinations as $comb_group)
		{
			foreach($comb_group as $comb)
			{
				$name = strtoupper(join('', $comb));
				$sql = "
					SELECT * FROM `is_item_view` WHERE
					(REPLACE(`sku`,' ','') LIKE '%{$name}%') OR (REPLACE(`model_name`,' ','') LIKE '%{$name}%') OR (REPLACE(`description`,' ','') LIKE '%{$name}%') OR (REPLACE(`sku`,' ','') LIKE '%{$name}%') ORDER BY sku, description LIMIT 50;
				";
				$query = $this->db_spare_parts->query($sql);
				if(count($query->result_array()) > 0)
				{
					$tmp_items = $query->result_object();
					$has_exact = true;
					break;
				}
			}
			if($has_exact)
			{
				break;
			}
		}
		
		$return_items = array();

		if (count($tmp_items) == 0)
		{
			// if these is reached then nothing are found.
			$this->return_json("error","Not found.", array('items' => $return_items, 'keys' => $keys));
			return;
		}
		
		foreach ($tmp_items as $itm)
		{
			$return_items[$itm->item_id] = array(
				"item_id" => $itm->item_id,
				"sku" => $itm->sku,
				"brand_model" => $itm->brand_name . ' / ' . $itm->model_name,
				"description" => strtoupper($itm->description),
				"srp" => strtoupper($itm->srp),
				"warehouse_name" => strtoupper($itm->warehouse_name),
				"rack_location" => strtoupper($itm->rack_location),
				"bad_quantity" => $itm->bad_quantity,
				"good_quantity" => $itm->good_quantity,

			);
		}
		
		$this->return_json("ok","Ok.", array('items' => $return_items, 'keys' => $keys));
		return;

	}

	public function create_request()
	{
		$request_code = trim($this->input->post("request_code"));
		$item_id = abs($this->input->post("item_id"));
		$srp = abs($this->input->post("srp"));
		$discount = abs($this->input->post("discount"));
		$discount_amount = abs($this->input->post("discount_amount"));
		$good_quantity = abs($this->input->post("good_quantity"));
		$bad_quantity = abs($this->input->post("bad_quantity"));
		$remarks = trim($this->input->post("remarks"));
		$engine = trim($this->input->post("engine"));
		$chassis = trim($this->input->post("chassis"));
		$warehouse_id = abs($this->input->post("warehouse_id"));
		$brandmodel = trim($this->input->post("brandmodel"));
		$requester_id = trim($this->input->post("requester_id"));

		$has_error = 0;
		$good_error_message = "";
		$bad_error_message = "";

		if ($good_quantity == '')
			$good_quantity = 0;

		if ($bad_quantity == '')
			$bad_quantity = 0;

		if ($discount_amount == '')
			$discount_amount = 0.00;

		// check first if inventory is enough for the set quantities
		$item_details = $this->spare_parts_model->get_item_by_id($item_id);

		if (count($item_details) == 0) {
			$html = "<p>Error  Item not found in database.</p>";
			$title = "Error :: Item Not Found";

			$this->return_json("0","Item not found in DB", array("html" => $html, "title" => $title));	
			return;
		}

		if ($item_details->good_quantity < $good_quantity) {
			$has_error = 1;
			$good_error_message = "<p>Good Quantity is not enough. There are <strong>" . $item_details->good_quantity . "</strong> good quantities available.</p><br/>";
		}

		if ($item_details->bad_quantity < $bad_quantity) {
			$has_error = 1;
			$bad_error_message = "<p>Bad Quantity is not enough. There are <strong>" . $item_details->bad_quantity . "</strong> bad quantities available.</p><br/>";
		}

		if ($has_error == 1) {
			$html = $good_error_message . $bad_error_message;
			$title = "Error :: Not Enough Inventory";

			$this->return_json("0","Not Enough Inventory", array("html" => $html, "title" => $title));
			return;
		}

		// get year
		$dateyear = date("Y");
		$request_series = substr($dateyear, 2, 2);

		$module_code = $request_code;

		if (strlen($request_code) < 10)
		{

			$manager_id_number = 0;
			// get warehouse info from warehouse db
			$warehouse_details = $this->warehouse_model->get_warehouse_by_id($warehouse_id);
			if (count($warehouse_details)  > 0) {
				$manager_id_number = $warehouse_details->manager_id_number;
			}

			$motorcycle_brand_model_id = 0;
			// get motorcycle details from warehouse db
			$motorcycle_brandmodel_details = $this->warehouse_model->get_motorcycle_brand_model_class_view("CONCAT(brand_name, ' ', model_name) = '{$brandmodel}'");
			if (count($motorcycle_brandmodel_details)  > 0) {
				$motorcycle_brand_model_id = $motorcycle_brandmodel_details[0]->motorcycle_brand_model_id;
			}

			$sql = "INSERT INTO 
						is_warehouse_request 
						(
							`request_series`, 
							`request_number`, 
							`id_number`, 
							`warehouse_approved_by`, 
							`warehouse_id`, 
							`motorcycle_brand_model_id`, 
							`engine`, 
							`chassis`
						)
                    	(
                    	SELECT 
                    		'{$request_series}', 
                    		IFNULL(MAX(request_number) + 1, 1) AS request_number, 
                    		'{$requester_id}', 
                    		'{$manager_id_number}',
                            '{$warehouse_id}', 
                            '{$motorcycle_brand_model_id}', 
                            '{$engine}', 
                            '{$chassis}'
                    	FROM 
                    		is_warehouse_request
                    	WHERE 
                    		request_series = '{$request_series}' 
	                    ORDER BY 
	                    	request_number DESC
                    	)";

			$this->db_spare_parts->query($sql);	

			// get last insert id
			$sql = "SELECT LAST_INSERT_ID() AS last_id FROM is_warehouse_request";
			$query = $this->db_spare_parts->query($sql);
			$warehouse_request_id = $query->first_row();   	

			//var_dump($warehouse_request_id->last_id);

			// generate request code
			$sql = "SELECT 
						CONCAT('{$module_code}', '{$request_series}', '-', LPAD(request_number, 5, 0)) AS gen_code
					FROM
						is_warehouse_request		
                    WHERE 
                    	warehouse_request_id = " . $warehouse_request_id->last_id;

            $query = $this->db_spare_parts->query($sql);
			$request_code_details = $query->first_row();  

			$request_code = $request_code_details->gen_code; 		

			// update request_code
			$data_update = array(
					'request_code' => $request_code
				);
			$where_update = "warehouse_request_id = " . $warehouse_request_id->last_id;
			$this->spare_parts_model->update_warehouse_request($data_update, $where_update);

            //get department module id
            $department_module_details = $this->spare_parts_model->get_department_module_by_code($module_code);        
            
            $data_insert = array (
        		'branch_id' => 1,
        		'department_id' => $department_module_details->department_id,
        		'department_module_id' => $department_module_details->department_module_id,
        		'transaction_number' => $request_code,
        		'status' => 'PREPARING',
            );

         	$this->spare_parts_model->insert_warehouse_reservation($data_insert);

		} else {
			// get request_code
			// add items to the request_code
			// TODO !!!
		}	

		// total amount
		if ($discount_amount == 0) {
			$total_amount = $good_quantity * ($srp - ($srp * ($discount / 100)));
			$total_amount = $total_amount + ($bad_quantity  * ($srp - ($srp * ($discount / 100))));
		} else {
			$total_amount = $good_quantity * $discount_amount;
			$total_amount = $total_amount + ($bad_quantity * $discount_amount);
		}

		// add item to details table
		$data_insert = array(
				'warehouse_request_id' => $warehouse_request_id->last_id,
				'item_id' => $item_id,
				'srp' => $srp,
				'discount' => $discount,
				'discount_amount' => $discount_amount,
				'good_quantity' => $good_quantity,
				'bad_quantity' => $bad_quantity,
				'total_amount' => $total_amount,
				'remarks' => $remarks
			);

		$this->spare_parts_model->insert_warehouse_request_detail($data_insert);

		// deduct to warehouse
		$sql = "UPDATE 
					is_item 
				SET 
					good_quantity = good_quantity - {$good_quantity}, 
					bad_quantity = bad_quantity - {$bad_quantity} 
				WHERE 
					item_id = item_id";

		$this->db_spare_parts->query($sql);

		$html = "<p>Item with SKU <strong>" . $item_details->sku . "</strong> has been added successfully!</p>";
		$title = "Add Item :: Item Request";

		$this->return_json("1","Item Successfully Added", array("html" => $html, "title" => $title, "request_code" => $request_code));
		return;
	}	

	public function confirm_remove_item() {
		$request_code = $this->input->post("request_code");
		$item_id = $this->input->post("item_id");

		// get warehouse_request_id
		$warehouse_request_details = $this->spare_parts_model->get_warehouse_request_by_code($request_code);

		$item_view_details = $this->spare_parts_model->get_item_view_by_id($item_id);
		
		$title = "Delete Item :: [SKU] " . $item_view_details->sku;
		$html = "<p>You are about to delete an item from Request Code: <strong>" . $request_code . "</strong>. <br/>
					<label><strong>Model:</strong></label>&nbsp;&nbsp;" . $item_view_details->model_name . "
					<label><strong>Brand:</strong></label>&nbsp;&nbsp;" . $item_view_details->brand_name . "
					<label><strong>Description:</strong></label>&nbsp;&nbsp;" . $item_view_details->description . "
					<div id='reasonremarks-container'>
						<span><strong>Reason/Remarks:</strong></span></br>
						<input id='txt-remarks' style='width:400px;' maxlength='320' placeholder='Put remarks here...' /><br/>
						<span id='error-reasonremarks' style='color:red;display:none'>Remarks/Reason is required.</span>
					</div>	
					<br/>
					Do you want to continue?</p>";

		$this->return_json("1","Confirm Remove Item", array("html" => $html, "title" => $title, 'warehouse_request_id' => $warehouse_request_details->warehouse_request_id));
		return;
	}

	public function proceed_remove_item() {
		$warehouse_request_id = $this->input->post("warehouse_request_id");
		$item_id = $this->input->post("item_id");
		$remarks = $this->input->post("remarks");

		$where = "warehouse_request_id = '{$warehouse_request_id}' AND item_id = '{$item_id}'";
		$warehouse_request_detail = $this->spare_parts_model->get_warehouse_request_detail($where);



		$current_datetime = date('Y-m-d H:i:s');

		$complete_remarks = $warehouse_request_detail[0]->remarks . "[" . $current_datetime . "] " . $remarks . "\n";

		// update status to DELETED
		$data = array(
			'status' => 'DELETED',
			'remarks' => $complete_remarks,
			'update_timestamp' => $current_datetime
			);

		$this->spare_parts_model->update_warehouse_request_detail($data, $where);

		$html = "Item is now successfully removed from request.";
		$title = "Delete An Item :: Item Request";

		$this->return_json("1","Item Successfully Tagged as DELETED", array("html" => $html, "title" => $title));
		return;

	}
}
