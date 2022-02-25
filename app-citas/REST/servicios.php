<?php
header('Access-Control-Allow-Origin: *'); 
header('Content-Type: application/json;charset=utf-8');
/**
 * Servicios externos para la aplicacion
 */
include_once ("externos.php");

class formulario extends Base {
  
  // PERMITE LISTAR LOS ELEMENTOS DE LA BASE DE DATOS
  function listar(){
     //$this->validar();
    $sql = "SELECT * FROM servicios WHERE visible=1";
    $data = $this->db->select_all($sql);

    $result = array();
    $result['msg']='ok';
    $result['data']=$data;
    $result['error']=false;
    echo json_encode($result);
  }

  // PERMITE REGISTRAR LOS ELEMENTO A LA BASE DE DATOS
  function registrar(){
    $insert = $_POST;
    unset($insert['id']); // SE ELIMINA LA ID

    $insert['visible'] = 1;
    $insert['fechar'] = date("y-m-d h:i:s");

    $this->db->insert("servicios",$insert);

    $result = array();
    $result['msg']='Registro exitoso';
    $result['data']= $this->db->last_insert_id();
    $result['error']=false;
    echo json_encode($result);
  }

  // PERMITE REGISTRAR LOS ELEMENTO A LA BASE DE DATOS
  function actualizar(){
    
    $idu = $_POST['id'];
    $update = $_POST;
    unset($update['id']); // SE ELIMINA LA ID

    $this->db->update("servicios",$update,array('id_servicios'=>$idu));

    $result = array();
    $result['msg']='Registro actualizado';
    $result['data']=$idu;
    $result['error']=false;
    echo json_encode($result);
  }


  function eliminar(){
    
    $ide = $_POST['id'];
    $update = array();
    $update['visible']=2;
    $this->db->update("servicios",$update,array('id_servicios'=>$ide)); 

    $result = array();
    $result['msg']='Registro eliminado';
    $result['data']=$ide;
    $result['error']=false;
    echo json_encode($result);
  }

}



// Recibir por GET
$accion  = $_GET['accion'];
$formulario = new formulario();
$formulario->$accion();


?>