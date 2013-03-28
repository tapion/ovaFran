<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once("pregunta.php");
class Imagen extends CI_Controller{
    function cargarImagen($id, $test_id){
        $ruta = $_FILES["file"]["name"];
        $nombre = $_POST["nombre"];
        $destino = "files/".$_FILES["file"]["name"];
        $pregunta_id = $id;
        $this->load->model('Imagenes_model','',true);
        $data = array('ruta'=>$ruta, 'nombre'=>$nombre, 'pregunta_id'=>$pregunta_id);
        $okInsert = $this->Imagenes_model->create($data);
        
        if($okInsert){
            if(copy($_FILES["file"]["tmp_name"], $destino))
                redirect("pregunta/form_update/$id/$test_id");
            else
                echo "Error";
        }
        else
            echo "Error";
    }
    function obtener($pregunta_id) {
        $this->load->model('Imagenes_model', '', true);
        $arrayImagenes = $this->Imagenes_model->read((int)$pregunta_id);
        echo json_encode($arrayImagenes->result());
    }
    function eliminar($id) {
        $this->load->model('Imagenes_model', '', true);
        $result = $this->Imagenes_model->delete($id);
        echo "ok";
    }
}
