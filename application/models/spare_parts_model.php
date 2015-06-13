<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Employees_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		// assign the table for this model
		$this->_TABLES = array(
			'salary_deduction' => 'is_salary_deduction',
			'salary_deduction_detail' => 'is_salary_deduction_detail'			
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
	
}