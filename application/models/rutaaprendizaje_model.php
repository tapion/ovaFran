<?php

class RutaAprendizaje_model extends CI_Model {

    var $id;
    var $nombre;
    var $data;
    var $usuario_id;
    var $fecha_creacion;
    var $sistema_digestivo_codigo;

    function __construct() {
        parent::__construct();
    }

    function create($data) {
        $this->db->insert('rutaaprendizaje', $data);
        return $this->db->affected_rows();
    }

    function update($data) {
        $this->db->update('rutaaprendizaje', $data, array("id" => $data["id"]));
        return $this->db->affected_rows();
    }

    function selectAll() {
        $query = $this->db->get('rutaaprendizaje');
        return $query;
    }

    function selectOne($id) {
        $query = $this->db->get_where('rutaaprendizaje', array("id" => $id));
        return $query;
    }

    function delete($id) {
        $this->db->where("id = $id");
        $this->db->delete('rutaaprendizaje');

        return $this->db->affected_rows();
    }

    function existeRutaAprendizaje($sistemaCodigo) {
        $query = $this->db->get_where('rutaaprendizaje', array("sistema_digestivo_codigo" => $sistemaCodigo));
        return $query;
    }

    function edita($data, $id) {
        $this->db->nombre = $data['nombre'];
        $this->db->data = $data['data'];
        $this->db->fecha_creacion = $data['nombre'];
        $this->db->usuario_id = $data['usuario_id'];
        $this->db->update('rutaaprendizaje', $data, array("id" => (int) $id));

        return $this->db->affected_rows();
    }

}
