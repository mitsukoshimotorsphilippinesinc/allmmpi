<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dealer extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
	
		$this->load->model('spare_parts_model');
		$this->load->library('pager');		
	}

	public function index()
	{
		//$test_id = abs($this->input->get('test_id'));		

		//$db_spare_parts = $this->load->database('spare_parts', TRUE);

		//$query = $db_spare_parts->select('sku, good_quantity, bad_quantity')->get('is_item');
  		//var_dump($query);			

		$this->template->view('dealer/dashboard');
	}

	public function approval()
	{

		$search_status = trim($this->input->get("search_status"));
		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));

		$search_url = "";
		$count_is = 0;
		$transfers = "";		

		if (empty($search_status)) {
			$where = NULL;
		} else {

			if ($search_status == 'ALL') {
				$where = NULL;
			} else {
				$where = "status = '". $search_status ."'";
			}
					
			if ($where != NULL) {
				$where = $where . " AND ". $search_by ." LIKE '%" . $search_text . "%'";
			} else {
				$where = $search_by ." LIKE '%" . $search_text . "%'";
			}
		}

		// set pagination data
		$config = array(
				'pagination_url' => "/spare_parts/dealer/approval/",
				'total_items' => $this->spare_parts_model->get_dealer_request_count($where),
				'per_page' => 10,
				'uri_segment' => 4,
		);

		$this->pager->set_config($config);

		$transfers = $this->spare_parts_model->get_dealer_request($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");			
		
		// search vars
		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		$this->template->transfers = $transfers;
		
		$this->template->view('dealer/approval');	
		

	}	


	public function for_approval_confirm()
	{
		$dealer_request_id = $this->input->post("dealer_request_id");
		$dealer_request_code = $this->input->post("dealer_request_code");
		$is_approved = $this->input->post("is_approved");

		$dealer_request = $this->spare_parts_model->get_dealer_request_by_id($dealer_request_id);
	
		if (empty($dealer_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$dealer_request_code}].</p>";
			$title = "Error: Confirm Approval";

			$this->return_json("0","Dealer Request Code not found in DB", array("html" => $html, "title" => $title));			

		} else {

			if ($is_approved == 'yes') {

				$html = "You are about to approve the Dealer Request with Request Code: <strong>" . $dealer_request_code . "</strong>. Do you want to continue?";
			} else {
				$html = "<p>You are about to deny the Dealer Request with Request Code: <strong>" . $dealer_request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>Reason/Remarks:</strong></span></br>
								<input id='txt-remarks' style='width:400px;'/><br/>
								<span id='error-reasonremarks' style='color:red;display:none'>Remarks/Reason is required.</span>
							</div>	
							<br/>
							Do you want to continue?</p>";
			}	

			$title = "Confirm Approval :: " . $dealer_request_code;
				
			$data = array (
				'dealer_request_id' => $dealer_request_id,
				'dealer_request_code' => $dealer_request_code,
				'is_approved' => $is_approved
				);	

			$this->return_json("1","Confirm Approval of Dealer Request.",array("html" => $html, "title" => $title, "data" => $data));
		
		}
		
		return;
	}
	
	public function for_approval_proceed()
	{
		$dealer_request_id = $this->input->post("dealer_request_id");
		$dealer_request_code = $this->input->post("dealer_request_code");
		$is_approved = $this->input->post("is_approved");
		$remarks =  $this->input->post("remarks");
		
		$dealer_request = $this->spare_parts_model->get_dealer_request_by_id($dealer_request_id);		

		if (empty($dealer_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$dealer_request_code}].</p>";
			$title = "Error: Proceed Approval";

			$this->return_json("0","Dealer Request Code not found in DB", array("html" => $html, "title" => $title));	
			
		} else {
	
			// change status to DENIED
			$current_datetime = date("Y-m-d H:i:s");
			
			if ($is_approved == 'no') {
				$new_remarks = "[" . $current_datetime . "] " . $remarks . "\n" . $dealer_request->remarks;

				$data = array(
					'status' => "DENIED",
					'approved_by' => $this->user->user_id,
					'remarks' => $new_remarks,
					'approve_timestamp' => $current_datetime
				);

				$html = "You have denied the Dealer Request Code: <strong>{$dealer_request_code}</strong>.";
				$title = "Denied :: " . $dealer_request_code;

				$this->return_json("1","Denied Dealer Request.",array("html" => $html, "title" => $title));		

			} else {
				// change status to APPROVED
				$data = array(
					'status' => "APPROVED",
					'approved_by' => $this->user->user_id,					
					'approve_timestamp' => $current_datetime
				);

				$html = "You have successfully approved the Dealer Request Code: <strong>{$dealer_request_code}</strong>.";
				$title = "Approved :: " . $dealer_request_code;
			}
			
			$where = "dealer_request_id = " . $dealer_request_id;
			$this->spare_parts_model->update_dealer_request($data, $where);
			
			$this->return_json("1","Successful Approval of Dealer Request.",array("html" => $html, "title" => $title));
						
		}	
		return;	
	}


	public function view_details()
	{
		$dealer_request_id = $this->input->post("dealer_request_id");
		$dealer_request_code = $this->input->post("dealer_request_code");
			
		$dealer_request = $this->spare_parts_model->get_dealer_request_by_id($dealer_request_id);		

		if (empty($dealer_request)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$dealer_request_code}].</p>";
			$title = "Error: View Details";

			$this->return_json("0","Dealer Request Code not found in DB", array("html" => $html, "title" => $title));	
			
		} else {
		
			$data = array(
				'dealer_request' => $dealer_request
			);
		
			$html = $this->load->view("dealer/view_details",$data,true);
			 
			$title = "View Details :: " . $dealer_request_code;
			$this->return_json("1","View Details Dealer Request", array("html" => $html, "title" => $title));
			
		}
			
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

		$pending_count = $this->spare_parts_model->get_dealer_request($where);

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
			$dealer_request_count = $this->spare_parts_model->get_dealer_request_count($where);

			$filename = "dealer_requests_" . str_replace("-", "", $start_date) . "-" . str_replace("-", "", $end_date) . ".xls";

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

			for($prow = 0;$prow < ceil($dealer_request_count/$allowed_rows)+1; $prow++)
			{
				$dealer_requests = $this->spare_parts_model->get_dealer_request($where, array('rows' => $allowed_rows, 'offset' => $prow*$allowed_rows), 'insert_timestamp ASC');

				foreach ($dealer_requests as $dr)
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

}
