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
        $names = array();
        $html = "<ol>";
        $subcategorias = $this->Subcategorias->getsubcategoriasFinalQuestionary();
        foreach ($subcategorias->result() as $subcategoria) {
            $dataTest = $this->Preguntas->readFinalQuestionary($subcategoria->subcategoria);
            foreach ($dataTest->result() as $itemPregunta) {
                array_push($names,'preg'.$itemPregunta->id);
                $arrayRespuestas = $this->Respuestas->read($itemPregunta->id);
                if($arrayRespuestas->num_rows() <= 0){
                    continue;
                }
                $textoPregunta = "<li><p class='pPregunta'>$itemPregunta->pregunta:</p>";
                $respuestaCorrecta = $itemPregunta->respuestacorrecta;
                $arrayImagenes = $this->Imagenes->read($itemPregunta->id);
                foreach ($arrayImagenes->result() as $itemImagen) {
                    $textoPregunta = str_replace("[" . $itemImagen->nombre . "]", "<img width='70px' height='70px' class='img-polaroid' src='" . base_url("files") . "/$itemImagen->ruta'/>", $textoPregunta);
                }
                $html .= $textoPregunta;
                $html .= "<ol type='A' style='font-weight: bold;'>";
                $consecutivoRespuesta = 1;
                foreach ($arrayRespuestas->result() as $itemRespuesta) {
                    if ($consecutivoRespuesta <= 4) {
                        $funcionJavaScriptSuma = 0;
                        if ($consecutivoRespuesta == $respuestaCorrecta)
                            $funcionJavaScriptSuma = 1;
                        $subcategoriaTexto = str_replace(" ", "_", $subcategoria->subcategoria);
                        $html .= "<li><input style='display: inline-block;' class='". $subcategoriaTexto ."' name='preg$itemPregunta->id' type='radio' correcta='$funcionJavaScriptSuma' id='radio$itemRespuesta->id' value='$itemRespuesta->id'/><label class='lbRespuesta' for='radio$itemRespuesta->id'>$itemRespuesta->texto</label></li>";
                        $consecutivoRespuesta++;
                    }
                }
                $html .= "</ol></li>";
            }
        }
        $html .= "</ol><br/><button id='finexamen' class='btn btn-large btn-inverse'>Guardar y enviar</button>";
        $username = $this->session->userdata("username");
        $parameters = array('html' => $html, 'subcategorias' => json_encode($subcategorias->result()), 'user'=> $username,"nombres"=>  json_encode($names));
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
        $arraySubcategorias = explode(',',$Subcategorias);
        $arrayResultados = explode(',',$Resultados);
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
            if($item->username == ""){
                continue;
            }
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
    public function estadisticasGenerales(){
        $this->load->model("Respuestas_model", 'respuestas', true);
        $datosReporte = $this->respuestas->obtieneResultadosGenerales();
        $datos = array();
        array_push($datos,array('Proceso','Bueno','Regular','Malo'));
        foreach($datosReporte->result() as $proceso){
            array_push($datos,array($proceso->subcategoria,intval($proceso->Bueno),intval($proceso->Regular),intval($proceso->Malo)));
        }
        echo json_encode($datos);
    }

}