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

		var_dump("dante");
		$this->template->view('form_request/dashboard');
	}
}