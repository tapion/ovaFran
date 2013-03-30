<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class Test extends CI_Controller {

    function index() {
        $this->load->model("Test_model", '', true);
        $dataTest = $this->Test_model->selectAll();
        $parameters = array("testArray" => $dataTest);
        $parametersView = array(
            array("view" => 'test/list_view', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

    function form_new() {
        $parametersView = array(
            array("view" => 'test/new_view', "parameters" => '')
        );
        site::loadView($parametersView);
    }

    function form_update($id) {
        $this->load->model("Test_model", '', true);
        $row = $this->Test_model->selectOne($id)->result();
        if (isset($row[0]->nombre))
            $parameters = array("id" => $id, "fechacreacion" => $row[0]->fechacreacion, "nombre" => $row[0]->nombre, "valor" => $row[0]->valor, "tipo" => $row[0]->tipo, "placeholder" => 'Nombre No Asignado ...');
        else
            $parameters = array("id" => $id, "fechacreacion" => $row[0]->fechacreacion, "nombre" => '', "placeholder" => 'Nombre No Asignado ...');

        $parametersView = array(
            array("view" => 'test/update_view', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

    function insert() {
        $nombre = $_POST["nombre"];
        $valor = $_POST["valor"];
        $tipo = $_POST["tipo"];
        $this->load->model("Test_model", '', true);
        $data = array("nombre" => $nombre, "valor" => $valor, "tipo" => $tipo, "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1);
        $this->Test_model->create($data);
        redirect(site_url("test/index"));
    }

    function update() {
        $id = $_POST["id"];
        $nombre = $_POST["nombre"];
        $valor = $_POST["valor"];
        $tipo = $_POST["tipo"];
        $fechacreacion = $_POST["fechacreacion"];
        $this->load->model("Test_model", '', true);
        $data = array("id" => (int) $id, "nombre" => $nombre, "valor" => $valor, "tipo" => $tipo, "fechacreacion" => $fechacreacion, "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1);
        $this->Test_model->update($data);
        redirect(site_url("test/index"));
    }

    function getTest() {
        $this->load->model("Test_model", 'Test', true);
        $testArray = $this->Test->selectAll();
        echo json_encode($testArray->result());
    }

    function getTestHtml() {
        try {
            $id = $_GET["id"];
            $this->load->model("Test_model", 'Test', true);
            $this->load->model("Preguntas_model", 'Preguntas', true);
            $this->load->model("Respuestas_model", 'Respuestas', true);
            $this->load->model("Imagenes_model", 'Imagenes', true);
            $testColleccion = $this->Test->selectOne($id);
            $testItem = $testColleccion->result();
            $valortest = $testItem[0]->valor;
            $html = "<ol>";
            $dataTest = $this->Preguntas->readTest($id);
            foreach ($dataTest->result() as $itemPregunta) {
                $textoPregunta = "<li><p>$itemPregunta->pregunta:</p>";
                $respuestaCorrecta = $itemPregunta->respuestacorrecta;
                $valorRespuestaCorrecta = $itemPregunta->valor;
                $arrayImagenes = $this->Imagenes->read($itemPregunta->id);
                foreach ($arrayImagenes->result() as $itemImagen) {
                    $textoPregunta = str_replace("[" . $itemImagen->nombre . "]", "<img width='70px' height='70px' class='img-polaroid' src='" . base_url("files") . "/$itemImagen->ruta'/>", $textoPregunta);
                }
                $html .= $textoPregunta;
                $arrayRespuestas = $this->Respuestas->read($itemPregunta->id);
                $html .= "<ol type='A' style='font-weight: bold;'>";
                $consecutivoRespuesta = 1;
                $cantidadPreguntas = 0;
                foreach ($arrayRespuestas->result() as $itemRespuesta) {
                    if ($cantidadPreguntas <= 3) {
                        $funcionJavaScriptSuma = "";
                        if ($consecutivoRespuesta == $respuestaCorrecta)
                            $funcionJavaScriptSuma = "onclick='sumar($valorRespuestaCorrecta);'";
                        $html .= "<li><input style='display: inline-block;' name='preg$itemPregunta->id' type='radio' $funcionJavaScriptSuma id='radio$itemRespuesta->id' value='$itemRespuesta->id'/><label style='display: inline-block; margin-left: 10px;' for='radio$itemRespuesta->id'>$itemRespuesta->texto</label></li>";
                        $consecutivoRespuesta++;
                    }
                    $cantidadPreguntas++;
                }
                $html .= "</ol></li>";
            }
            $html .= "</ol><br/><input type='hidden' id='valtest' value='$valortest'/> <button class='btn btn-large btn-inverse' onclick=\"validarResultadoTest();\">Terminar Test</button>";
            echo $html;
        } catch (Exception $exc) {
            echo "";
        }
    }

    function saveResultTest() {
        $testid = $_POST["testid"];
        $intentos = $_POST["intentos"];
        $this->load->library('session');
        $this->load->model("Respuestas_model", "respuestas", True);
        $this->respuestas->insertResultadosTest($this->session->userdata("username"), $testid, $intentos);
        return true;
    }

    function eliminar() {
        $idtest = $_POST["idtest"];
        $this->load->model("test_model", "Test", True);
        $this->Test->delete($idtest);
        echo true;
    }

}
