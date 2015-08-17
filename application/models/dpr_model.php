<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Dpr_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('dpr', TRUE);

		// assign the table for this model
		$this->_TABLES = array(			
			'department_module' => 'rf_department_module',
		);

	}

	// ========================================================================
	// rf_department_module
	function get_department_module($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('department_module', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_department_module($data) 
	{
		return $this->insert('department_module', $data);
	}

	function update_department_module($data, $where) 
	{
		return $this->update('department_module', $data, $where);
	}

	function delete_department_module($where) 
	{
		return $this->delete('department_module', $where);
	}

	function get_department_module_by_id($department_module_id) 
	{
		$result = $this->get_department_module(array('department_module_id' => $department_module_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_department_module_by_code($module_code) 
	{
		$result = $this->get_department_module(array('module_code' => $module_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_department_module_by_segment_name($segment_name) 
	{
		$result = $this->get_department_module(array('segment_name' => $segment_name));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_department_module_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('department_module', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}	

	function get_department_module_by_segment($segment_name) 
	{
		$result = $this->get_department_module(array('segment_name' => $segment_name));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	// ========================================================================
}