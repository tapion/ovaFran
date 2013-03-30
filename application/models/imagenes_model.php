<?php
class Imagenes_model extends CI_Model
{

        public function __construct() {
            parent::__construct();
        }

	function create($data)
	{
            $this->db->insert('imagenes', $data);
            /*return $this->db->affected_rows();*/
            return true;
	}

	function read($id)
	{
            $this->db->where('pregunta_id', $id);
            $query = $this->db->get('imagenes');

            return $query;
	}

	function readAll()
	{
            $query = $this->db->get('imagenes');

            return $query;
	}

	function update($id, $data)
	{
            $this->db->update('imagenes', $data);

            return $this->db->affected_rows();
	}

	function delete($id)
	{
            $this->db->where('id', $id);
            $this->db->delete('imagenes');

            return $this->db->affected_rows();
	}

}