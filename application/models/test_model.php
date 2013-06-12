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
        $query = $this->db->get_where('test', array("nombre" => $data['nombre']));
        if ($query->num_rows() > 0) {
            return false;
        } else {
            $this->nombre = $data['nombre'];
            $this->fechacreacion = $data['fechacreacion'];
            $this->fechaactualizacion = $data['fechaactualizacion'];
            $this->usuario_id = $data['usuario_id'];
            $this->tipo = $data['tipo'];
            $this->db->insert('test', $this);
            return $this->db->affected_rows();
        }
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

    function getTestForSistem($getTestForSistem) {
        $query = $this->db->get_where('test', array("tipo" => $getTestForSistem));
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

    public function todosConTotal($where = "1 = 1") {
        return $this->db->query("SELECT tes.id,tes.nombre,coalesce(sum(pre.valor),0) as total,tes.valor,tes.fechacreacion,tes.tipo FROM test tes 
                                left join preguntas pre on pre.idtest = tes.id
                                where $where
                                group by tes.id order by tes.nombre");
    }

}
