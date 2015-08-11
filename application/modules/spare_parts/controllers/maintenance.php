<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Maintenance extends Admin_Controller {

	private $_agents_validation_rule = array(
		array(
			'field' => 'complete_name',
			'label' => 'Complete Name',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'complete_address',
			'label' => 'Complete Address',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'contact_number',
			'label' => 'Contact Number',
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
		$this->load->model('spare_parts_model');
		$this->load->library('pager');	
		$this->load->helper("spare_parts_helper");	
		$this->load->helper("breadcrumb_helper");	

		$this->db_spare_parts = $this->load->database('spare_parts', TRUE);

	}

	public $segment_name = "maintenance";

	public function index()
	{
		$this->template->view('maintenance/dashboard');
	}

	public function agents()
	{
		// initialize pagination class
		// set pagination data
		$config = array(
		    'pagination_url' => '/spare_parts/maintenance/agents/',
		    'total_items' => $this->spare_parts_model->get_agent_count(),
		    'per_page' => 5,
		    'uri_segment' => 4,
		);

		$this->pager->set_config($config);
		$this->template->agents = $this->spare_parts_model->get_agent(null, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset));
		$this->template->view('maintenance/agents/list');
	}

	public function add_agent()
	{
		if ($_POST)
		{
			// post done here
			$this->form_validation->set_rules($this->_agents_validation_rule);
			if ($this->form_validation->run())
			{
				$this->spare_parts_model->update_agent(array('is_active' => 0),array());
				
				// insert the new results
				$data = array(
					'complete_name' => set_value('complete_name'),
					'complete_address' => set_value('complete_address'),					
					'contact_number' => set_value('contact_number')
				);
				$this->spare_parts_model->insert_agent($data);
				
				$insert_id = $this->spare_parts_model->insert_id();
				
				/*//logging of action
				$details_after = array('id' => $insert_id, 'details' => $data);
				$details_after = json_encode($details_after);
				$add_result_log_data = array(
					'user_id' => $this->user->user_id,
					'module_name' => 'RESULTS',
					'table_name' => 'sm_results',
					'action' => 'ADD',
					'details_after' => $details_after,
					'remarks' => "",
				);

				$this->tracking_model->insert_logs('admin', $add_result_log_data);
				*/
				redirect('/spare_parts/maintenance/agents');
				return;
			}
		}
		$this->template->view('spare_parts/maintenance/agents/add');
	}

	public function edit_agent($agent_id = 0)
	{
		$agent_details = $this->spare_parts_model->get_agent_by_id($agent_id);


		if ($_POST and !empty($agent_details))
		{
			// post done here
			$this->form_validation->set_rules($this->_agents_validation_rule);

			if ($this->form_validation->run())
			{
				//$this->spare_parts_model->update_agent(array('is_active' => 0),array());
				// insert the new results
				$data = array(					
					'complete_name' => set_value('complete_name'),
					'complete_address' => set_value('complete_address'),
					'contact_number' => set_value('contact_number'),
					'is_active' => set_value('is_active'),
				);

				$this->spare_parts_model->update_agent($data, array('agent_id' => $agent_id));
				
				/*//logging of action
				$details_before = array('id' => $result_id, 'details' => array());
				$details_after = array('id' => $result_id, 'details' => array());
				
				foreach($data as $k => $v)
				{
					if($result->$k != $v)
					{
						$details_before['details'][$k] = $result->$k;
						$details_after['details'][$k] = $v;
					}
				}
				$details_before = json_encode($details_before);
				$details_after = json_encode($details_after);
				$update_result_log_data = array(
					'user_id' => $this->user->user_id,
					'module_name' => 'RESULTS',
					'table_name' => 'sm_results',
					'action' => 'UPDATE',
					'details_before' => $details_before,
					'details_after' => $details_after,
					'remarks' => "",
				);

				$this->tracking_model->insert_logs('admin', $update_result_log_data);*/
				
				redirect('/spare_parts/maintenance/agents');
				return;
			}
		}

		$this->template->agent_details = $agent_details;
		$this->template->view('spare_parts/maintenance/agents/edit');

	}

	public function delete_agent($agent_id = 0)
	{
		$agent_details = $this->spare_parts_model->get_agent_by_id($agent_id);

		if ($_POST and !empty($agent_details))
		{
			$_agent_id = $this->input->post('agent_id');
			if (!empty($_agent_id)) if ($_agent_id == $agent_id)
			{
				$this->spare_parts_model->delete_agent(array('agent_id' => $agent_id));
				
				/*//logging of action
				$details_before = array('id' => $agent_id, 'details' => $agent_details);
				$details_before = json_encode($details_before);
				
				$delete_announcement_log_data = array(
					'user_id' => $this->user->user_id,
					'module_name' => 'RESULTS',
					'table_name' => 'sm_results',
					'action' => 'DELETE',
					'details_before' => $details_before,
					'remarks' => "",
				);

				$this->tracking_model->insert_logs('admin', $delete_announcement_log_data);*/
				
				redirect('/spare_parts/maintenance/agents');
				return;
			}
		}

		$this->template->agent_details = $agent_details;
		$this->template->view('spare_parts/maintenance/agents/delete');

	}

	public function view_agent($agent_id = 0)
	{
		$agent_details = $this->spare_parts_model->get_agent_by_id($agent_id);

		$this->template->agent_details = $agent_details;
		$this->template->view('spare_parts/maintenance/agents/view');

	}


	public function update_image()
	{
		$filename = $this->input->post('filename');
		$agent_id = $this->input->post('agent_id');

		$data = array("image_filename"=>$filename);

		$this->spare_parts_model->update_agent($data, "agent_id = {$agent_id}");
		
		/*//logging of action
		$details_before = array('id' => $result_id, 'details' => array("image_filename"=>$filename));
		$details_after = array('id' => $result_id, 'details' => array("image_filename"=>$filename));
		
		$details_before = json_encode($details_before);
		$details_after = json_encode($details_after);
		$update_result_log_data = array(
			'user_id' => $this->user->user_id,
			'module_name' => 'RESULTS',
			'table_name' => 'sm_results',
			'action' => 'UPDATE',
			'details_before' => $details_before,
			'details_after' => $details_after,
			'remarks' => "",
		);

		$this->tracking_model->insert_logs('admin', $update_result_log_data);*/
		
		$this->return_json('ok','');
	}
}