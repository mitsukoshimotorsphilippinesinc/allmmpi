<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Form_request extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('human_relations_model');
		$this->load->library('pager');
	}

	public function index()
	{

		$this->template->view('dashboard');
	}


	public function accountables()
	{

		$all_record = "";
		$where = "is_accountable = 1";
		$search_url = "";
		$search_status = trim($this->input->get("status_option"));
		$search_by = trim($this->input->get("txtsearch"));

		if (($search_status == "All") || ($search_status == "")){
			if (!($search_by) == ""){
				$where="request_code = '{$search_by}' and is_accountable = 1";	
			}
		}else{

			if (($search_by) == "") {
				$where="status = '{$search_status}' and is_accountable = 1";	
			}else{
				$where="status = '{$search_status}' and request_code = '{$search_by}' and is_accountable = 1";
			}
		}
		$config = array(
				'pagination_url' => "/dpr/form_request/accountables/",
				'total_items' => $this->dpr_model->get_request_summary_count($where),
				'per_page' => 10,
				'uri_segment' => 4,);
		
		$this->pager->set_config($config);
		
		$all_record = $this->dpr_model->get_request_summary($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");			

		
		$this->template->all_record = $all_record;

		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_url = $search_url;

		$this->template->view('form_request/request_accountable_form');	


	}

	public function non_accountables()
	{
		$all_record = "";
		$where = "is_accountable = 0";
		$search_url = "";
		$search_status = trim($this->input->get("status_option"));
		$search_by = trim($this->input->get("txtsearch"));

		//var_dump($search_status);
		if (($search_status == "All") || ($search_status == "")){
			if (!($search_by) == ""){
				$where="request_code = '{$search_by}' and is_accountable = 0";	
			}
		}else{

			if (($search_by) == "") {
				$where="status = '{$search_status}' and is_accountable = 0";	
			}else{
				$where="status = '{$search_status}' and request_code = '{$search_by}' and is_accountable = 0";
			}
		}
		
		$config = array(
				'pagination_url' => "/dpr/form_request/non_accountables/",
				'total_items' => $this->dpr_model->get_request_summary_count($where),
				'per_page' => 10,
				'uri_segment' => 4,);
		
		$this->pager->set_config($config);
		
		$all_record = $this->dpr_model->get_request_summary($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "insert_timestamp DESC");			

		
		$this->template->all_record = $all_record;

		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_url = $search_url;
		$this->template->view('form_request/request_non_accountable_form');	
	}

	public function add_new_accountables()
	{
		$this->template->view('form_request/add_request_accountable_form');	
	}

	public function add_new_non_accountables()
	{
		$this->template->view('form_request/add_request_non_accountable_form');	
	}

	public function add_new_item()
	{
		$branch_id = $this->input->post('branch_id');
		$last_serial_number = $this->input->post('last_serial_number');
		$form_id = $this->input->post('form_id');
		$quantity = $this->input->post('quantity');
		$printing_press_id = $this->input->post('printing_press_id');
		$request_code_current = trim($this->input->post('request_code'));
		
		if ($request_code_current==""){

			$current_year = date("Y");

			$current_year = substr($current_year, 2);

			$where = "request_year = {$current_year}";
			$request_summary_last = $this->dpr_model->get_request_summary($where,null,'request_series DESC');
			//var_dump($request_summary_last[0]->request_series);
			if (count($request_summary_last) <= 0){
				$request_series = 1;
			}else{
				$request_series = $request_summary_last[0]->request_series + 1;
			}

			$current_month_day = date("md");
			$request_code = "TRD" . $current_month_day . $current_year . "-" . str_pad($request_series, 3,"0",STR_PAD_LEFT);

			$data_summary=array(
			'request_year' => $current_year,
			'request_series' => $request_series,
			'request_code' => $request_code,
			'is_accountable' => "1"
			);
			$this->dpr_model->insert_request_summary($data_summary);
			$last_insert_id = $this->dpr_model->insert_id();
		}else{
			$request_code = $request_code_current;
			$where = "request_code = '{$request_code}'";
			$request_summary_info = $this->dpr_model->get_request_summary($where);
			$last_insert_id = $request_summary_info[0]->request_summary_id;
		}

		$data_detail=array(
			'branch_id' => $branch_id,
			'last_serial_number' => $last_serial_number,
			'form_id' => $form_id,
			'quantity' => $quantity,
			'printing_press_id' => $printing_press_id,
			'request_summary_id' => $last_insert_id
			);
		$this->dpr_model->insert_request_detail($data_detail);

		$this->return_json("1","Add new item successfully.",array('request_code' => $request_code));
	}

	public function refresh_list_details()
	{
		$request_code = $this->input->post('request_code');
		$where = "request_code = '{$request_code}'";
		$request_summary_last = $this->dpr_model->get_request_summary($where);
		//var_dump($request_summary_last[0]->request_summary_id);

		$where = "request_summary_id = '{$request_summary_last[0]->request_summary_id}'";
		$request_summary_last = $this->dpr_model->get_request_detail($where);

       	$html = "";


       	foreach ($request_summary_last as $rsl) {
       						$branch_id = $rsl->branch_id;
       						$form_type_id = $rsl->form_id;
       						$printing_press_id = $rsl->printing_press_id;
       						$request_detail_id = $rsl->request_detail_id;

       						$last_series = $rsl->last_serial_number;
       						$quantity = $rsl->quantity;
       						$status = $rsl->status;

							$branch_info = $this->human_relations_model->get_branch_by_id($branch_id);
							$form_info = $this->dpr_model->get_form_by_id($form_type_id);
							$printing_press_info = $this->dpr_model->get_printing_press_by_id($printing_press_id);
       					   

       					 	$html .= "<tr>			
								<td>{$branch_info->branch_name}</td>
								<td>{$branch_info->tin}</td>
								<td>{$form_info->name}</td>
								<td>{$last_series}</td>
								<td>{$form_info->pieces_per_booklet}</td>
								<td>{$quantity}</td>		
								<td>{$printing_press_info->complete_name}</td>
								<td>{$status}</td>
								<td><a class = 'btn delete_item' data = '{$request_detail_id}'>Delete</a></td>
				  			</tr>";			

       					};
       					
       					$this->return_json("1","Add new item successfully.",array('html' => $html));
       			
	}

	public function delete_item()
	{
		$request_detail_id = $this->input->post('request_detail_id');
		
		$where = "request_detail_id = '{$request_detail_id}'";
		$delete_item = $this->dpr_model->delete_request_detail($where);

		$this->return_json("1","Delete Item Successfully.");
	}

	public function refresh_list_details_na()
	{
		$request_code = $this->input->post('request_code');
		$where = "request_code = '{$request_code}'";
		$request_summary_last = $this->dpr_model->get_request_summary($where);

		$where = "request_summary_id = '{$request_summary_last[0]->request_summary_id}'";
		$request_summary_last = $this->dpr_model->get_request_detail($where);

       	$html = "";


       	foreach ($request_summary_last as $rsl) {
       						$form_type_id = $rsl->form_id;
       						$printing_press_id = $rsl->printing_press_id;
       						$request_detail_id = $rsl->request_detail_id;

       						$last_series = $rsl->last_serial_number;
       						$quantity = $rsl->quantity;
       						$status = $rsl->status;

							$form_info = $this->dpr_model->get_form_by_id($form_type_id);
							$printing_press_info = $this->dpr_model->get_printing_press_by_id($printing_press_id);
       					   

       					 	$html .= "<tr>			
								<td>{$form_info->name}</td>
								<td>{$last_series}</td>
								<td>{$form_info->pieces_per_booklet}</td>
								<td>{$quantity}</td>		
								<td>{$printing_press_info->complete_name}</td>
								<td>{$status}</td>
								<td><a class = 'btn delete_item' data = '{$request_detail_id}'>Delete</a></td>
				  			</tr>";			

       					};
       					
       					$this->return_json("1","Add new item successfully.",array('html' => $html));
       			
	}

	public function add_new_item_na()
	{
		$last_serial_number = $this->input->post('last_serial_number');
		$form_id = $this->input->post('form_id');
		$quantity = $this->input->post('quantity');
		$printing_press_id = $this->input->post('printing_press_id');
		$request_code_current = trim($this->input->post('request_code'));
		
		if ($request_code_current==""){

			$current_year = date("Y");

			$current_year = substr($current_year, 2);

			$where = "request_year = {$current_year}";
			$request_summary_last = $this->dpr_model->get_request_summary($where,null,'request_series DESC');
			//var_dump($request_summary_last[0]->request_series);
			if (count($request_summary_last) <= 0){
				$request_series = 1;
			}else{
				$request_series = $request_summary_last[0]->request_series + 1;
			}

			$current_month_day = date("md");
			$request_code = "TRD" . $current_month_day . $current_year . "-" . str_pad($request_series, 3,"0",STR_PAD_LEFT);

			$data_summary=array(
			'request_year' => $current_year,
			'request_series' => $request_series,
			'request_code' => $request_code,
			'is_accountable' => "0"
			);
			$this->dpr_model->insert_request_summary($data_summary);
			$last_insert_id = $this->dpr_model->insert_id();
		}else{
			$request_code = $request_code_current;
			$where = "request_code = '{$request_code}'";
			$request_summary_info = $this->dpr_model->get_request_summary($where);
			$last_insert_id = $request_summary_info[0]->request_summary_id;
		}

		$data_detail=array(
			'last_serial_number' => $last_serial_number,
			'form_id' => $form_id,
			'quantity' => $quantity,
			'printing_press_id' => $printing_press_id,
			'request_summary_id' => $last_insert_id
			);
		$this->dpr_model->insert_request_detail($data_detail);

		$this->return_json("1","Add new item successfully.",array('request_code' => $request_code));
	}

}	