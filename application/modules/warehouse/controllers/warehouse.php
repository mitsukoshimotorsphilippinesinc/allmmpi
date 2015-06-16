<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse extends Admin_Controller {

	public function before()
	{
		parent::before();

		$this->load->model("spare_parts_model");
	}

	public function index()
	{
		$test = $this->uri->segment(3);
		$test2 = $this->uri->segment(4);
		//var_dump($test);

		$this->template->view('dashboard');
	}
	
	public function matching()
	{
		//$where = "ShipmentNo = 'APLF15013-14'";
		$where = "";
		$transfers = $this->Spare_parts_model->get_matchedckd($where); 
		//$this->template->transfers = $transfers;
		$this->template->view('engine-chassis-matching');
	}	
}
