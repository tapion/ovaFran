<?php
class Orden_model extends Model
{

	function Orden_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('test_id', $data['test_id']);
		$this->db->set('orden_test', $data['orden_test']);
		$this->db->insert('orden');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('id', $id);
		$query = $this->db->get('orden');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('orden');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('id', $data['id']);
		$this->db->set('test_id', $data['test_id']);
		$this->db->set('orden_test', $data['orden_test']);
		$this->db->update('orden');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('orden');

		return $this->db->affected_rows();
	}

}