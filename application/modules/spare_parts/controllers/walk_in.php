<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Walk_in extends Admin_Controller {

	function __construct()
	{
		parent::__construct();		
		$this->load->model('spare_parts_model');
		$this->load->library('pager');			
		$this->load->helper("breadcrumb_helper");	

		$this->db_dpr = $this->load->database('spare_parts', TRUE);

	}

	public function index()
	{
		$this->template->view('/walk_in/dashboard');
	}

	public function add_new_sales()
	{
		$this->template->view('spare_parts/walk_in/sales/sales');	
	}

	public function add_new_item()
	{
		$data = "";
		$html = $this->load->view("spare_parts/walk_in/sales/add_item",$data,TRUE);

		$this->return_json("1","Search item/Parts", array('html' => $html));
	}

}