<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("site.php");

class responderRuta extends CI_Controller {
    function index(){
        $this->load->model("RutaAprendizaje_model", "RutaAprendizaje", true);
        $arrauRutasAprendizaje = $this->RutaAprendizaje->selectAll();
        $parametersView = array(
            array("view" => 'responderRuta/estudiantes', "parameters" => array("arrauRutasAprendizaje" => $arrauRutasAprendizaje->result()))
        );
        site::loadView($parametersView);
    }
}

?>
