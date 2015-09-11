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
		$this->load->model('user_model');
		$this->load->model('human_relations_model');
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


	public function privileges() 
	{
		
		$search_by = trim($this->input->get("search_option"));
		$search_text = trim($this->input->get("search_string"));

		$search_url = "";
		
		// get department_id
		$system = $this->uri->segment(1);

		$department_details = $this->human_relations_model->get_department_by_url($system);


		$where = "department_id = '{$department_details->department_id}' AND is_employed = 1";

		if (($search_text == "") || empty($search_text)) {
			$where .= "";			
		} else {
			if ($search_by == 'name') {				
				$where .= " AND concat(first_name, ' ', last_name) LIKE LOWER('%{$search_text}%')";
			} else {			
				$where .= " AND {$search_by} LIKE LOWER('%{$search_text}%')";
			}
			
			$search_url = "?search_option=" . $search_by . "&search_string=" . $search_text;
		}
		
		$total_items = $this->human_relations_model->get_employment_information_view_count($where);
		
		// initialize pagination class
		// set pagination data
		$config = array(
		    'pagination_url' => '/dpr/maintenance/privileges',
		    'total_items' => $total_items,
		    'per_page' => 10,
		    'uri_segment' => 4,
		);
		
		
		$this->pager->set_config($config);
		
		$users = $this->human_relations_model->get_employment_information_view($where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "last_name, first_name");
		
		if ($_POST)
		{
			
			$search_validation = array(
				array(
					'field' => 'search',
					'label' => 'Search',
					'rules' => 'trim|required'
				),
				array(
					'field' => 'query',
					'label' => 'Query',
					'rules' => 'trim|required'
				),
			);
			$this->form_validation->set_rules($search_validation);
			if ($this->form_validation->run()) 
			{
				$search = set_value('search');
				$query = set_value('query');
				
				$total_items = $this->user_model->search();
				$users = $this->user_model->search_user($search,$query,array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset));

			}
		}

		// search vars
		$this->template->search_by = $search_by;
		$this->template->search_text = $search_text;
		$this->template->search_url = $search_url;
		
		$this->pager->set_config($config);

		$this->template->users = $users;
		$this->template->view('maintenance/privileges/list');
	
	}


	public function edit_privilege($user_id = 0)
	{
		if ($_POST)
		{
			$_user_id = $this->input->post('user_id');
			$_privileges = $this->input->post('privileges');
			
			// remove all user privileges
			$this->user_model->delete_user_privilege("user_id = {$_user_id}");
			// add new privileges
			
			foreach($_privileges as $p)
			{
				$data = array("user_id"=>$_user_id,"privilege_id"=>$p);
				$this->user_model->insert_user_privilege($data);
			}
			
			echo json_encode(array("status"=>1));
			return;
		}
				
		$user = $this->user_model->get_user_by_id($user_id);
		$employment_information_details = $this->human_relations_model->get_employment_information_view("id_number = {$user->id_number}");
		$employment_information_details = $employment_information_details[0];

		$user_privileges = $this->user_model->get_user_privilege("user_id = {$user_id}");		
		
		if (!empty($user_privileges))
		{
			$up_array = array();
			foreach ($user_privileges as $up) $up_array[] = $up->privilege_id;			
			$where = "privilege_id NOT IN (".implode(",",$up_array).")";
		}
		else
			$where = null;
		
		$privileges = $this->user_model->get_privilege($where);

		$this->template->user = $user;
		$this->template->employment_information_details = $employment_information_details;
		$this->template->user_privileges = $user_privileges;
		$this->template->privileges = $privileges;
		$this->template->view('maintenance/privileges/privilege');
	}

}