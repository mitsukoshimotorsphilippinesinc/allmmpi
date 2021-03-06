<<<<<<< HEAD
<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('warehouse', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
			'warehouse' => 'rf_warehouse',
			'motorcycle_brand_model_class_view' => 'rf_motorcycle_brand_model_class_view',
		);

	}

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
	

	// ===========================================
	// start: rf_motorcycle_brand_model_class_view
	function get_motorcycle_brand_model_class_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('motorcycle_brand_model_class_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_motorcycle_brand_model_class_view_by_id($brand_model_id) 
	{
		$result = $this->get_motorcycle_brand_model_class_view(array('motorcycle_brand_model_id' => $brand_model_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_motorcycle_brand_model_class_view_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('motorcycle_brand_model_class_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// end: rf_motorcycle_brand_model_class_view
	// ===========================================

=======
<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Warehouse_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('warehouse', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
			'warehouse' => 'rf_warehouse',
			'motorcycle_brand_model_class_view' => 'rf_motorcycle_brand_model_class_view',
		);

	}

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
	

	// ===========================================
	// start: rf_motorcycle_brand_model_class_view
	function get_motorcycle_brand_model_class_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('motorcycle_brand_model_class_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_motorcycle_brand_model_class_view_by_id($brand_model_id) 
	{
		$result = $this->get_motorcycle_brand_model_class_view(array('motorcycle_brand_model_id' => $brand_model_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_motorcycle_brand_model_class_view_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('motorcycle_brand_model_class_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// end: rf_motorcycle_brand_model_class_view
	// ===========================================

>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
}