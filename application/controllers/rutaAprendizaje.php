<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("site.php");

class rutaAprendizaje extends CI_Controller {

    function index() {
        $parametersView = array(
            array("view" => 'rutaAprendizaje/index', "parameters" => array())
        );
        site::loadView($parametersView);
    }

    function insert() {
        try {
            $arrayFlujoRutaAprendizaje = $_POST["data"];
            $this->load->model("RutaAprendizaje_model", "rutaAprendizaje", true);
            $data = array("nombre" => $_POST["nombre"], "data" => implode(',', $arrayFlujoRutaAprendizaje), "fecha_creacion" => "NOW()", "usuario_id" => 1);
            $this->rutaAprendizaje->create($data);
            echo "La ruta de aprendizaje se almacenó correctamente.";
        } catch (Exception $e) {
            echo error;
        }
    }

    function readFiles() {
        $tipoSistemaDigestivo = $_POST["tipoSistemaDigestivo"];
        $tipoArchivo = $_POST["tipoArchivo"];
        $directorioRuta = $_SERVER["DOCUMENT_ROOT"] . "ovasdh/multimedia/";
        $arrayFilesToReturn = array();
        switch ($tipoSistemaDigestivo) {
            case "bajo":
                break;
            case "medio":
                break;
            case "alto":
                break;
        }
        $directorioObject = opendir($directorioRuta . "Videos");
        $arrayVideos = array();
        while (false !== ($file = readdir($directorioObject))) {
            array_push($arrayVideos, $file);
        }
        $directorioObject = opendir($directorioRuta . "Comic");
        $arrayComic = array();
        while (false !== ($file = readdir($directorioObject))) {
            array_push($arrayComic, $file);
        }
        $directorioObject = opendir($directorioRuta . "Actividades");
        $arrayActividades = array();
        while (false !== ($file = readdir($directorioObject))) {
            array_push($arrayActividades, $file);
        }
        $arrayFilesToReturn = array("videos" => $arrayVideos, "comic" => $arrayComic, "actividades" => $arrayActividades);
        echo json_encode($arrayFilesToReturn);
    }

    function eliminar() {
        $this->load->library('session');
        if ($this->session->userdata("role_id") == 3) {
            $id_ruta = $_POST["idruta"];
            $this->load->model("rutaaprendizaje_model", "ruta", True);
            $this->ruta->delete($id_ruta);
            echo true;
        }else
            echo false;
    }

}

?>
