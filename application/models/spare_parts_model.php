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
			'free_of_charge' => 'is_free_of_charge',
			'free_of_charge_detail' => 'is_free_of_charge_detail',
			'service_unit' => 'is_service_unit',
			'service_unit_detail' => 'is_service_unit_detail',
			'warehouse_request' => 'is_warehouse_request',
			'warehouse_request_detail' => 'is_warehouse_request_detail',
			'warehouse_claim' => 'is_warehouse_claim',
			'warehouse_claim_detail' => 'is_warehouse_claim_detail',
			'dealer' => 'rf_dealer',
			'agent' => 'rf_agent',
			'department_module' => 'rf_department_module',
			'warehouse' => 'rf_warehouse',
			'spare_part_stock_level_view' => 'is_spare_part_stock_level_view',
			'warehouse_reservation' => 'tr_warehouse_reservation',
			'item' => 'is_item',
			'item_view' => 'is_item_view',
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

	// ========================================================================
	// is_warehouse_request
	function get_warehouse_request($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('warehouse_request', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse_request($data) 
	{
		return $this->insert('warehouse_request', $data);
	}

	function update_warehouse_request($data, $where) 
	{
		return $this->update('warehouse_request', $data, $where);
	}

	function delete_warehouse_request($where) 
	{
		return $this->delete('warehouse_request', $where);
	}

	function get_warehouse_request_by_id($warehouse_request_id) 
	{
		$result = $this->get_warehouse_request(array('warehouse_request_id' => $warehouse_request_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_request_by_code($request_code) 
	{
		$result = $this->get_warehouse_request(array('request_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_request_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse_request', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_warehouse_request($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['warehouse_request']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ===========================================================================

	// ========================================================================
	// is_warehouse_request_detail
	function get_warehouse_request_detail($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('warehouse_request_detail', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse_request_detail($data) 
	{
		return $this->insert('warehouse_request_detail', $data);
	}

	function update_warehouse_request_detail($data, $where) 
	{
		return $this->update('warehouse_request_detail', $data, $where);
	}

	function delete_warehouse_request_detail($where) 
	{
		return $this->delete('warehouse_request_detail', $where);
	}

	function get_warehouse_request_detail_by_id($warehouse_request_detail_id) 
	{
		$result = $this->get_warehouse_request(array('warehouse_request_detail_id' => $warehouse_request_detail_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_request_detail_by_request_id($request_id) 
	{
		$result = $this->get_warehouse_request_detail(array('warehouse_request_id' => $request_id));
		$row = $query->result();
		$query->free_result();
		return $row;
	}
	
	function get_warehouse_request_detail_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse_request_detail', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_warehouse_request_detail($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['warehouse_request_detail']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ======================================================================

	// ========================================================================
	// is_warehouse_claim
	function get_warehouse_claim($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('warehouse_claim', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse_claim($data) 
	{
		return $this->insert('warehouse_claim', $data);
	}

	function update_warehouse_claim($data, $where) 
	{
		return $this->update('warehouse_claim', $data, $where);
	}

	function delete_warehouse_claim($where) 
	{
		return $this->delete('warehouse_claim', $where);
	}

	function get_warehouse_claim_by_id($warehouse_claim_id) 
	{
		$result = $this->get_warehouse_claim(array('warehouse_claim_id' => $warehouse_claim_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_claim_by_code($request_code) 
	{
		$result = $this->get_warehouse_claim(array('request_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_claim_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse_claim', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_warehouse_claim($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['warehouse_claim']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ===========================================================================

	// ========================================================================
	// is_warehouse_claim_detail
	function get_warehouse_claim_detail($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('warehouse_claim_detail', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse_claim_detail($data) 
	{
		return $this->insert('warehouse_claim_detail', $data);
	}

	function update_warehouse_claim_detail($data, $where) 
	{
		return $this->update('warehouse_claim_detail', $data, $where);
	}

	function delete_warehouse_claim_detail($where) 
	{
		return $this->delete('warehouse_claim_detail', $where);
	}

	function get_warehouse_claim_detail_by_id($warehouse_claim_detail_id) 
	{
		$result = $this->get_warehouse_claim(array('warehouse_claim_detail_id' => $warehouse_claim_detail_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_claim_detail_by_request_id($request_id) 
	{
		$result = $this->get_warehouse_claim_detail(array('warehouse_claim_id' => $request_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_claim_detail_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse_claim_detail', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_warehouse_claim_detail($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['warehouse_claim_detail']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ======================================================================

	// ========================================================================
	// is_service_unit
	function get_service_unit($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('service_unit', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_service_unit($data) 
	{
		return $this->insert('service_unit', $data);
	}

	function update_service_unit($data, $where) 
	{
		return $this->update('service_unit', $data, $where);
	}

	function delete_service_unit($where) 
	{
		return $this->delete('service_unit', $where);
	}

	function get_service_unit_by_id($service_unit_id) 
	{
		$result = $this->get_service_unit(array('service_unit_id' => $service_unit_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_service_unit_by_code($request_code) 
	{
		$result = $this->get_service_unit(array('request_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_service_unit_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('service_unit', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_service_unit($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['service_unit']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ===========================================================================

	// ========================================================================
	// is_free_of_charge
	function get_free_of_charge($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('free_of_charge', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_free_of_charge($data) 
	{
		return $this->insert('free_of_charge', $data);
	}

	function update_free_of_charge($data, $where) 
	{
		return $this->update('free_of_charge', $data, $where);
	}

	function delete_free_of_charge($where) 
	{
		return $this->delete('free_of_charge', $where);
	}

	function get_free_of_charge_by_id($free_of_charge_id) 
	{
		$result = $this->get_free_of_charge(array('free_of_charge_id' => $free_of_charge_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_free_of_charge_by_code($request_code) 
	{
		$result = $this->get_free_of_charge(array('request_code' => $request_code));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_free_of_charge_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('free_of_charge', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_free_of_charge($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['free_of_charge']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ===========================================================================

	// ======================================================================
	// rf_warehouse
	function get_warehouse($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('warehouse', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse($data) 
	{
		return $this->insert('warehouse', $data);
	}

	function update_warehouse($data, $where) 
	{
		return $this->update('warehouse', $data, $where);
	}

	function delete_warehouse($where) 
	{
		return $this->delete('warehouse', $where);
	}

	function get_warehouse_by_id($warehouse_id) 
	{
		$result = $this->get_warehouse(array('warehouse_id' => $warehouse_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ======================================================================

	// ======================================================================
	// is_spare_part_stock_level_view
	function get_spare_part_stock_level_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('spare_part_stock_level_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_spare_part_stock_level_view_by_sku($sku) 
	{
		$result = $this->get_spare_part_stock_level_view(array('sku' => $sku));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_spare_part_stock_level_view_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('spare_part_stock_level_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ======================================================================


	function get_pending_warehouse_reservations($where=NULL)
	{
		$sql = "SELECT 
					b.module_name,
					a.transaction_number,
					a.status,
					a.insert_timestamp
				FROM 
					`tr_warehouse_reservation` a
				LEFT JOIN 
					`rf_department_module` b ON a.department_module_id = b.department_module_id
				WHERE
					`status` IN ('PENDING', 'PROCESSING') " . $where;

		$query = $this->db->query($sql);		
		$result = $query->result();
		$query->free_result();
		return $result;
	}

	function get_pending_warehouse_reservations_count($where=NULL)
	{
		$sql = "SELECT 
					count(*) as cnt
				FROM 
					`tr_warehouse_reservation` a
				LEFT JOIN 
					`rf_department_module` b ON a.department_module_id = b.department_module_id
				WHERE
					`status` IN ('PENDING', 'PROCESSING') " . $where;

		$query = $this->db->query($sql);		
		$result = $query->first_row();
		$query->free_result();
		return $result->cnt;
	}	

	// ========================================================================
	// is_warehouse_claim
	function get_warehouse_reservation($where = null, $limit = null, $orderby = null, $fields = null) 
	{

		$query = $this->fetch('warehouse_reservation', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_warehouse_reservation($data) 
	{
		return $this->insert('warehouse_reservation', $data);
	}

	function update_warehouse_reservation($data, $where) 
	{
		return $this->update('warehouse_reservation', $data, $where);
	}

	function delete_warehouse_reservation($where) 
	{
		return $this->delete('warehouse_reservation', $where);
	}

	function get_warehouse_reservation_by_id($warehouse_reservation_id) 
	{
		$result = $this->get_warehouse_reservation(array('warehouse_reservation_id' => $warehouse_reservation_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_reservation_by_code($transaction_number) 
	{
		$result = $this->get_warehouse_reservation(array('transaction_number' => $transaction_number));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_warehouse_reservation_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('warehouse_reservation', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	function search_warehouse_reservation($search, $query, $limit = null, $orderby = null, $fields = null)
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
		$this->db->from($this->_TABLES['warehouse_reservation']);
		$result = $this->db->get();

		$row = $result->result();
		$result->free_result();
		return $row;
	}
	// ===========================================================================
	// ===========================================================================
	// is_item
	function get_item($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('item', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_item($data) 
	{
		return $this->insert('item', $data);
	}

	function update_item($data, $where) 
	{
		return $this->update('item', $data, $where);
	}

	function delete_item($where) 
	{
		return $this->delete('item', $where);
	}

	function get_item_by_id($item_id) 
	{
		$result = $this->get_item(array('item_id' => $item_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_item_by_sku($sku) 
	{
		$result = $this->get_item(array('sku' => $sku));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_item_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('item', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ===========================================================================
	// ===========================================================================
	// is_item_view
	function get_item_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('item_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_item_view_by_id($item_id) 
	{
		$result = $this->get_item_view(array('item_id' => $item_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_item_view_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('item_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ===========================================================================

}