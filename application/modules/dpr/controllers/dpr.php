<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dpr extends Admin_Controller {


	public function index()
	{

		$this->template->view('dashboard');
	}

	public function form_request()
	{

		$this->template->view('form_request/dashboard');
	}

	public function accountables()
	{
		$this->template->view('form_request/request_accountable_form');	
	}
}