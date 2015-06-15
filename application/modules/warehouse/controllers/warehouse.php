<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse extends Admin_Controller {

	public function before()
	{
		parent::before();
	}

	public function index()
	{
		$test = $this->uri->segment(3);
		$test2 = $this->uri->segment(4);
		//var_dump($test);

		$this->template->view('dashboard');
	}
	
	
}
