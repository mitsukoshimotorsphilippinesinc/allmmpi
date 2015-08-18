<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Form_request extends Admin_Controller {


	public function index()
	{

		$this->template->view('dashboard');
	}

	public function accountables()
	{
		$this->template->view('form_request/request_accountable_form');	
	}

	public function non_accountables()
	{
		$this->template->view('form_request/request_non_accountable_form');	
	}

	public function add_new_accountables()
	{
		$this->template->view('form_request/add_request_accountable_form');	
	}
}