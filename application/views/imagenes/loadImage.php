<script type="text/javascript">
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "<?php echo site_url("respuesta/obtener/$id"); ?>",
            dataType: 'json',
            success: function(result){
                if(result[0] != undefined){
                    for (i = 0; i < 4; i++) {
                        switch (i) {
                            case 0:
                                $("#respuestaOne").val(result[i].texto);
                                break;
                            case 1:
                                $("#respuestaTwo").val(result[i].texto);
                                break;
                            case 2:
                                $("#respuestaThree").val(result[i].texto);
                                break;
                            case 3:
                                $("#respuestaFour").val(result[i].texto);
                                break;
                        }
                    }
                    $("#action").val("update");
                }
            },
            error: function(error){ aler(error);}
        });
        $.ajax({
            type: "GET",
            url: "<?php echo site_url("imagen/obtener/$id/$test_id"); ?>",
            dataType: 'json',
            success: function(result){
                var count = 0;
                for ( item in result)
                {
                    if(item != undefined)
                        count++;
                }
                if(result[0] != undefined){
                    for (i = 0; i < count; i++) {
                        arrayImagenes.push([result[i].nombre, "<img width='70px' height='70px' class='img-polaroid' src='<?php echo base_url("files"); ?>/" + result[i].ruta + "'/>"]);
                        $("#imagenesCargadas").append("<div id='imagen" + result[i].id + "'><legend>" + result[i].nombre + "</legend><img width='70px' height='70px' class='img-polaroid' src='<?php echo base_url("files"); ?>/" + result[i].ruta + "'/> <input type='button' class='btn' onclick='eliminarImagen(" + result[i].id + ");' value='Eliminar Imagen'/></div>");
                    }
                }
            },
            error: function(error){
                aler(error);
            }
        });
        $("#saveRespuestas").click(function(){
            if(datosPreguntaCompletos()){
                if(respuestasIngresadas()){
                    $.ajax({
                        url: "<?php echo site_url("respuesta/agregar/"); ?>",
                        type: "POST",
                        data: {"pregunta_id": "<?php echo $id; ?>", "respuesta1" : $("#respuestaOne").val(), "respuesta2" : $("#respuestaTwo").val(), "respuesta3" : $("#respuestaThree").val(),"respuesta4" : $("#respuestaFour").val(), "action" : $("#action").val()},
                        success: function(result){
                            alert(result);
                            document.getElementById("frmTest").submit();
                        },
                        error: function(error){aler(error);}
                    });
                }else{
                    alert("Debe ingresar las cuatro respuestas a la pregunta");
                    return false;
                }
            }else{
                return false;
            }
        });
        function respuestasIngresadas(){
            if(document.getElementById("respuestaOne").value == ""){
                alert("Debe ingresar un valor en la respuesta uno");
                return false;
            }
            if(document.getElementById("respuestaTwo").value == ""){
                alert("Debe ingresar un valor en la respuesta dos");
                return false;
            }
            if(document.getElementById("respuestaThree").value == ""){
                alert("Debe ingresar un valor en la respuesta tres");
                return false;
            }
            if(document.getElementById("respuestaFour").value == ""){
                alert("Debe ingresar un valor en la respuesta cuatro");
                return false;
            }
            return true;
        }
        $("#updateRespuestas").click(function(){
            $.ajax({
                url: "<?php echo site_url("respuesta/update/"); ?>",
                type: "POST",
                data: {"respuesta1" : $("#respuestaOne").val(), "respuesta2" : $("#respuestaTwo").val(), "respuesta3" : $("#respuestaThree").val(),"respuesta4" : $("#respuestaFour").val(), "action" : $("#action").val()},
                success: function(result){alert(result);},
                error: function(error){aler(error);}
            });
        });
        for (var item in arrayImagenes) {
            var search = "["+arrayImagenes[item][0]+"]";
            textPregunta = textPregunta.replace(search," " + arrayImagenes[item][1] + " ");
        }
        $("#prevPregunta").html(textPregunta);
    });
    function eliminarImagen(id){
        alert("imagen"+id);
        $.ajax({
            type: "GET",
            url: "<?php echo site_url("imagen/eliminar"); ?>/" + id,
            success: function(result){ 
                $("#imagen"+id).hide();
            },
            error: function(error){aler(error);}
        });
    }
    function existeImagen(){
        if(document.getElementById("imagenLoad").value ==""){
            alert("Debe elegir primero la imagen a cargar");
            return false;
        }
        
    }
</script>
<style>
    input[type='text'], input[type='submit'], input[type='button']{display: block;}
</style>
<div id="modRespuestas">
    <legend><h1>Respuestas para pregunta</h1></legend>
    <legend>Respuesta No. 1</legend>
    <input id="respuestaOne" name="respuestaOne" type="text" placeholder="Ingrese texto..." value=""/>
    <legend>Respuesta No. 2</legend>
    <input id="respuestaTwo" name="respuestaTwo" type="text" placeholder="Ingrese texto..." value=""/>
    <legend>Respuesta No. 3</legend>
    <input id="respuestaThree" name="respuestaThree" type="text" placeholder="Ingrese texto..." value=""/>
    <legend>Respuesta No. 4</legend>
    <input id="respuestaFour" name="respuestaFour" type="text" placeholder="Ingrese texto..." value=""/>
    <input type="hidden" id="action" value="add" />
    <input name="saveRespuestas" id="saveRespuestas" type="submit" value="Guardar preguntas y respuestas" class="btn  btn-primary" />
</div>
<div>
<!--    <legend>Carga de Imagenes</legend>
    <form action="<?php echo site_url("imagen/cargarImagen/$id/$test_id"); ?>" onsubmit="return existeImagen();" method="POST" enctype="multipart/form-data">
        <label for="file">Seleccione la imagen a cargar:</label>
        <input name="file" type="file" id="imagenLoad" />
        <input name="nombre" type="text" placeholder="Nombre de Imagen" value="" />
        <input type="submit" value="Agregar Imagen" class="btn  btn-primary" />
    </form>
    <legend><h1>Listado de imagenes cargadas</h1></legend>
    <div id="imagenesCargadas"></div>-->
    <br/>
    <br/>
</div>
