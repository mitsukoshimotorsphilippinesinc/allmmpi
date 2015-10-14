<<<<<<< HEAD
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Noaccess extends Admin_Controller {

	public function before()
	{
		parent::before();
	}

	public function index()
	{
		$this->template->view('dashboard');
	}
	
	
}
=======
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Noaccess extends Admin_Controller {

	public function before()
	{
		parent::before();
	}

	public function index()
	{
		$this->template->view('dashboard');
	}
	
	
}
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
