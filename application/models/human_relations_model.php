<<<<<<< HEAD
<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Human_relations_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('human_relations', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
			'employee_requirement' => 'pm_employee_requirement',
			'employment_requirement' => 'rf_employment_requirement',
			'personal_information' => 'pm_personal_information',
			'employment_information' => 'pm_employment_information',
			'employment_information_view' => 'pm_employment_information_view',
			'position' => 'rf_position',
			'company' => 'rf_company',
			'department' => 'rf_department',
			'branch' => 'rf_branch',
		);

	}

	// pm_employee_requirement
	function get_employee_requirement($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employee_requirement', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employee_requirement($data) 
	{
		return $this->insert('employee_requirement', $data);
	}

	function update_employee_requirement($data, $where) 
	{
		return $this->update('employee_requirement', $data, $where);
	}

	function delete_employee_requirement($where) 
	{
		return $this->delete('employee_requirement', $where);
	}

	function get_employee_requirement_by_id($employee_requirement_id) 
	{
		$result = $this->get_employment_requirement(array('employee_requirement_id' => $employee_requirement_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employee_requirement_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('employment_requirement', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	// rf_employment_requirement
	function get_employment_requirement($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_requirement', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employment_requirement($data) 
	{
		return $this->insert('employment_requirement', $data);
	}

	function update_employment_requirement($data, $where) 
	{
		return $this->update('employment_requirement', $data, $where);
	}

	function delete_employment_requirement($where) 
	{
		return $this->delete('employment_requirement', $where);
	}

	function get_employment_requirement_by_id($employment_requirement_id) 
	{
		$result = $this->get_employment_requirement(array('employment_requirement_id' => $employment_requirement_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_requirement_count($where = null) {
		$query = $this->fetch('employment_requirement', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}

	// pm_personal_information
	function get_personal_information($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('personal_information', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_personal_information($data) 
	{
		return $this->insert('personal_information', $data);
	}

	function update_personal_information($data, $where) 
	{
		return $this->update('personal_information', $data, $where);
	}

	function delete_personal_information($where) 
	{
		return $this->delete('personal_information', $where);
	}

	function get_personal_information_by_id($personal_information_id) 
	{
		$result = $this->get_personal_information(array('personal_information_id' => $personal_information_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_personal_information_count($where = null) {
		$query = $this->fetch('personal_information', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}

	// ============================================================================================
	// pm_employment_information
	function get_employment_information($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_information', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employment_information($data) 
	{
		return $this->insert('employment_information', $data);
	}

	function update_employment_information($data, $where) 
	{
		return $this->update('employment_information', $data, $where);
	}

	function delete_employment_information($where) 
	{
		return $this->delete('employment_information', $where);
	}

	function get_employment_information_by_id($id_number) 
	{
		$result = $this->get_employment_information(array('id_number' => $id_number));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_information_count($where = null) {
		$query = $this->fetch('employment_information', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ==============================================================
	// ==============================================================
	// pm_employment_information_view
	function get_employment_information_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_information_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_employment_information_view_by_id($id_number) 
	{
		$result = $this->get_employment_information_view(array('id_number' => $id_number));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_information_view_count($where = null) {
		$query = $this->fetch('employment_information_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ==============================================================
	// ==============================================================
	// rf_position
	function get_position($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('position', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_position($data) 
	{
		return $this->insert('position', $data);
	}

	function update_position($data, $where) 
	{
		return $this->update('position', $data, $where);
	}

	function delete_position($where) 
	{
		return $this->delete('position', $where);
	}

	function get_position_by_id($position_id) 
	{
		$result = $this->get_position(array('position_id' => $position_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================
	// ==============================================================
	// rf_company
	function get_company($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('company', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_company($data) 
	{
		return $this->insert('company', $data);
	}

	function update_company($data, $where) 
	{
		return $this->update('company', $data, $where);
	}

	function delete_company($where) 
	{
		return $this->delete('company', $where);
	}

	function get_company_by_id($company_id) 
	{
		$result = $this->get_company(array('company_id' => $company_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================
	// ==============================================================
	// rf_department
	function get_department($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('department', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_department($data) 
	{
		return $this->insert('department', $data);
	}

	function update_department($data, $where) 
	{
		return $this->update('department', $data, $where);
	}

	function delete_department($where) 
	{
		return $this->delete('department', $where);
	}

	function get_department_by_id($department_id) 
	{
		$result = $this->get_department(array('department_id' => $department_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_department_by_url($url) 
	{
		$result = $this->get_department(array('url' => $url));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_branch($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('branch', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function insert_branch($data) 
	{
		return $this->insert('branch', $data);
	}

	function update_branch($data, $where) 
	{
		return $this->update('branch', $data, $where);
	}

	function delete_branch($where) 
	{
		return $this->delete('branch', $where);
	}

	function get_branch_by_id($branch_id) 
	{
		$result = $this->get_branch(array('branch_id' => $branch_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================

=======
<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Human_relations_model extends Base_Model 
{

    function __construct() 
	{
		// call the base model constructor
		parent::__construct();

		$this->db = $this->load->database('human_relations', TRUE);

		// assign the table for this model
		$this->_TABLES = array(
			'employee_requirement' => 'pm_employee_requirement',
			'employment_requirement' => 'rf_employment_requirement',
			'personal_information' => 'pm_personal_information',
			'employment_information' => 'pm_employment_information',
			'employment_information_view' => 'pm_employment_information_view',
			'position' => 'rf_position',
			'company' => 'rf_company',
			'department' => 'rf_department',
			'branch' => 'rf_branch',
		);

	}

	// pm_employee_requirement
	function get_employee_requirement($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employee_requirement', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employee_requirement($data) 
	{
		return $this->insert('employee_requirement', $data);
	}

	function update_employee_requirement($data, $where) 
	{
		return $this->update('employee_requirement', $data, $where);
	}

	function delete_employee_requirement($where) 
	{
		return $this->delete('employee_requirement', $where);
	}

	function get_employee_requirement_by_id($employee_requirement_id) 
	{
		$result = $this->get_employment_requirement(array('employee_requirement_id' => $employee_requirement_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employee_requirement_count($where = null) {
		// do a sql count instead of row count
		$query = $this->fetch('employment_requirement', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	
	// rf_employment_requirement
	function get_employment_requirement($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_requirement', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employment_requirement($data) 
	{
		return $this->insert('employment_requirement', $data);
	}

	function update_employment_requirement($data, $where) 
	{
		return $this->update('employment_requirement', $data, $where);
	}

	function delete_employment_requirement($where) 
	{
		return $this->delete('employment_requirement', $where);
	}

	function get_employment_requirement_by_id($employment_requirement_id) 
	{
		$result = $this->get_employment_requirement(array('employment_requirement_id' => $employment_requirement_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_requirement_count($where = null) {
		$query = $this->fetch('employment_requirement', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}

	// pm_personal_information
	function get_personal_information($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('personal_information', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_personal_information($data) 
	{
		return $this->insert('personal_information', $data);
	}

	function update_personal_information($data, $where) 
	{
		return $this->update('personal_information', $data, $where);
	}

	function delete_personal_information($where) 
	{
		return $this->delete('personal_information', $where);
	}

	function get_personal_information_by_id($personal_information_id) 
	{
		$result = $this->get_personal_information(array('personal_information_id' => $personal_information_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_personal_information_count($where = null) {
		$query = $this->fetch('personal_information', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}

	// ============================================================================================
	// pm_employment_information
	function get_employment_information($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_information', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_employment_information($data) 
	{
		return $this->insert('employment_information', $data);
	}

	function update_employment_information($data, $where) 
	{
		return $this->update('employment_information', $data, $where);
	}

	function delete_employment_information($where) 
	{
		return $this->delete('employment_information', $where);
	}

	function get_employment_information_by_id($id_number) 
	{
		$result = $this->get_employment_information(array('id_number' => $id_number));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_information_count($where = null) {
		$query = $this->fetch('employment_information', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ==============================================================
	// ==============================================================
	// pm_employment_information_view
	function get_employment_information_view($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('employment_information_view', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function get_employment_information_view_by_id($id_number) 
	{
		$result = $this->get_employment_information_view(array('id_number' => $id_number));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	
	function get_employment_information_view_count($where = null) {
		$query = $this->fetch('employment_information_view', 'count(1) as cnt', $where);
		$row = $query->first_row();
		$query->free_result();
		return $row->cnt;
	}
	// ==============================================================
	// ==============================================================
	// rf_position
	function get_position($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('position', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_position($data) 
	{
		return $this->insert('position', $data);
	}

	function update_position($data, $where) 
	{
		return $this->update('position', $data, $where);
	}

	function delete_position($where) 
	{
		return $this->delete('position', $where);
	}

	function get_position_by_id($position_id) 
	{
		$result = $this->get_position(array('position_id' => $position_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================
	// ==============================================================
	// rf_company
	function get_company($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('company', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_company($data) 
	{
		return $this->insert('company', $data);
	}

	function update_company($data, $where) 
	{
		return $this->update('company', $data, $where);
	}

	function delete_company($where) 
	{
		return $this->delete('company', $where);
	}

	function get_company_by_id($company_id) 
	{
		$result = $this->get_company(array('company_id' => $company_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================
	// ==============================================================
	// rf_department
	function get_department($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('department', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;
    }

	function insert_department($data) 
	{
		return $this->insert('department', $data);
	}

	function update_department($data, $where) 
	{
		return $this->update('department', $data, $where);
	}

	function delete_department($where) 
	{
		return $this->delete('department', $where);
	}

	function get_department_by_id($department_id) 
	{
		$result = $this->get_department(array('department_id' => $department_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_department_by_url($url) 
	{
		$result = $this->get_department(array('url' => $url));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}

	function get_branch($where = null, $limit = null, $orderby = null, $fields = null) 
	{
		$query = $this->fetch('branch', $fields, $where, $orderby, $limit);
		$row = $query->result();
		$query->free_result();
		return $row;	
	}

	function insert_branch($data) 
	{
		return $this->insert('branch', $data);
	}

	function update_branch($data, $where) 
	{
		return $this->update('branch', $data, $where);
	}

	function delete_branch($where) 
	{
		return $this->delete('branch', $where);
	}

	function get_branch_by_id($branch_id) 
	{
		$result = $this->get_branch(array('branch_id' => $branch_id));
		$row = NULL;
		if (count($result) > 0) {
			$row = $result[0];
		}
		return $row;
	}
	// ==============================================================

>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
}