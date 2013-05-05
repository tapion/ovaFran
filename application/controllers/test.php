<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class Test extends CI_Controller {

    function index() {
        $this->load->model("Test_model", '', true);
        $dataTest = $this->Test_model->todosConTotal();
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
        $row = $this->Test_model->todosConTotal("tes.id = $id")->result();
        $variables = array();
        $variables["totPreguntas"] = $row[0]->total;
        $variables["id"] = $id;
        $variables["fechacreacion"] = $row[0]->fechacreacion;
        $variables["nombre"] = (isset($row[0]->nombre))?$row[0]->nombre:"";
        $variables["valor"] = $row[0]->valor;
        $variables["tipo"] = $row[0]->tipo;
        $variables["placeholder"] = 'Nombre No Asignado ...';
        $parametersView = array(
            array("view" => 'test/update_view', "parameters" => $variables)
        );
        site::loadView($parametersView);
    }

    function insert() {
        $nombre = $_POST["nombre"];
        $tipo = $_POST["tipo"];
        $this->load->model("Test_model", '', true);
        $data = array("nombre" => $nombre, "tipo" => $tipo, "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1);
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
        $testArray = $this->Test->getTestForSistem($this->input->post("tipoSistemaDigestivo"));
        echo json_encode($testArray->result());
    }

    function getTestHtml() {
        try {
            $id = $_GET["id"];
            $names = array();
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
                array_push($names, 'preg'.$itemPregunta->id);
                $textoPregunta = "<li><p class='pPregunta'>$itemPregunta->pregunta:</p>";
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
                        $html .= "<li><input style='display: inline-block;' name='preg$itemPregunta->id' type='radio' $funcionJavaScriptSuma id='radio$itemRespuesta->id' value='$itemRespuesta->id'/><label class='lbRespuesta' for='radio$itemRespuesta->id'>$itemRespuesta->texto</label></li>";
                        $consecutivoRespuesta++;
                    }
                    $cantidadPreguntas++;
                }
                $html .= "</ol></li>";
            }
            $html .= "</ol><br/><input type='hidden' id='valtest' value='$valortest'/> <button class='btn btn-large btn-inverse' onclick=\"validarResultadoTest();\">Terminar test</button>";
            echo json_encode(array("nombres"=>$names,"html"=>$html));
        } catch (Exception $exc) {
            echo "";
        }
    }

    function saveResultTest() {
        $testid = $_POST["testid"];
        $intentos = $_POST["intentos"];
        $rutaaprendizajeId = $this->input->post("rutaId");
        $ultimoOrden = $this->input->post("ultimoOrden");
        $this->load->model("Respuestas_model", "respuestas", True);
        $this->respuestas->insertResultadosTest($this->session->userdata("username"), $testid, $intentos,$rutaaprendizajeId,$ultimoOrden);
        return true;
    }

    function eliminar() {
        $idtest = $_POST["idtest"];
        $this->load->model("test_model", "Test", True);
        $this->Test->delete($idtest);
        echo true;
    }

}

