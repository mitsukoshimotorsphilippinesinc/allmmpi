<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

class Admin_Controller extends Base_Controller {
	
	public $selected_facility = null;
	
	public function __construct() 
	{
		parent::__construct();
		$this->template->theme = 'admin';
		$this->template->title = $this->config->item('title').' : Admin';
		
		//$this->load->config('asset_admin');

		$segment_uri = $this->uri->uri_string();
		$login_uri = 'admin/signin';
		$is_login_action = stripos($segment_uri, $login_uri) !== FALSE;
		
		// configure authenticate
		$auth_config = array(
			'table' => 'ad_users',
			'field_id' => 'user_id',
			'hash_salt' => 'gbs@admin8896',
			'prefix' => 'ad_'
		);
		$this->authenticate->initialize($auth_config);
		
		// 20150609 - LOGIN
		// load the systems
		$this->load->model(array('human_relations_model', 'warehouse_model', 'spare_parts_model','dpr_model'));
		//ci()->systems = $this->systems = $this->systems_model->get_systems(null, null, "ordering ASC");
		//ci()->current_system = $this->current_system = '';

		//// get the seleced facility from session
		//$this->selected_facility = ci()->session->userdata("selected_facility");
		//ci()->selected_facility = $this->selected_facility;


		if ($this->authenticate->is_logged_in()) {
			ci()->user = $this->user = $this->authenticate->get_user();
			//if (!$this->users_model->is_user_allowed($this->uri->uri_string())) redirect("/admin/systems/noaccess");
		} else {
			if (!$is_login_action) 
				redirect('/admin/signin');
		}
	}
	
	public function set_system($value)
	{
		ci()->current_system = $this->current_system = $value;
	}
	
	
	public function before()
	{
		parent::before();
	}
	
	public function after()
	{
		parent::after();
	}
	
}

// end of php file