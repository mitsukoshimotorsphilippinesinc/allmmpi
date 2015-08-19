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
			'department_module_submodule' => 'rf_department_module_submodule',
			'form' => 'rf_form_type',
			'printing_press' => 'rf_printing_press',
			'request_detail' => 'tr_request_detail',
			'request_summary' => 'tr_request_summary'
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
	// ===========================================================================
	// department_module_submodule
	function get_department_module_submodule($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('department_module_submodule', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_department_module_submodule($data) 
	{
		return $this->insert('department_module_submodule', $data);
	}

	function update_department_module_submodule($data, $where) 
	{
		return $this->update('department_module_submodule', $data, $where);
	}

	function delete_department_module_submodule($where) 
	{
		return $this->delete('department_module_submodule', $where);
	}

	function get_department_module_submodule_by_id($department_module_submodule_id) 
	{
		$result = $this->get_department_module_submodule(array('department_module_submodule_id' => $department_module_submodule_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_department_module_submodule_by_submodule_url($submodule_url) 
	{
		$result = $this->get_department_module_submodule(array('submodule_url' => '/' . $submodule_url));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
		
	function get_department_module_submodule_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('department_module_submodule', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}

	function get_form_type($where = null, $limit = null, $orderby = null, $fields = null) {
		$query = $this->fetch('form', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function get_press_name($where = null, $limit = null, $orderby = null, $fields = null) {
		$query = $this->fetch('printing_press', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function insert_request_detail($data){
		return $this->insert('request_detail', $data);
	}

	function get_request_summary($where = null, $limit = null, $orderby = null, $fields = null){
		$query = $this->fetch('request_summary', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function insert_request_summary($data){
		return $this->insert('request_summary', $data);
	}

	function get_request_detail($where = null, $limit = null, $orderby = null, $fields = null){
		$query = $this->fetch('request_detail', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function get_form_by_id($form_type_id) 
	{
		$result = $this->get_form_type(array('form_type_id' => $form_type_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_printing_press_by_id($printing_press_id) 
	{
		$result = $this->get_press_name(array('printing_press_id' => $printing_press_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function delete_request_detail($where) 
	{
		return $this->delete('request_detail', $where);
	}
}