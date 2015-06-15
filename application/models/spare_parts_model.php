<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Spare_parts_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('spare_parts', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
			'salary_deduction' => 'is_salary_deduction',
			'salary_deduction_detail' => 'is_salary_deduction_detail',
			'dealer_request' => 'is_dealer_request',
			'dealer_request_detail' => 'is_dealer_request_detail',
			'dealer' => 'rf_dealer',
			'agent' => 'rf_agent',
		);

	}

	
	// is_salary_deduction
	function get_salary_deduction($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('salary_deduction', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_salary_deduction($data) 
	{
		return $this->insert('salary_deduction', $data);
	}

	function update_salary_deduction($data, $where) 
	{
		return $this->update('salary_deduction', $data, $where);
	}

	function delete_salary_deduction($where) 
	{
		return $this->delete('salary_deduction', $where);
	}

	function get_salary_deduction_by_id($salary_deduction_id) 
	{
		$result = $this->get_salary_deduction(array('salary_deduction_id' => $salary_deduction_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_salary_deduction_by_code($request_code) 
	{
		$result = $this->get_salary_deduction(array('sd_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_salary_deduction_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('salary_deduction', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_salary_deduction($search, $query, $limit = null, $orderby = null, $fields = null)
	{
		// clear previous get request
		$this->db->flush_cache();

		$this->db->distinct();
		$this->db->like($search,$query,'both');
		
		// No override function, procede with fetch
		($fields!=null) ? $this->db->select($fields) : '';
		($limit!=null) ? $this->db->limit($limit['rows'],$limit['offset']) : '';
		($orderby!=null) ? $this->db->order_by($orderby) : '';

		// set table to use
		$this->db->from($this->_TABLES['salary_deduction']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	

	// is_salary_deduction_detail
	function get_salary_deduction_detail($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('salary_deduction_detail', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_salary_deduction_detail($data) 
	{
		return $this->insert('salary_deduction_detail', $data);
	}

	function update_salary_deduction_detail($data, $where) 
	{
		return $this->update('salary_deduction_detail', $data, $where);
	}

	function delete_salary_deduction_detail($where) 
	{
		return $this->delete('salary_deduction_detail', $where);
	}

	function get_salary_deduction_detail_by_id($salary_deduction_detail_id) 
	{
		$result = $this->get_salary_deduction(array('salary_deduction_detail_id' => $salary_deduction_detail_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_salary_deduction_detail_by_salary_deduction_id($salary_deduction_id) 
	{
		$result = $this->get_salary_deduction(array('salary_deduction_id' => $salary_deduction_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_salary_deduction_detail_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('salary_deduction_detail', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_salary_deduction_detail($search, $query, $limit = null, $orderby = null, $fields = null)
	{
		// clear previous get request
		$this->db->flush_cache();

		$this->db->distinct();
		$this->db->like($search,$query,'both');
		
		// No override function, procede with fetch
		($fields!=null) ? $this->db->select($fields) : '';
		($limit!=null) ? $this->db->limit($limit['rows'],$limit['offset']) : '';
		($orderby!=null) ? $this->db->order_by($orderby) : '';

		// set table to use
		$this->db->from($this->_TABLES['salary_deduction_detail']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}

	// is_dealer_request
	function get_dealer_request($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('dealer_request', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_dealer_request($data) 
	{
		return $this->insert('dealer_request', $data);
	}

	function update_dealer_request($data, $where) 
	{
		return $this->update('dealer_request', $data, $where);
	}

	function delete_dealer_request($where) 
	{
		return $this->delete('dealer_request', $where);
	}

	function get_dealer_request_by_id($dealer_request_id) 
	{
		$result = $this->get_dealer_request(array('dealer_request_id' => $dealer_request_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_dealer_request_by_code($request_code) 
	{
		$result = $this->get_dealer_request(array('request_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_dealer_request_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('dealer_request', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_dealer_request($search, $query, $limit = null, $orderby = null, $fields = null)
	{
		// clear previous get request
		$this->db->flush_cache();

		$this->db->distinct();
		$this->db->like($search,$query,'both');
		
		// No override function, procede with fetch
		($fields!=null) ? $this->db->select($fields) : '';
		($limit!=null) ? $this->db->limit($limit['rows'],$limit['offset']) : '';
		($orderby!=null) ? $this->db->order_by($orderby) : '';

		// set table to use
		$this->db->from($this->_TABLES['dealer_request']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}

	// ========================================================================
	// rf_dealer
	function get_dealer($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('dealer', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_dealer($data) 
	{
		return $this->insert('dealer', $data);
	}

	function update_dealer($data, $where) 
	{
		return $this->update('dealer', $data, $where);
	}

	function delete_dealer($where) 
	{
		return $this->delete('dealer', $where);
	}

	function get_dealer_by_id($dealer_id) 
	{
		$result = $this->get_dealer(array('dealer_id' => $dealer_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_dealer_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('dealer', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}	
	// ========================================================================

	// ========================================================================
	// rf_agent
	function get_agent($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('agent', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_agent($data) 
	{
		return $this->insert('agent', $data);
	}

	function update_agent($data, $where) 
	{
		return $this->update('agent', $data, $where);
	}

	function delete_agent($where) 
	{
		return $this->delete('agent', $where);
	}

	function get_agent_by_id($agent_id) 
	{
		$result = $this->get_agent(array('agent_id' => $agent_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_agent_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('agent', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}	
	// ========================================================================

}