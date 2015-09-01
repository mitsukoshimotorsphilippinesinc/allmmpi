<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Maintenance extends Admin_Controller {

	private $_branch_rack_location_validation_rule = array(		
		array(
			'field' => 'rack_location',
			'label' => 'Rack Location',
			'rules' => 'trim|required'
		),		
		array(
			'field' => 'is_active',
			'label' => 'Is Active',
			'rules' => 'trim|required'
		)
	);

	function __construct()
	{
		parent::__construct();		
		$this->load->model('dpr_model');
		$this->load->library('pager');			
		$this->load->helper("breadcrumb_helper");	

		$this->db_dpr = $this->load->database('dpr', TRUE);

	}

	public $segment_name = "maintenance";

	public function index()
	{
		$this->template->view('maintenance/dashboard');
	}

	// AGENTS
	// ------------------------------------------
	public function branch_rack_location()
	{
		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));
		$where = "(is_deleted = 0 OR is_deleted IS NULL OR TRIM(is_deleted) = '')";

		$search_url = "";

		if (($search_text == "") || empty($search_text)) {
			$where .= "";			
		} else {
			$where .= " AND {$search_by} LIKE LOWER('%{$search_text}%')";
			$search_url = "?search_option=" . $search_by . "&search_string=" . $search_text;
		}	


		// set pagination data
		$config = array(
		    'pagination_url' => '/dpr/maintenance/branch_rack_location/',
		    'total_items' => $this->dpr_model->get_branch_rack_location_view_count($where),
		    'per_page' => 10,
		    'uri_segment' => 4,
		);	

		// search vars
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		
		
		$this->pager->set_config($config);
		$this->template->branch_rack_locations = $this->dpr_model->get_branch_rack_location_view($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), 'branch_id');
		
		$this->template->view('maintenance/branch_rack_location/list');
	}

	public function edit_branch_rack_location($branch_id = 0)
	{

		// check first if branch is in rf_branch_rack_location
		$branch_rack_location_details = $this->dpr_model->get_branch_rack_location_by_id($branch_id);

		$branch_rack_location_view_details = $this->dpr_model->get_branch_rack_location_view_by_branch_id($branch_id);

		if ($_POST and !empty($branch_rack_location_view_details))
		{
			// post done here
			$this->form_validation->set_rules($this->_branch_rack_location_validation_rule);

			if ($this->form_validation->run())
			{				
				// insert the new results
				$data = array(					
					'branch_id' => $branch_id,
					'rack_location' => strtoupper(set_value('rack_location')),
					'is_active' => set_value('is_active'),
				);


				if (empty($branch_rack_location_details)) {
					$this->dpr_model->insert_branch_rack_location($data);
					$id = $this->dpr_model->insert_id();
				} else {
					$this->dpr_model->update_branch_rack_location($data, array('branch_id' => $branch_id));
					$id = $branch_rack_location_details->branch_rack_location_id;
				}	
				
				//logging of action
				$details_before = array('branch_rack_location_id' => $id, 'details' => array());
				$details_after = array('branch_rack_location_id' => $id, 'details' => array());
				
				foreach($data as $k => $v)
				{

					if (!empty($branch_rack_location_details)) {
						if($branch_rack_location_details->$k != $v)
						{
							$details_before['details'][$k] = $branch_rack_location_details->$k;
						}
					}
					
					$details_after['details'][$k] = $v;
					
				}
				$details_before = json_encode($details_before);
				$details_after = json_encode($details_after);

				$at_data = array(
					'id_number' => $this->user->user_id,
					'module_name' => 'Maintenance',
					'submodule_name' => 'Branch Rack Location',
					'table_name' => 'rf_branch_rack_location',						
					'details_before' => $details_before,
					'details_after' => $details_after,
					'remarks' => "",
				);

				if (empty($branch_rack_location_details)) {
					$at_data['action'] = 'INSERT BRANCH RACK LOCATION';
				} else {
					$at_data['action'] = 'UPDATE BRANCH RACK LOCATION';					
				}

				$this->dpr_model->insert_log($at_data);
								
				redirect('/dpr/maintenance/branch_rack_location');
				return;
			}
		}

		$this->template->branch_rack_location_view_details = $branch_rack_location_view_details;
		$this->template->view('dpr/maintenance/branch_rack_location/edit');

	}

	public function delete_branch_rack_location($branch_id = 0)
	{
		
		$branch_rack_location_details = $this->dpr_model->get_branch_rack_location_by_id($branch_id);
		$branch_rack_location_view_details = $this->dpr_model->get_branch_rack_location_view_by_branch_id($branch_id);

		if ($_POST and !empty($branch_rack_location_details))
		{
			$_branch_id = $this->input->post('branch_id');
			if (!empty($_branch_id)) if ($_branch_id == $branch_id)
			{
				
				$this->dpr_model->delete_branch_rack_location($update_data, "branch_id = '{$branch_id}'");
				
				//logging of action
				$details_before = array('id' => $branch_id, 'details' => $branch_rack_location_details);
				$details_before = json_encode($details_before);
				
				$at_data = array(
					'id_number' => $this->user->user_id,
					'module_name' => 'Maintenance',
					'submodule_name' => 'Branch Rack Location',
					'table_name' => 'rf_branch_rack_location',
					'action' => 'DELETE BRANCH RACK LOCATION',
					'details_before' => $details_before,
					'remarks' => "",
				);

				$this->dpr_model->insert_log($at_data);
				
				redirect('/dpr/maintenance/branch_rack_location');
				return;
			}
		}

		$this->template->branch_rack_location_view_details = $branch_rack_location_view_details;
		$this->template->view('dpr/maintenance/branch_rack_location/delete');

	}

	public function view_branch_rack_location($branch_id = 0)
	{
		$branch_rack_location_view_details = $this->dpr_model->get_branch_rack_location_view_by_branch_id($branch_id);

		$this->template->branch_rack_location_view_details = $branch_rack_location_view_details;
		$this->template->view('dpr/maintenance/branch_rack_location/view');

	}

	public function form_type()
	{
		$all_record = "";
		$where = "";
		$search_url = "";
		$search_status = trim($this->input->get("accountable_option"));
		$search_by = trim($this->input->get("form_name"));

		if ($search_status == "All") {
			if (!($search_by) == ""){
				$where = "is_deleted = 0 and name = '{$search_by}'";	
			}else{
				$where = "";
			}
		}else if ($search_status == "Accountable") {
			if (!($search_by) == ""){
				$where = "is_deleted = 0 and is_accountable = 1 and name = '{$search_by}'";	
			}else{
				$where = "is_deleted = 0 and is_accountable = 1";
			}
		}else if ($search_status == "Non-Accountable"){
			if (!($search_by) == ""){
				$where = "is_deleted = 0 and is_accountable = 0 and name = '{$search_by}'";	
			}else{
				$where = "is_deleted = 0 and is_accountable = 0";
			}
		}

		$config = array(
				'pagination_url' => "/dpr/maintenance/form_type/",
				'total_items' => $this->dpr_model->get_form_type_count($where),
				'per_page' => 10,
				'uri_segment' => 4,);
		
		$this->pager->set_config($config);
		
		$all_record = $this->dpr_model->get_form_type($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "form_type_id ASC");

		$this->template->all_record = $all_record;
		
		$this->template->search_status = $search_status;
		$this->template->search_by = $search_by;
		$this->template->search_url = $search_url;

		$this->template->view('dpr/maintenance/forms/form_type');

	}
	
	public function delete_form_type_update()
	{
		$form_type_id = $this->input->post('form_type_id');
		//var_dump($form_type_id);
		$where = "form_type_id = '{$form_type_id}'";
		$data = array(
			'is_deleted' => 1);

		$this->dpr_model->update_form_type($data,$where);	
		
		$this->return_json("1","Delete Successfully");
	}

	public function de_activate_form_type_update()
	{
		$form_type_id = $this->input->post('form_type_id');
		$where = "form_type_id = '{$form_type_id}'";
		$data = array(
			'is_active' => 0);

		$this->dpr_model->update_form_type($data,$where);	
		
		$this->return_json("1","De-Activate Successfully");
	}

	public function activate_form_type_update()
	{
		$form_type_id = $this->input->post('form_type_id');
		$where = "form_type_id = '{$form_type_id}'";
		$data = array(
			'is_active' => 1);

		$this->dpr_model->update_form_type($data,$where);	
		
		$this->return_json("1","Activate Successfully");
	}

	public function form_type_update()
	{
		$form_type_id = $this->input->post('form_type_id');
		$form_name = $this->input->post('form_name_val');
		$form_code = $this->input->post('form_code_val');
		$form_description = $this->input->post('form_description_val');
		$form_pieces = $this->input->post('form_pieces_val');
		$form_remarks = $this->input->post('form_remarks_val');
		$class_option = $this->input->post('class_option_number');
		

		$where = "form_type_id = '{$form_type_id}'";
		$currentdatetime = date("Y-m-d H:i:s");
		$data = array(
			'update_timestamp' => $currentdatetime, 'name' => $form_name,'code' => $form_code,'description' => $form_description,'pieces_per_booklet' => $form_pieces,'remarks' => $form_remarks,'is_accountable' => $class_option);

		$this->dpr_model->update_form_type($data,$where);	
		
		$this->return_json("1","Update Successfully");
	}

	public function view_edit_form($form_type_id = 0)
	{
		$record_summary = $this ->dpr_model->get_form_type_by_id($form_type_id);
		$this->template->record_summary = $record_summary;

		$this->template->view('dpr/maintenance/forms/edit_form');
	}

	public function add_new_form()
	{
		$this->template->view('dpr/maintenance/forms/add_form');	
	}

	public function insert_new_form_type()
	{
		$form_name = $this->input->post('form_name');
		$form_code = $this->input->post('form_code');
		$form_description = $this->input->post('form_description');
		$class_option = $this->input->post('class_option');
		$form_pieces = $this->input->post('form_pieces');
		$form_remarks = $this->input->post('form_remarks');

		$data_form=array(
			'name' => $form_name,
			'code' => $form_code,
			'description' => $form_description,
			'is_accountable' => $class_option,
			'pieces_per_booklet' => $form_pieces,
			'remarks' => $form_remarks
			);

		$this->dpr_model->insert_form_type($data_form);

		$this->return_json("1","Add new Form successfully...");
	}

	public function printing_press()
	{
		$all_record = "";
		$where = "";
		$search_url = "";
		$search_by = trim($this->input->get("press_name"));

		if (!($search_by) == ""){
			$where = "is_deleted = 0 and complete_name = '{$search_by}'";
		}

		$config = array(
				'pagination_url' => "/dpr/maintenance/printing_press/",
				'total_items' => $this->dpr_model->get_printing_press_count($where),
				'per_page' => 10,
				'uri_segment' => 4,);

		$this->pager->set_config($config);
		
		$all_record = $this->dpr_model->get_printing_press($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "printing_press_id ASC");

		$this->template->all_record = $all_record;
		
		$this->template->search_by = $search_by;
		$this->template->search_url = $search_url;

		$this->template->view('dpr/maintenance/printing_press/printing_press');

	}

	public function delete_printing_press_update()
	{
		$printing_press_id = $this->input->post('printing_press_id');
		$where = "printing_press_id = '{$printing_press_id}'";
		$data = array(
			'is_deleted' => 1);
		$this->dpr_model->update_printing_press($data,$where);	
		
		$this->return_json("1","Delete Successfully");
	}

	public function activate_printing_press_update()
	{
		$printing_press_id = $this->input->post('printing_press_id');
		$where = "printing_press_id = '{$printing_press_id}'";
		$data = array(
			'is_active' => 1);
		$this->dpr_model->update_printing_press($data,$where);	
		
		$this->return_json("1","Activate Successfully");
	}

	public function de_activate_printing_press_update()
	{
		$printing_press_id = $this->input->post('printing_press_id');
		$where = "printing_press_id = '{$printing_press_id}'";
		$data = array(
			'is_active' => 0);
		$this->dpr_model->update_printing_press($data,$where);	
		
		$this->return_json("1","De-Activate Successfully");
	}

	public function add_new_printing_press()
	{
		$this->template->view('dpr/maintenance/printing_press/add_printing_press');	
	}

	public function insert_new_printing_press()
	{
		$printing_press_name = $this->input->post('printing_press_name');
		$printing_press_address = $this->input->post('printing_press_address');
		$printing_press_contact_number = $this->input->post('printing_press_contact_number');
		$printing_press_contact_person = $this->input->post('printing_press_contact_person');
		$printing_press_remarks = $this->input->post('printing_press_remarks');

		$data_press=array(
			'complete_name' => $printing_press_name,
			'complete_address' => $printing_press_address,
			'contact_number' => $printing_press_contact_number,
			'contact_person' => $printing_press_contact_person,
			'remarks' => $printing_press_remarks
			);

		$this->dpr_model->insert_printing_press($data_press);

		$this->return_json("1","Add new Printing Press successfully...");
	}

	public function view_edit_printing_press($printing_press_id = 0)
	{
		$record_summary = $this ->dpr_model->get_printing_press_by_id($printing_press_id);
		$this->template->record_summary = $record_summary;

		$this->template->view('dpr/maintenance/printing_press/edit_printing_press');
	}

	public function printing_press_update()
	{
		$printing_press_id = $this->input->post('printing_press_id');
		$printing_press_name = $this->input->post('printing_press_name');
		$printing_press_address = $this->input->post('printing_press_address');
		$printing_press_contact_person = $this->input->post('printing_press_contact_person');
		$printing_press_contact_number = $this->input->post('printing_press_contact_number');
		$printing_press_remarks = $this->input->post('printing_press_remarks');
		
		$where = "printing_press_id = '{$printing_press_id}'";
		$currentdatetime = date("Y-m-d H:i:s");
		$data = array(
			'update_timestamp' => $currentdatetime, 'complete_name' => $printing_press_name,'complete_address' => $printing_press_address,'contact_number' => $printing_press_contact_number,'contact_person' => $printing_press_contact_person,'remarks' => $printing_press_remarks);

		$this->dpr_model->update_printing_press($data,$where);	
		
		$this->return_json("1","Update Successfully");
	}

}