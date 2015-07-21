<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Spare_parts extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
	
		$this->load->model('spare_parts_model');
		$this->load->model('human_relations_model');	

		$this->db_spare_parts = $this->load->database('spare_parts', TRUE);	
	}

	public function index()
	{
		
		$this->template->view('dashboard');
	}

	public function dashboard_figures()
	{
		
		// critical item count
		$where = "limit_status = 'CRITICAL'";
		$critical_parts_count = $this->spare_parts_model->get_spare_part_stock_level_view_count($where);

		// reserved items count
		$pending_reservation_count = $this->spare_parts_model->get_pending_warehouse_reservations_count();

		$data = array(
			'critical_parts_count' => $critical_parts_count,
			'pending_reservation_count' => $pending_reservation_count
		);
	
		$html = $this->load->view("dashboard_figures",$data,true);

		$this->return_json("1","Display Dashboard Figures", array("html" => $html));	

		return;	
	}

	public function warehouse_critical_inventory()
	{

		$where = "limit_status = 'CRITICAL'";
		// get total records
		$critical_parts_count = $this->spare_parts_model->get_spare_part_stock_level_view_count($where);

		$critical_parts_details = $this->spare_parts_model->get_spare_part_stock_level_view($where, array('rows' => 10, 'offset' => 0), '(stock_limit - good_quantity), description');

		$data = array(
			'critical_parts_details' => $critical_parts_details,
			'critical_parts_count' => $critical_parts_count
		);
	
		$html = $this->load->view("warehouse_critical_inventory",$data,true);

		$this->return_json("1","Display Warehouse Critical Inventory", array("html" => $html));	

		return;	
	}

	public function pending_reservations()
	{
	
		$pending_reservations_count = $this->spare_parts_model->get_pending_warehouse_reservations_count();

		$where = "ORDER BY insert_timestamp DESC LIMIT 20";
		$pending_reservations_details = $this->spare_parts_model->get_pending_warehouse_reservations($where);

		$data = array(
			'pending_reservations_details' => $pending_reservations_details,
			'pending_reservations_count' => $pending_reservations_count
		);
	
		$html = $this->load->view("pending_reservations",$data,true);

		$this->return_json("1","Display Pending Reservations", array("html" => $html));	

		return;	
	}
	
	public function pie_chart()
	{
	
		$data = array(
			);

		$html = $this->load->view("pie_chart",$data,true);

		$this->return_json("1","Display Pie Chart", array("html" => $html));	

		return;	
	}
	
	public function display_mtr($request_code) 
	{
		$this->load->library('mpdf60/mpdf');
		
		$module_code = substr($request_code, 0, 2);

		// get segment name
		$department_module_details = $this->spare_parts_model->get_department_module_by_code($module_code);

		// request_summary
		$request_summary_sql = "SELECT a." . $department_module_details->segment_name . "_id as id, a.* FROM
								is_" . $department_module_details->segment_name . " a
							WHERE
							a.request_code = '" . $request_code . "'";

		$request_summary = $this->db_spare_parts->query($request_summary_sql);
		$request_summary = $request_summary->result();		
		$request_summary = $request_summary[0];				
		
		// get request details
		$request_details_sql = "SELECT * FROM
									is_" . $department_module_details->segment_name . "_detail
								WHERE
								" . $department_module_details->segment_name . "_id = '" . $request_summary->id . "'";
		
		$request_details = $this->db_spare_parts->query($request_details_sql);
		$request_details = $request_details->result();								
	
		// get total amount and total quantity
		$total_quantity_amount_sql = "SELECT 
											(SUM(good_quantity) + SUM(bad_quantity)) AS total_items, (SUM(total_amount)) AS total_amount
										FROM 
											is_" . $department_module_details->segment_name . "_detail 
										WHERE " . $department_module_details->segment_name . "_id = " . $request_summary->id . " AND status NOT IN ('CANCELLED', 'DELETED')";

		$total_quantity_amount = $this->db_spare_parts->query($total_quantity_amount_sql);
		$total_quantity_amount = $total_quantity_amount->result();						
		$total_quantity_amount = $total_quantity_amount[0];
		
		$where = "id_number IN (LPAD('" . $request_summary->approved_by . "', 7, 0), LPAD('" . $request_summary->warehouse_approved_by . "', 7, 0))";
		$approvals = $this->human_relations_model->get_employment_information_view($where);

		// get requester details
		$requester = $this->human_relations_model->get_employment_information_view_by_id($request_summary->id_number);

		$warehouse = $this->spare_parts_model->get_warehouse_by_id($request_summary->warehouse_id);

		$data = array(
				'copy' => 'Original',
				'request_code' => $request_code,
				'requester' => $requester,
				'request_summary' => $request_summary,
				'request_details' => $request_details,
				'warehouse' => $warehouse,
				'total_quantity' => $total_quantity_amount->total_items,
				'total_amount' => $total_quantity_amount->total_amount,
				'approvals' => $approvals,
			);

		$this->mpdf->WriteHTML($this->load->view('mtr_pdf_view',$data,TRUE));			
		$this->mpdf->AddPage();
		$data['copy'] = 'Duplicate';
		$this->mpdf->WriteHTML($this->load->view('mtr_pdf_view',$data,TRUE));
		$this->mpdf->AddPage();
		$data['copy'] = 'Triplicate';
		$this->mpdf->WriteHTML($this->load->view('mtr_pdf_view',$data,TRUE));
		$this->mpdf->Output($request_code, 'I');
		
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
			$where = "status IN ('FOR APPROVAL', 'APPROVED')";
		} else {

			if ($search_status == 'ALL') {
				$where = "status IN ('FOR APPROVAL', 'APPROVED')";
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