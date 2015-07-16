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
		$ShipmentNo = $this->input->GET("txtshipment");
		$Save = $this->input->GET("btn-action");
		$search_url = "";
		$where = "ShipmentNo = '" .$ShipmentNo. "'";
		$TagNo = $this->input->GET("txttagno");
		$Engine = $this->input->GET("txtengine");
		$Chassis = $this->input->GET("txtchassis");
		$OldSKU = $this->input->Get("txtoldsku");
		$errormessage="";
		$getmotordetail="";

		if ($Save == "Save") {
			$insert_unit = array(
				'ShipmentNo' => $ShipmentNo,
				'TagNo' => $TagNo,
				'Engine' => $Engine,
				'Chassis' => $Chassis
				);
			$this->whcarmona_model->insert_matchedckd($insert_unit);
		}
		//if ($Save == "getsku"){
			$whereoldsku = "OldSKU = '" .$OldSKU. "'";
			$getmotordetail = $this->whcarmona_model->get_tblmotorcycle($whereoldsku);
		//}


		$search_url = "?txtshipment=".$ShipmentNo."&btn-action=".$Save."&txtengine=".$Engine."&txtchassis=".$Chassis."&txtoldsku=".$OldSKU."";

		$matchedckdcount = $this->whcarmona_model->get_matchedckd_count($where);
		 // set pagination data
		$config = array(
		'pagination_url' => "/warehouse/matching",
		'total_items' => $matchedckdcount,
		'per_page' => 5,
		'uri_segment' => 3,
		);

		$this->pager->set_config($config);

		$transfers = $this->whcarmona_model->get_matchedckd( $where, array('rows' => $this->pager->per_page, 'offset' => $this->pager->offset), "TagNo DESC"); 
		$this->template->errormessage = $errormessage;
		$this->template->getmotordetail=$getmotordetail;
		$this->template->transfers = $transfers;
		$this->template->search_url = $search_url;
		$this->template->ShipmentNo = $ShipmentNo;
		$this->template->Save = $Save;
		$this->template->OldSKU = $OldSKU;
		$this->template->matchedckdcount = $matchedckdcount + 1;
		$this->template->view('engine-chassis-matching');
	}	
	Public function view_other_details()
	{

	}
}
