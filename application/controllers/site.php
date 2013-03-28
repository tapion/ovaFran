<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Site extends CI_Controller {

    function index() {
        $this->load->library('session');
        $userid = $this->session->userdata("userid");
        if ($userid != "") {
            $this->load->view('header_view');
            $this->load->view('site/index', array("role_id" => $this->session->userdata("role_id")));
        } else {
            $this->load->view('header_view');
            $this->load->view('login/login');
        }
    }

    function loadView($config) {
        $this->load->view('header_view.php');
        foreach ($config as $configItem) {
            $this->load->view($configItem["view"], $configItem["parameters"]);
        }
        $this->load->view('footer_view.php');
    }

    function login() {
        $this->load->library('session');
        $username = $_POST["username"];
        $password = $_POST["password"];

        $this->load->model("usuarios_model", "Usuarios", true);
        $user = $this->Usuarios->login($username, $password);
        $userData = $user->result();

        if (isset($userData[0]->id)) {
            $this->load->view('header_view');
            $this->load->view('site/index', array("role_id" => $userData[0]->roleid));
            $newUserData = array("userid" => $userData[0]->id, "username" => $userData[0]->username, "role_id" => $userData[0]->roleid);
            $this->session->set_userdata($newUserData);
        } else {
            $this->load->view('header_view');
            $this->load->view('login/login');
        }
    }

    function logout() {
        $this->load->library('session');
        $this->session->sess_destroy();
        $this->load->view('header_view');
        $this->load->view('login/login');
    }

}

