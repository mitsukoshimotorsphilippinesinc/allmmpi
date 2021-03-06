<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

class Inventory_Controller extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();
		$this->set_system('inventory');
		$this->template->name = 'main-fluid';
	
		if (empty($this->selected_facility) || is_null($this->selected_facility))
		{
			// get default user facility
			$where = array("user_id"=>$this->user->user_id, "is_default"=> 1);
<<<<<<< HEAD
			$default_facility = $this->users_model->get_user_facilities($where);
=======
			$default_facility = $this->user_model->get_user_facilities($where);
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
			$this->selected_facility = $this->facilities_model->get_facility_by_id($default_facility[0]->facility_id);
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