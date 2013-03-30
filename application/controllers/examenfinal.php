<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class examenfinal extends CI_Controller {

    function index() {
        $this->load->model("Subcategorias_model", 'Subcategorias', true);
        $this->load->model("Preguntas_model", 'Preguntas', true);
        $this->load->model("Respuestas_model", 'Respuestas', true);
        $this->load->model("Imagenes_model", 'Imagenes', true);
        $html = "<ol>";
        $subcategorias = $this->Subcategorias->getsubcategoriasFinalQuestionary();
        foreach ($subcategorias->result() as $subcategoria) {
            $dataTest = $this->Preguntas->readFinalQuestionary($subcategoria->subcategoria);
            foreach ($dataTest->result() as $itemPregunta) {
                $textoPregunta = "<li><p>$itemPregunta->pregunta:</p>";
                $respuestaCorrecta = $itemPregunta->respuestacorrecta;
                $arrayImagenes = $this->Imagenes->read($itemPregunta->id);
                foreach ($arrayImagenes->result() as $itemImagen) {
                    $textoPregunta = str_replace("[" . $itemImagen->nombre . "]", "<img width='70px' height='70px' class='img-polaroid' src='" . base_url("files") . "/$itemImagen->ruta'/>", $textoPregunta);
                }
                $html .= $textoPregunta;
                $arrayRespuestas = $this->Respuestas->read($itemPregunta->id);
                $html .= "<ol type='A' style='font-weight: bold;'>";
                $consecutivoRespuesta = 1;
                foreach ($arrayRespuestas->result() as $itemRespuesta) {
                    if ($consecutivoRespuesta <= 4) {
                        $funcionJavaScriptSuma = 0;
                        if ($consecutivoRespuesta == $respuestaCorrecta)
                            $funcionJavaScriptSuma = 1;
                        $subcategoriaTexto = str_replace(" ", "_", $subcategoria->subcategoria);
                        $html .= "<li><input style='display: inline-block;' class='". $subcategoriaTexto ."' name='preg$itemPregunta->id' type='radio' correcta='$funcionJavaScriptSuma' id='radio$itemRespuesta->id' value='$itemRespuesta->id'/><label style='display: inline-block; margin-left: 10px;' for='radio$itemRespuesta->id'>$itemRespuesta->texto</label></li>";
                        $consecutivoRespuesta++;
                    }
                }
                $html .= "</ol></li>";
            }
        }
        $html .= "</ol><br/><button id='finexamen' class='btn btn-large btn-inverse'>Guardar y Enviar</button>";
        $this->load->library('session');
        $username = $this->session->userdata("username");
        $parameters = array('html' => $html, 'subcategorias' => json_encode($subcategorias->result()), 'user'=> $username);
        $parametersView = array(
            array("view" => 'examenfinal/index', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }
    
    function almacenarExamenFinal(){
        $username = $_POST["username"];
        $Subcategorias  = $_POST["arraySubcategorias"];
        $Resultados = $_POST["arrayResultados"];
        $this->load->model("Respuestas_model", 'Respuestas', true);
        $arraySubcategorias = split(',',$Subcategorias);
        $arrayResultados = split(',',$Resultados);
        $fechacreacion = date('d/m/y H:m:s');
        echo count($arraySubcategorias);
        $this->Respuestas->deleteResultadosUsuario($username);
        for($item = 0;$item < count($arraySubcategorias);$item++){
            $this->Respuestas->insertResultadosRespuestas($username, $arraySubcategorias[$item], $arrayResultados[$item], $fechacreacion);   
        }
        return "true";
    }
    function verResultadosFinalesView(){
        
        $this->load->model("Respuestas_model", 'respuestas', true);
        $usersCol = $this->respuestas->consultarUsuarios();
        $htmlUsers = "";
        foreach ($usersCol->result() as $item){
            $htmlUsers .= "<option value='$item->username'>$item->username</option>";
        }
        $parameters = array('users' => $htmlUsers);
         $parametersView = array(
            array("view" => 'examenfinal/resultados', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }
    function verResultadosFinales(){
        $this->load->model("Respuestas_model", 'respuestas', true);
        $return = "";
        $username = $_POST["userid"];
        $usersCol = $this->respuestas->consultarResultadosFinal($username);
        foreach ($usersCol->result() as $item){
            $return .= "<tr><td>$item->subcategoria</td><td>$item->resultado</td></tr>";
        }
        echo $return;
    }

}