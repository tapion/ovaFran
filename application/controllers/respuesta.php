<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Respuesta extends CI_Controller {

    function agregar() {
        $pregunta_id = $_POST["pregunta_id"];
        $respuesta1 = $_POST["respuesta1"];
        $respuesta2 = $_POST["respuesta2"]; 
        $respuesta3 = $_POST["respuesta3"];
        $respuesta4 = $_POST["respuesta4"]; 
        $action = $_POST["action"];
        $this->load->model('Respuestas_model', '', true);
        switch ($action) {
            case "add":
                $texto = "";
                for ($i = 0; $i < 4; $i++) {
                    switch ($i) {
                        case 0:
                            $texto = $respuesta1;
                            break;
                        case 1:
                            $texto = $respuesta2;
                            break;
                        case 2:
                            $texto = $respuesta3;
                            break;
                        case 3:
                            $texto = $respuesta4;
                            break;
                    }
                    $texto = str_replace("%20", " ", $texto);
                    $data = array(
                        'pregunta_id' => $pregunta_id,
                        'texto' => $texto,
                        'fechacreacion' => date("Y/m/d H:i:s"),
                        'fechaactualizacion' => date("Y/m/d H:i:s"),
                        'usuario_id' => 1);
                    $this->Respuestas_model->create($data);
                }
                echo "Las respuestas se almacenaron correctamente";
                break;
            case "update":
                $arrayRespuestas = $this->Respuestas_model->read((int) $pregunta_id);
                $countRecords = 0;
                foreach ($arrayRespuestas->result() as $itemRespuesta) {
                    $texto = "";
                    switch ($countRecords) {
                        case 0:
                            $texto = $respuesta1;
                            break;
                        case 1:
                            $texto = $respuesta2;
                            break;
                        case 2:
                            $texto = $respuesta3;
                            break;
                        case 3:
                            $texto = $respuesta4;
                            break;
                    }
                    $texto = str_replace("%20", " ", $texto);
                    $data = array(
                        'texto' => $texto,
                        'fechaactualizacion' => date("Y/m/d H:i:s"),
                        'usuario_id' => 1);
                    $this->Respuestas_model->update($itemRespuesta->id, $data);
                    $countRecords++;
                }
                echo "Las respuestas se actualizaron correctamente";

                break;
        }
    }

    function obtener($pregunta_id) {
        $this->load->model('Respuestas_model', '', true);
        $arrayRespuestas = $this->Respuestas_model->read((int) $pregunta_id);
        echo json_encode($arrayRespuestas->result());
    }

    function update($pregunta_id) {
        $this->load->model('Respuestas_model', '', true);
        $arrayRespuestas = $this->Respuestas_model->read((int) $pregunta_id);
        echo json_encode($arrayRespuestas->result());
    }

}
