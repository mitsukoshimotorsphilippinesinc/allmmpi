<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Delivery extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
	
		$this->load->model('dpr_model');
		$this->load->model('human_relations_model');
		$this->load->library('pager');				
		$this->load->helper("breadcrumb_helper");

	}

	public function index()
	{
		$this->listing();
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

		if (empty($search_status)) {			
			$where = "status IN ('COMPLETED', 'RECEIVED', 'RETURNED')";
		} else {

			if ($search_status == 'ALL') {
				$where = "status IN ('COMPLETED', 'RECEIVED', 'RETURNED')";
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
				'pagination_url' => "/dpr/delivery/listing/",
				'total_items' => $this->dpr_model->get_request_detail_count($where),
				'per_page' => 1,
				'uri_segment' => 4,
		);

		$this->pager->set_config($config);

		$request_detail = $this->dpr_model->get_request_detail($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");
		
		// search vars
		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		$this->template->request_detail = $request_detail;
		
		$this->template->view('delivery/listing');	
		
	}

	public function for_listing_confirm()
	{
		$request_detail_id = $this->input->post("request_detail_id");
		$request_code = $this->input->post("request_code");
		$listing_action = $this->input->post("listing_action");

		$request_detail_details = $this->dpr_model->get_request_detail_by_id($request_detail_id);

		if (empty($request_detail_details)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$request_code}].</p>";
			$title = "Error: Confirm";

			$this->return_json("0","Form Request not found in DB", array("html" => $html, "title" => $title));			

		} else {

			if ($listing_action == 'receive delivery') {
				$title = "Receive Delivery :: " . $request_code;
				$html = "You are about to receive the form delivery under Request Code: <strong>" . $request_code . "</strong>. Do you want to continue?";
			}

			if ($listing_action == 'return delivery') {
				$title = "Return Delivery :: " . $request_code;
				$html = "<p>You are about to return the form delivery under Request Code: <strong>" . $request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>Reason/Remarks:</strong></span></br>
								<input id='txt-remarks' style='width:400px;' maxlength='320' placeholder='Put remarks here...' /><br/>
								<span id='error-reasonremarks' style='color:red;display:none'>Remarks/Reason is required.</span>
							</div>	
							<br/>
							Do you want to continue?</p>";
			}

			$data = array (
				'request_detail_id' => $request_detail_id,
				'request_code' => $request_code,
				'listing_action' => $listing_action
				);	

			$this->return_json("1","Confirm Action of Warehouse Request.",array("html" => $html, "title" => $title, "data" => $data));
		
		}
		
		return;
	}

	public function for_listing_proceed()
	{
		$request_detail_id = $this->input->post("request_detail_id");
		$request_code = $this->input->post("request_code");
		$listing_action = $this->input->post("listing_action");
		$remarks =  $this->input->post("remarks");		
		
		$request_detail_details = $this->dpr_model->get_request_detail_by_id($request_detail_id);

		if (empty($request_detail_details)) {		
			$html = "<p>There is something wrong with this transaction [Request Code: {$request_code}].</p>";
			$title = "Error: Proceed";

			$this->return_json("0","Form Request not found in DB", array("html" => $html, "title" => $title));	
			
		} else {
	
			// change status to DENIED
			$current_datetime = date("Y-m-d H:i:s");
			
			if ($listing_action == 'return delivery') {
				$new_remarks = "[" . $current_datetime . "][" . $this->user->user_id . "] " .$remarks . "\n" . $request_detail_details->remarks;

				// from spare_parts helper
				$return_html = return_reserved_items($warehouse_request_code, 'CANCELLED', $remarks);

				$data = array(
					'status' => "RETURNED",					
					'remarks' => $new_remarks,
					'approve_timestamp' => $current_datetime
				);

				$html = "You have returned the form under Request Code: <strong>{$request_code}</strong>.";
				$title = "Return :: " . $request_code;	

			} else if ($listing_action == 'receive delivery') {

				// change status to FOR APPROVAL
				$data = array(
					'status' => "RECEIVED",
					'approved_by' => $this->user->user_id,					
					'approve_timestamp' => $current_datetime
				);

				// TODO: insert into inventory


				$html = "You have successfully filed the request for approval with Warehouse Request Code: <strong>{$warehouse_request_code}</strong>.";
				$title = "File For Approval :: " . $warehouse_request_code;
			
			}

			$where = "warehouse_request_id = " . $warehouse_request_id;
			$this->spare_parts_model->update_warehouse_request($data, $where);	
		}	

		$this->return_json("1","Successful Approval of Warehouse Request.",array("html" => $html, "title" => $title));

		return;	
	}
	
}