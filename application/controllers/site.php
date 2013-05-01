<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Site extends CI_Controller {

    function index() {
        if(empty($_GET["nom"]) || !is_numeric($_GET["nom"])){
            exit('Parametros incorrectos');
        }
        $this->load->model("usuarios_model", "Usuarios", true);
        $user = $this->Usuarios->login($_GET["nom"]);
        $userData = $user->result();

        if (isset($userData[0]->id)) {
            $this->load->view('header_view');
            $this->load->view('site/index', array("role_id" => $userData[0]->roleid));
            $newUserData = array("userid" => $userData[0]->id, "username" => $userData[0]->username, "role_id" => $userData[0]->roleid,'nom'=>$_GET["nom"]);
            $this->session->set_userdata($newUserData);
        } else {
            exit('Usuario no existe');
        }
    }

    function loadView($config) {
        $this->load->view('header_view.php');
        foreach ($config as $configItem) {
            $this->load->view($configItem["view"], $configItem["parameters"]);
        }
        $this->load->view('footer_view.php');
    }

}

