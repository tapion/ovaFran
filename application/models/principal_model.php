<?php
class Principal_model extends Model
{

	function Principal_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('nombre', $data['nombre']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->set('orden_id', $data['orden_id']);
		$this->db->insert('principal');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('id', $id);
		$query = $this->db->get('principal');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('principal');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('id', $data['id']);
		$this->db->set('nombre', $data['nombre']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->set('orden_id', $data['orden_id']);
		$this->db->update('principal');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('principal');

		return $this->db->affected_rows();
	}

}