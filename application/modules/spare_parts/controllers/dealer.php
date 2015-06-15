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
		$test_id = abs($this->input->get('test_id'));		

		//$db_spare_parts = $this->load->database('spare_parts', TRUE);

		//$query = $db_spare_parts->select('sku, good_quantity, bad_quantity')->get('is_item');
  		//var_dump($query);			

		$this->template->view('dealer/dashboard');
	}

	public function approval()
	{

		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));

		$search_url = "";
		$count_is = 0;
		$transfers = "";		
		$where = "status = 'FOR APPROVAL'";
		
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
	
			// change status to COMPLETED
			$current_datetime = date("Y-m-d H:i:s");
			
			if ($is_approved == 'no') {
				$new_remarks = "[" . $current_datetime . "] " . $remarks . "<br/>" . $dealer_request->remarks;

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

}


