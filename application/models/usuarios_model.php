<?php
class Usuarios_model extends CI_Model {
    function login($idUsuarios){
        return $this->db->query("SELECT u.id, u.username, u.firstname, u.lastname, u.email, ra.roleid FROM ".NOMBRE_BD_MOODLE.".mdl_user AS u INNER JOIN ".NOMBRE_BD_MOODLE.".mdl_role_assignments AS ra ON ra.userid = u.id WHERE u.id = $idUsuarios");
    }
}
