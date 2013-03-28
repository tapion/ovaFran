<style>
    #evaluacion{ width: 100%; text-align: center;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
        $(".deleteruta").click(function(){
            $.ajax({
                url: "<?php echo site_url("rutaAprendizaje/eliminar"); ?>",
                type: "POST",
                data: {"idruta": $(this).attr("ruta")},
                success: function(result){
                    if(result == 1){
                        alert("La ruta se eliminó correctamente.");
                        location.reload();
                    }
                    else
                        alert("El rol asignado a su usuario no puede realizár esta operación.");
                }
            });
});
});
var resultadoTest=0;
var valorAprobacionTest = 0;
var arrayEvaluacion =[]; 
var siguienteInstrumento = 1;
var intentosFallidos = 0;
var dataOcultar = "";
var htmlTest = "";
function sumar(valor){
resultadoTest = resultadoTest + valor;
}
function validarResultadoTest(){
if(parseInt(valorAprobacionTest) <= resultadoTest){
    alert('Muy bien!, El test fue superado correctamente. \n El resultado obtenido fue ' + resultadoTest + '/' + valorAprobacionTest);
    $.ajax({
        url: "<?php echo site_url("test/saveResultTest"); ?>",
        type: "POST",
        data: {"testid": arrayEvaluacion[4][0][0].toString() , "intentos": intentosFallidos },
        success: function(){
            //alert("Los resultados se almacenaron correctamente.");
            intentosFallidos = 0;
            window.location = '<?php echo base_url("index.php/responderRuta"); ?>';
        }
                
    });
}
else{
    if(siguienteInstrumento == 3)
        siguienteInstrumento = 1;
    else{
        siguienteInstrumento++;
        intentosFallidos++;
    }
    $("#evaluacion").html("");
    $("#evaluacion").html("");
    $("#evaluacion").html("");
    $("#evaluacion").html("");
    htmlTest = "";
    $("#test").html("");
    alert('Lo sentimos!, Vuelve a intentarlo. \n Resultado obtenido: ' + resultadoTest + '/' + valorAprobacionTest);
    ocultarRutasAprendizaje(dataOcultar);
    resultadoTest = 0;
            
}
}
function ocultarRutasAprendizaje(data){
dataOcultar = data;
data = data.split(',');
            
for (i = 0; i < 5; i++) {
    var arrayRutaAprendizajedata = [];
    if(i==0)
        arrayRutaAprendizajedata.push([data[i], data[5], "video"]);
    else if(i==1)
        arrayRutaAprendizajedata.push([data[i], data[6], "comic"]);
    else if(i==2)
        arrayRutaAprendizajedata.push([data[i], 0, "actividades"]);
    else if(i==3)
        arrayRutaAprendizajedata.push([data[i], data[8], "presentacion"]);
    else if(i==4)
        arrayRutaAprendizajedata.push([data[i], data[9], "test"]);
            
    arrayEvaluacion.push(arrayRutaAprendizajedata);
}
var htmlVideo = "";
var htmlActividad = "";
var htmlPresentacion = "";
var htmlcomic = "";
for(i=0; i <arrayEvaluacion.length; i++){
    if(arrayEvaluacion[i][0][2] == "actividades" && arrayEvaluacion[i][0][1] == 0){
        var rutaActividades = "http://clic.xtec.cat/db/jclicApplet.jsp?project=<?php echo base_url("multimedia/Actividades/"); ?>/" + arrayEvaluacion[i][0][0] + "&amp;lang=es";
        htmlActividad = "<legend>Actividad</legend><iframe width='600' height='400' frameborder='0' src='" + rutaActividades + "' ></iframe><br />";
    }
    if(arrayEvaluacion[i][0][2] == "test" && arrayEvaluacion[i][0][1] == 4){
        if(arrayEvaluacion[i][0][0] != ""){
            $.ajax({
                url: "<?php echo base_url("index.php/test/getTestHtml"); ?>",
                type: "GET",
                data: {"id": arrayEvaluacion[i][0][0]},
                success: function(html){
                    htmlTest = "<legend>Test Evaluativo</legend>" + html;
                    $("#test").html(htmlTest);
                    valorAprobacionTest = $("#valtest").val();
                },
                error: function(error){
                    alert("Error al generar el test seleccionado!");
                }
            });
        }
    }
    if(arrayEvaluacion[i][0][2] == "presentacion" && arrayEvaluacion[i][0][1] == siguienteInstrumento){
        var rutaPresentacion = "<?php echo base_url("multimedia/Presentaciones/"); ?>/" + arrayEvaluacion[i][0][0];
        htmlPresentacion = '<legend>Presentación</legend><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
        htmlPresentacion += '<param name="movie" value="'+rutaPresentacion+'" />';
        htmlPresentacion += '<param name="quality" value="high" />';
        htmlPresentacion += '<embed src="'+rutaPresentacion+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
        htmlPresentacion += '</object>';
    }
    else if(arrayEvaluacion[i][0][2] == "video" && arrayEvaluacion[i][0][1] == siguienteInstrumento){
        var nombreVideo = arrayEvaluacion[i][0][0];                
        if(nombreVideo == "alto.flv")
            htmlVideo = '<iframe width="420" height="315" src="http://www.youtube.com/embed/nz2Xx5jtXRQ" frameborder="0" allowfullscreen></iframe>';
        else if(nombreVideo == "medio.flv")
            htmlVideo = '<iframe width="420" height="315" src="http://www.youtube.com/embed/xDDJVpPJjkk" frameborder="0" allowfullscreen></iframe>';
        else if(nombreVideo == "bajo.flv")
            htmlVideo = '<iframe width="420" height="315" src="http://www.youtube.com/embed/R76OAk0FM5Q" frameborder="0" allowfullscreen></iframe>';
    }
    else if(arrayEvaluacion[i][0][2] == "comic" && arrayEvaluacion[i][0][1] == siguienteInstrumento){
        var rutaComic = '<?php echo base_url("multimedia/Comic/"); ?>/' + arrayEvaluacion[i][0][0];
        htmlcomic = '<legend>Comic</legend><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
        htmlcomic += '<param name="movie" value="'+ rutaComic +'" />';
        htmlcomic += '<param name="quality" value="high" />';
        htmlcomic += '<embed src="'+ rutaComic +'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
        htmlcomic += '</object>';
    }
}
        
$("#rutasAprendizaje").css("display","none");    
$("#contentEvaliuacion").css("display","block");
$("#evaluacion").append(htmlPresentacion);
$("#evaluacion").append(htmlVideo);
$("#evaluacion").append(htmlcomic);
$("#evaluacion").append(htmlActividad);
}
</script>
<h1>Listado de Rutas de aprendizaje a responder</h1>
<table id="rutasAprendizaje" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>EVALUACIÓN</th> <th>SELECCIONAR</th> <th>ELIMINAR</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($arrauRutasAprendizaje as $arrayItem) {
            $registroRutaAprendizaje = "<tr><td>%s</td><td><input type='button' class='btn btn-large btn-inverse' onclick='ocultarRutasAprendizaje(\"%s\");' value='Realizar Evaluación'/></td><td><button id='del$arrayItem->id' class='btn btn-danger deleteruta' ruta='$arrayItem->id'>Eliminar Ruta de Aprendizaje</button></td></tr>";
            echo sprintf($registroRutaAprendizaje, strtoupper($arrayItem->nombre), $arrayItem->data);
        }
        ?>
    </tbody>
</table>
<div id="contentEvaliuacion" style="display: none;">
    <h1>Ruta de Aprendizaje</h1>
    <div id="evaluacion"></div>
    <div id="test"></div>
</div>
