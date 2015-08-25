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
			

			if ($search_by == 'code')	{
				$request_summary_details = $this->dpr_model->get_request_summary_by_request_code($search_text);

				// TODO:::!!!

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
				'per_page' => 5,
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
				$html = "<p>You are about to receive the form delivery under Request Code: <strong>" . $request_code . "</strong>. <br/>
							<div id='reasonremarks-container'>
								<span><strong>Remarks:</strong></span></br>
								<input id='txt-remarks' style='width:400px;' maxlength='320' placeholder='Put remarks here...' /><br/>								
							</div>	
							<br/>
							Do you want to continue?</p>";
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
	
			$new_remarks = "";
			// change status to DENIED
			$current_datetime = date("Y-m-d H:i:s");
			$new_remarks = "[" . $current_datetime . "][" . $this->user->user_id . "] " .$remarks . "\n" . $request_detail_details->remarks;

			if ($listing_action == 'return delivery') {				

				$data = array(
					'status' => "RETURNED",					
					'remarks' => $new_remarks,
					'update_timestamp' => $current_datetime
				);

				$html = "You have returned the form under Request Code: <strong>{$request_code}</strong>.";
				$title = "Return :: " . $request_code;	

			} else if ($listing_action == 'receive delivery') {			

				$branch_rack_location_details = $this->dpr_model->get_branch_rack_location_by_branch_id($request_detail_details->branch_id);

				if (empty($branch_rack_location_details)) {
					$html = "There is something wrong with the form request under Request Code: <strong>{$request_code}</strong>.";
					$title = "Form Received Error :: " . $request_code;

					$this->return_json("0", "Branch Rack Location not found.", array("html" => $html, "title" => $title));
					return;						

				} else {				

					$booklet_data = array(
						'request_detail_id' => $request_detail_id,
						'branch_id' => $request_detail_details->branch_id,
						'branch_rack_location_id' => $branch_rack_location_details->branch_rack_location_id, 
						'booklet_number' => '',
						'series_from' => 1,
						'series_to' => 1,
						'receive_timestamp' => $request_detail_details->date_delivered,
						'receive_remarks' => $new_remarks,
					);

					$this->dpr_model->insert_booklet($booklet_data);

					// change status to FOR APPROVAL
					$data = array(
						'status' => "RECEIVED",	
						'remarks' => $new_remarks,				
						'update_timestamp' => $current_datetime
					);

					$where = "request_detail_id = " . $request_detail_id;
					$this->dpr_model->update_request_detail($data, $where);	


					// check if all forms in request are all RECEIVED
					$where = "status IN ('COMPLETED', 'RETURNED')";
					$request_detail_count = $this->dpr_model->get_request_detail_count($where);

					if ($request_detail_count == 0) {
						// update overall status
						$data_update = array(
								'status' => 'RECEIVED',
								'update_timestamp' => date("Y-m-d H:i:s")
							);
						$this->dpr_model->update_request_summary($data, $where);
					}
				}

				$html = "You have successfully processed a form request under Request Code: <strong>{$request_code}</strong>.";
				$title = "Form Recieved :: " . $request_code;
			
			}		
		}	

		$this->return_json("1","Processed Form Request.",array("html" => $html, "title" => $title));

		return;	
	}	
	
}