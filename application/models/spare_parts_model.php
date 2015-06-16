<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Spare_parts_model extends Base_model {
	function __construct()
	{
		// call the base model constructor
		parent::__construct();
		
		$this->db = $this->load->database('spare_parts', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
				'warehouse_reservation' => 'tr_warehouse_reservation',
				);

	}

	function get_matchedckd($where = null, $limit = null, $orderby = null, $fields = null)
	{
		$query = $this->fetch('warehouse_reservation', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
	}
}