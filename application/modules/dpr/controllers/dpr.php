<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dpr extends Admin_Controller {


	public function index()
	{

		$this->template->view('dashboard');
	}
}