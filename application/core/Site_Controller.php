<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

class Site_Controller extends Base_Controller {
	
	public $selected_account = NULL;
	
	public function __construct() 
	{
		parent::__construct();

		$this->template->theme = 'site';
		$this->template->name = 'members';
		$this->template->title = $this->config->item('title');

		// check browser we will not support IE version lower than 9
		if ($this->agent->is_browser('MSIE') && (abs($this->agent->version()) < 9))
		{
			$this->template->name = 'basic';
			$this->template->title = $this->config->item('title') . ' - Browser Check!';
			$this->template->view('browser_check', 'main');
			$this->output->_display();
			exit;
		}

		$segment_uri = $this->uri->uri_string();
		$login_uri = 'members/signin';
		$is_login_action = stripos($segment_uri, $login_uri) !== FALSE;
		
		// configure authenticate
		$auth_config = array(
			'table' => 'cm_member_user_accounts',
			'field_id' => 'member_id',
			'hash_salt' => 'gbs@admin8896',
			'prefix' => 'cm_'
		);
		$this->authenticate->initialize($auth_config);
		
		if ($this->authenticate->is_logged_in()) {

			ci()->user = $this->user = $this->authenticate->get_user();

			// load members model
			$this->load->model('members_model');
			
			$member = $this->members_model->get_member_by_id($this->user->member_id);
			
			ci()->member = $this->member = $member;
		} else {
			if (!$is_login_action) 
				redirect('/members/signin');
		}		
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