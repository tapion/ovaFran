<?php
class Test_preguntas_model extends Model
{

	function Test_preguntas_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('test_id', $data['test_id']);
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->insert('test_preguntas');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('id', $id);
		$query = $this->db->get('test_preguntas');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('test_preguntas');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('id', $data['id']);
		$this->db->set('test_id', $data['test_id']);
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->update('test_preguntas');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('test_preguntas');

		return $this->db->affected_rows();
	}

}