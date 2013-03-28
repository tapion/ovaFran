<?php

class Test_model extends CI_Model {

    var $nombre = '';
    var $valor = '';
    var $fechacreacion = '';
    var $fechaactualizacion = '';
    var $usuario_id = '';
    var $tipo = '';

    function __construct() {
        parent::__construct();
    }

    function create($data) {
        $this->nombre = $data['nombre'];
        $this->valor = $data['valor'];
        $this->fechacreacion = $data['fechacreacion'];
        $this->fechaactualizacion = $data['fechaactualizacion'];
        $this->usuario_id = $data['usuario_id'];
        $this->tipo = $data['tipo'];
        $this->db->insert('test', $this);

        return $this->db->affected_rows();
    }

    function update($data) {
        $this->nombre = $data['nombre'];
        $this->valor = $data['valor'];
        $this->tipo = $data['tipo'];
        $this->fechacreacion = $data['fechacreacion'];
        $this->fechaactualizacion = $data['fechaactualizacion'];
        $this->usuario_id = $data['usuario_id'];

        $this->db->update('test', $this, array("id" => $data["id"]));

        return $this->db->affected_rows();
    }

    function selectAll() {
        $query = $this->db->get('test');
        return $query;
    }

    function selectOne($id) {
        $query = $this->db->get_where('test', array("id" => $id));
        return $query;
    }

    function delete($id) {
        $this->db->where("id = $id");
        $this->db->delete('test');

        return $this->db->affected_rows();
    }

}