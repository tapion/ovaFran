<?php

class Respuestas_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function create($data) {
        $this->db->insert('respuestas', $data);
        return $this->db->affected_rows();
    }

    function read($id) {
        $query = $this->db->get_where('respuestas', array('pregunta_id'=> $id));
        //$query = $this->db->query("select * from respuestas");
        return $query;
    }

    function readAll() {
        $query = $this->db->get('respuestas');
        return $query;
    }

    function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('respuestas', $data);
        return $this->db->affected_rows();
    }

    function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('respuestas');

        return $this->db->affected_rows();
    }
    
   function deleteResultadosUsuario($username){
        $this->db->query("delete from resultados_examen_final where username = '$username'");
        return true;
    }
    
    function insertResultadosRespuestas($username, $subcategoria, $resultado, $fechacreacion){
        $this->db->query("INSERT INTO resultados_examen_final (username,subcategoria,resultado,fechacreacion) VALUES ('$username', '$subcategoria', '$resultado', '$fechacreacion')");
        return true;
    }
    
    function insertResultadosTest($username, $idtest, $intentosfallidos,$rutaId,$ultimoOrden){
        $this->db->query("INSERT INTO resultados_test (username, idtest, intentosfallidos,ultimo_orden_valido,rutaaprendizaje_id) VALUES ('$username', '$idtest', '$intentosfallidos','$ultimoOrden',$rutaId)");
        return true;
    }
    
    function consultarUsuarios(){
        return $this->db->query("SELECT DISTINCT(username) FROM resultados_examen_final");
    }
    
    function consultarResultadosFinal($username){
        return $this->db->query("SELECT id, subcategoria, resultado FROM cuestionario.resultados_examen_final WHERE username = '$username' order by id asc ");
    }
    public function obtieneResultadosGenerales(){
        $sql = 'SELECT subcategoria 
                    ,coalesce((SELECT count(username) 
                            FROM resultados_examen_final 
                            where resultado = "Bueno" 
                            and resultados_examen_final.username <> ""
                            and resultados_examen_final.subcategoria = subcategorias.subcategoria 
                            group by resultado),0) as Bueno
                    ,coalesce((SELECT count(username) 
                            FROM resultados_examen_final 
                            where resultado = "Regular" 
                            and resultados_examen_final.subcategoria = subcategorias.subcategoria 
                            and resultados_examen_final.username <> ""
                            group by resultado),0) as Regular
                    ,coalesce((SELECT count(username) 
                            FROM resultados_examen_final 
                            where resultado = "Malo" 
                            and resultados_examen_final.subcategoria = subcategorias.subcategoria 
                            and resultados_examen_final.username <> ""
                            group by resultado),0) as Malo
                FROM subcategorias where sistema_digestivo = "final" order by subcategoria';
        return $this->db->query($sql);
    }

}