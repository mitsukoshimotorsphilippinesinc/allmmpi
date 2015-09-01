<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Branch extends Admin_Controller {


	public function index()
	{
		$this->template->view('/branch/dashboard');
	}

	public function releasing_of_form()
	{
		$this->template->view('/branch/transaction/releasing');
	}

}
