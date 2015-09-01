<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Branch extends Admin_Controller {


	public function index()
	{
		$this->template->view('branch/dashboard');
	}

	

}	
