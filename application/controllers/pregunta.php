<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class Pregunta extends CI_Controller {

    function index($id) {
        $this->load->model("preguntas_model", '', true);
        $dataTest = $this->preguntas_model->readTest($id);
        $parameters = array("preguntasArray" => $dataTest, "id" => $id);
        $parametersView = array(
            array("view" => 'preguntas/index', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

    function form_new($id) {
        $categoria = $this->getCategoriaTest($id);
        $arraySubcategorias = "";
        if($id == "-1")
            $arraySubcategorias = $this->getSubcategorias("final");
        else
            $arraySubcategorias = $this->getSubcategorias($categoria);
        $parametersView = array(
            array("view" => 'preguntas/new_view', "parameters" => array("id" => $id, 'arraySubcategorias' => $arraySubcategorias))
        );
        site::loadView($parametersView);
    }

    function form_update($id, $test) {
        $categoria = $this->getCategoriaTest($test);
        $arraySubcategorias = "";
        if($test == "-1")
            $arraySubcategorias = $this->getSubcategorias("final");
        else
            $arraySubcategorias = $this->getSubcategorias($categoria);
        $this->load->model("Preguntas_model", '', true);
        $row = $this->Preguntas_model->read($id);
        $item = $row->result();
        $parametersView = array(
            array("view" => 'preguntas/update_new', "parameters" => array("id" => $id, "test" => $test, "arraySubcategorias" => $arraySubcategorias, "pregunta" => $item[0]->pregunta == null ? "" : $item[0]->pregunta, "valor" => $item[0]->valor == null ? "" : $item[0]->valor, "respuestacorrecta" => $item[0]->respuestacorrecta == null ? "" : $item[0]->respuestacorrecta, "subcategoria" => $item[0]->subcategoria)),
            array("view" => 'imagenes/loadImage', "parameters" => array("id" => $id, "test_id" => $test)),
        );
        site::loadView($parametersView);
    }

    function insert($id) {
        $this->load->model("Preguntas_model", '', true);
        $pregunta = $_POST["pregunta"];
        $valor = $_POST["valor"];
        $respuestacorrecta = $_POST["respuestacorrecta"];
        $subcategorias = $_POST["subcategorias"];
        $idtest = $id;
        $data = array("pregunta" => $pregunta, "valor" => (int) $valor, "respuestacorrecta" => (int) $respuestacorrecta, "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1, "idtest" => $idtest, "subcategoria" => $subcategorias);
        $this->Preguntas_model->create($data);
        redirect(site_url("pregunta/index/$id"));
    }

    function update($id, $idtest) {
        $this->load->model("Preguntas_model", '', true);
        $pregunta = $_POST["pregunta"];
        $valor = $_POST["valor"];
        $subcategorias = $_POST["subcategorias"];
        $respuestacorrecta = $_POST["respuestacorrecta"];
        $data = array("pregunta" => $pregunta, "valor" => (int) $valor, "respuestacorrecta" => (int) $respuestacorrecta, "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1, "subcategoria" => $subcategorias);
        $this->Preguntas_model->update($id, $data);
        redirect(site_url("pregunta/index/$idtest"));
    }

    function getSubcategorias($categoria) {
        $this->load->model("Subcategorias_model", "Subcategorias", true);
        $subcategoriasArray = $this->Subcategorias->getsubcategorias($categoria);
        return $subcategoriasArray;
    }

    function getCategoriaTest($id) {
        $this->load->model("Test_model", "test", true);
        $testData = $this->test->selectOne($id);
        $categoria = "";
        foreach ($testData->result() as $itemTest) {
            $categoria = $itemTest->tipo;
        }
        return $categoria;
    }
    
    function eliminar(){
        $id_pregunta = $_POST["idpregunta"];
        $this->load->model("preguntas_model","Preguntas", True);
        $this->Preguntas->delete($id_pregunta);
        echo true;
    }

}

