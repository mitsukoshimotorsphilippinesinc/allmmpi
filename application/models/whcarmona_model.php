<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Whcarmona_model extends Base_model {
	function __construct()
	{
		// call the base model constructor
		parent::__construct();
		
		$this->db = $this->load->database('WHCarmona', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
				'matchedckd' => 'MSMatchedCKD',
				);

	}

	function get_matchedckd($where = null, $limit = null, $orderby = null, $fields = null)
	{
		$query = $this->fetch('matchedckd', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
	}
}