<?php
class Sf_config_model extends Model
{

	function Sf_config_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('sf_table', $data['sf_table']);
		$this->db->set('sf_field', $data['sf_field']);
		$this->db->set('sf_type', $data['sf_type']);
		$this->db->set('sf_related', $data['sf_related']);
		$this->db->set('sf_label', $data['sf_label']);
		$this->db->set('sf_desc', $data['sf_desc']);
		$this->db->set('sf_order', $data['sf_order']);
		$this->db->set('sf_hidden', $data['sf_hidden']);
		$this->db->insert('sf_config');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('sf_id', $id);
		$query = $this->db->get('sf_config');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('sf_config');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('sf_id', $data['sf_id']);
		$this->db->set('sf_table', $data['sf_table']);
		$this->db->set('sf_field', $data['sf_field']);
		$this->db->set('sf_type', $data['sf_type']);
		$this->db->set('sf_related', $data['sf_related']);
		$this->db->set('sf_label', $data['sf_label']);
		$this->db->set('sf_desc', $data['sf_desc']);
		$this->db->set('sf_order', $data['sf_order']);
		$this->db->set('sf_hidden', $data['sf_hidden']);
		$this->db->update('sf_config');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('sf_id', $id);
		$this->db->delete('sf_config');

		return $this->db->affected_rows();
	}

}