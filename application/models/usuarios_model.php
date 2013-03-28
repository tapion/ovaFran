<?php
class Usuarios_model extends CI_Model {
    function login($username, $password){
        $authentication = $this->db->query("SELECT u.id, u.username, u.firstname, u.lastname, u.email, ra.roleid FROM moodle.mdl_user AS u INNER JOIN moodle.mdl_role_assignments AS ra ON ra.userid = u.id WHERE u.username = '$username' AND u.password = MD5('$password')");
        return $authentication;
    }
}