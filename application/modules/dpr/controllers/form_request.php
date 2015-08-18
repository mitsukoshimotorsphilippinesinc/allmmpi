<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Form_request extends Admin_Controller {


	public function index()
	{

		$this->template->view('dashboard');
	}

	public function accountables()
	{

		var_dump("dante");
		$this->template->view('form_request/dashboard');
	}
}