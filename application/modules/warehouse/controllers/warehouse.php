<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model("whcarmona_model");
		$this->load->library('pager'); 
	}

	public function index()
	{
		$test = $this->uri->segment(3);
		$test2 = $this->uri->segment(4);

		$this->template->view('dashboard');
	}
	
	public function matching()
	{
		$search_url = "";
		$where = "ShipmentNo = 'APKW14034'";
		 // set pagination data
		$config = array(
		'pagination_url' => "/warehouse/matching",
		'total_items' => $this->whcarmona_model->get_matchedckd_count($where),
		'per_page' => 5,
		'uri_segment' => 3,
		);

		$this->pager->set_config($config);

		$transfers = $this->whcarmona_model->get_matchedckd( $where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "TagNo DESC"); 
		$this->template->transfers = $transfers;
		$this->template->search_url = $search_url;
		$this->template->view('engine-chassis-matching');
	}	
}
