<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inventory extends Admin_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
	
		$this->load->model('dpr_model');
		$this->load->model('human_relations_model');
		$this->load->library('pager');				
		$this->load->helper("breadcrumb_helper");

	}

	public function index()
	{		
		$this->template->view('inventory/dashboard');	
	}

	public function main()
	{		
		
		
		$this->template->view('inventory/main_inventory');	
	}
}
