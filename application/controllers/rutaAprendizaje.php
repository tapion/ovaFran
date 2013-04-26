<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("site.php");

class rutaAprendizaje extends CI_Controller {

    function index($sistemaCodigo = "") {
        $this->load->model("Sistemas_digestivos_model", 'sistemas_digestivos', true);
        $sistemas = $this->sistemas_digestivos->selectAll();
        $parametersView = array(
            array("view" => 'rutaAprendizaje/index', "parameters" => array("sistemas" => $sistemas,"codigoSistema"=>$sistemaCodigo))
        );
        site::loadView($parametersView);
    }

    function insert() {
        try {
            $arrayFlujoRutaAprendizaje = $_POST["data"];
            $this->load->model("RutaAprendizaje_model", "rutaAprendizaje", true);
            $data = array("nombre" => $_POST["nombre"], "data" => implode(',', $arrayFlujoRutaAprendizaje), "fecha_creacion" => "NOW()", "usuario_id" => 1,"sistema_digestivo_codigo"=>$_POST["sistema"]);
            if ($this->input->post("id") > 0) {
                $this->rutaAprendizaje->edita($data, $this->input->post("id"));
            } else {
                $this->rutaAprendizaje->create($data);
            }
            echo "La ruta de aprendizaje se almacenó correctamente.";
        } catch (Exception $e) {
            echo error;
        }
    }

    public function validaExistenciaRuta() {
        $respuesta = array();
        $respuesta["ok"] = true;
        try {
            $this->load->model("RutaAprendizaje_model", "rutaAprendizaje", true);
            $rutas = $this->rutaAprendizaje->existeRutaAprendizaje($this->input->post("sistema"));
            if ($rutas->num_rows() > 0) {
                $rutas = $rutas->result();
                $respuesta["estado"] = 1;
                $respuesta["id"] = $rutas[0]->id;
                $respuesta["mensaje"] = "Esta editando la ruta de aprendizaje";
                $orden = explode(",",$rutas[0]->data);
                if(count($orden) < 10){
                    throw new Exception("Error en la longitud de los datos");
                }
                $ordenLista = "";
                for($c = count($orden) - 6;$c < count($orden); $c++){
                    $ordenLista .= $orden[$c].",";
                }
                $respuesta["orden"] =  trim($ordenLista,",");
                $respuesta["nombre"] =  $rutas[0]->nombre;
            } else {
                $respuesta["estado"] = 2;
                $respuesta["mensaje"] = "Esta creando una ruta de aprendizaje";
            }
            echo json_encode($respuesta);
        } catch (Exception $e) {
            $respuesta["ok"] = false;
            $respuesta["mensaje"] = $e->getMessage();
        }
    }

    function readFiles() {
        $tipoSistemaDigestivo = $_POST["tipoSistemaDigestivo"];
        $tipoArchivo = $_POST["tipoArchivo"];
        $directorioRuta = $_SERVER["DOCUMENT_ROOT"] . "/" . PROJECT_NAME . "/multimedia/";
        $arrayFilesToReturn = array();
        switch ($tipoSistemaDigestivo) {
            case "bajo":
                break;
            case "medio":
                break;
            case "alto":
                break;
        }
        $arrayVideos = array();
        $arrayComic = array();
        $arrayActividades = array();
        if (is_dir($directorioRuta . "Videos")) {
            $directorioObject = opendir($directorioRuta . "Videos");
            if ($directorioObject) {
                while (false !== ($file = readdir($directorioObject))) {
                    array_push($arrayVideos, $file);
                }
            }
        }
        if (is_dir($directorioRuta . "Comic")) {
            $directorioObject = opendir($directorioRuta . "Comic");
            if ($directorioObject) {
                while (false !== ($file = readdir($directorioObject))) {
                    array_push($arrayComic, $file);
                }
            }
        }
        if (is_dir($directorioRuta . "Actividades")) {
            $directorioObject = opendir($directorioRuta . "Actividades");
            if ($directorioObject) {
                while (false !== ($file = readdir($directorioObject))) {
                    array_push($arrayActividades, $file);
                }
            }
        }
        $arrayFilesToReturn = array("videos" => $arrayVideos, "comic" => $arrayComic, "actividades" => $arrayActividades);
        echo json_encode($arrayFilesToReturn);
    }

    function eliminar() {
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
