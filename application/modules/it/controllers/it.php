<<<<<<< HEAD
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class It extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
	
		$this->db_spare_parts = $this->load->database('spare_parts', TRUE);	
	}

	public function index()
	{
		
		$this->template->view('dashboard');
	}

=======
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class It extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
	
		$this->db_spare_parts = $this->load->database('spare_parts', TRUE);	
	}

	public function index()
	{
		
		$this->template->view('dashboard');
	}

>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
}