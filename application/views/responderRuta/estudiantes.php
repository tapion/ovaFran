<style>
    #evaluacion{ width: 100%; text-align: center;}
    .divElementosOrden{display: none;}
    #divActividad{display: none;}
</style>
<script type="text/javascript">
    var GLOBAL = {
        elementosEnOrden:[],
        nombresPreguntas: [],
        rutaAprendizajeView:'',
        rutaAprendizajeId: 0,
        ordenVisualizar: 0,
        srcActividad: "http://clic.xtec.cat/db/jclicApplet.jsp?project=<?php echo base_url("multimedia/Actividades/"); ?>/"
    }
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
    function editarRuta(id){
        window.location = "<?php echo site_url("rutaAprendizaje/index"); ?>/" + id;
        return true;
    }
    var resultadoTest=0;
    var valorAprobacionTest = 0;
    //    var siguienteInstrumento = 1;
    var intentosFallidos = 0;
    //    var dataOcultar = "";
    var htmlTest = "";
    function sumar(valor){
        resultadoTest = resultadoTest + valor;
    }
    function validarResultadoTest(){
        if(repondioTodoTest(GLOBAL.nombresPreguntas)){
            if(parseInt(valorAprobacionTest) <= resultadoTest){
                alert('Muy bien!, El test fue superado correctamente. \n El resultado obtenido fue ' + resultadoTest + '/' + valorAprobacionTest);
                $.ajax({
                    url: "<?php echo site_url("test/saveResultTest"); ?>",
                    type: "POST",
                    data: {"testid": GLOBAL.elementosEnOrden[0].valor , "intentos": intentosFallidos,'ultimoOrden': GLOBAL.rutaAprendizajeView,'rutaId':GLOBAL.rutaAprendizajeId },
                    success: function(){
                        intentosFallidos = 0;
                        window.location = '<?php echo base_url("index.php/responderRuta"); ?>';
                    }
                
                });
            }
            else{
                $("#test").html("");
                alert('Lo sentimos!, Vuelve a intentarlo. \n Resultado obtenido: ' + resultadoTest + '/' + valorAprobacionTest);
                GLOBAL.ordenVisualizar ++;
                if(GLOBAL.ordenVisualizar > 3){
                    GLOBAL.ordenVisualizar = 1;
                }
                resultadoTest = 0;
                gestionaOcultarVisualizarControles();
            }
        }else{
            alert("Debes responder todo el test, antes de continuar.")
        }
    }
    function gestionaOcultarVisualizarControles(){
        $.ajax({
            url: "<?php echo base_url("index.php/test/getTestHtml"); ?>",
            type: "GET",
            dataType: 'JSON',
            data: {"id": GLOBAL.elementosEnOrden[0].valor},
            success: function(respuesta){
                GLOBAL.nombresPreguntas = respuesta.nombres;
                htmlTest = "<legend>Test evaluativo</legend>" + respuesta.html;
                $("#test").html(htmlTest);
                valorAprobacionTest = $("#valtest").val();
            },
            error: function(error){
                alert("Error al generar el test seleccionado!");
            }
        });
        ocultaElementos();
        switch(GLOBAL.elementosEnOrden[GLOBAL.ordenVisualizar].tipo){
            case 'video':
                muestraVideo(GLOBAL.elementosEnOrden[GLOBAL.ordenVisualizar].valor);
                break;
            case 'comic':
                muestraComic(GLOBAL.elementosEnOrden[GLOBAL.ordenVisualizar].valor);
                break;
            case 'presentacion':
                muestraPresentacion(GLOBAL.elementosEnOrden[GLOBAL.ordenVisualizar].valor);
                break;
        }
        GLOBAL.rutaAprendizajeView = GLOBAL.elementosEnOrden[GLOBAL.ordenVisualizar].tipo;
    }
    function muestraPresentacion(valor){
        var rutaPresentacion = "<?php echo base_url("multimedia/Presentaciones/"); ?>/" + valor;
        document.getElementById("paramPresentacion").value = rutaPresentacion;
        document.getElementById("embedPresentacion").src = rutaPresentacion;
        document.getElementById("divPresentacion").style.display = "block";
        return true;
    }
    function muestraVideo(valor){
        var nombreVideo = "";                
        if(valor == "alto.flv")
            nombreVideo = 'nz2Xx5jtXRQ';
        else if(valor == "medio.flv")
            nombreVideo = 'xDDJVpPJjkk';
        else if(valor == "bajo.flv")
            nombreVideo = 'R76OAk0FM5Q';
        document.getElementById("iframeVideo").src = "http://www.youtube.com/embed/" + nombreVideo;
        document.getElementById("divVideo").style.display = "block";
        return true;
    }
    function muestraComic(valor){
        var rutaComic = '<?php echo base_url("multimedia/Comic/"); ?>/' + valor;
        document.getElementById("paramComic").value = rutaComic;
        document.getElementById("embedComic").src = rutaComic;
        document.getElementById("divComic").style.display = "block";
        return true;
    }
    function ocultaElementos(){
        $(".divElementosOrden").css("display","none");
        return true;
    }
    function cargaDatosIniciales(data,rutaId,ordenInicial){
        var arreglo = data.split(',');
        GLOBAL.elementosEnOrden[0] = {valor:arreglo[4],tipo:'test'};
        GLOBAL.elementosEnOrden[arreglo[5]] = {valor:arreglo[0],tipo:'video'};
        GLOBAL.elementosEnOrden[arreglo[6]] = {valor:arreglo[1],tipo:'comic'};
        GLOBAL.elementosEnOrden[arreglo[8]] = {valor:arreglo[3],tipo:'presentacion'};
        GLOBAL.rutaAprendizajeId = rutaId;
        asignaValorActividad(arreglo[2]);
        if(ordenInicial == ""){
            GLOBAL.ordenVisualizar = 1;
        }else{
            GLOBAL.ordenVisualizar = calcularOrden(ordenInicial);
        }
        gestionaOcultarVisualizarControles();
        document.getElementById("rutasAprendizaje").style.display = "none";
        document.getElementById("contentEvaliuacion").style.display = "block";
        //        ocultarRutasAprendizaje(data);
    }
    function calcularOrden(ordenHistorico){
        for(var x in GLOBAL.elementosEnOrden){
            if(GLOBAL.elementosEnOrden[x].tipo == ordenHistorico){
                return x;
            }
        }
        return 1;
    }
    function asignaValorActividad(valor){
        document.getElementById("iframeActividad").src = GLOBAL.srcActividad + valor + '&lang=es';
        document.getElementById("divActividad").style.display = "block";
        return true;
    }
</script>
<h1>Listado de rutas de aprendizaje a responder</h1>
<table id="rutasAprendizaje" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>EVALUACIÓN</th> <th>SELECCIONAR</th><?php if ($this->session->userdata("role_id") == 3) { ?> <th>ELIMINAR</th><th>EDITAR</th> <?php } ?>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($arrauRutasAprendizaje->result() as $arrayItem) {
            $classBtn = '';
            $classTr = '';
            $onclick = 'onclick=\'cargaDatosIniciales("' . $arrayItem->data . '",' . $arrayItem->id . ',"' . $arrayItem->ult_orden . '");\'';
            $registroRutaAprendizaje = "<tr class='%s'><td>%s</td><td><input type='button' class='btn btn-large btn-inverse %s' %s value='Realizar evaluación'/></td>";
            if ($this->session->userdata("role_id") == 3) {
                $registroRutaAprendizaje .= "<td><button id='del$arrayItem->id' class='btn btn-danger deleteruta' ruta='$arrayItem->id'>Eliminar ruta de aprendizaje</button></td>";
                $registroRutaAprendizaje .= "<td><button id='edit$arrayItem->id' class='btn btn-warning ' onclick=\"editarRuta('$arrayItem->sistema_digestivo_codigo')\">Editar ruta de aprendizaje</button></td>";
            } else {
                if ($arrayItem->sistema_orden > 1 || $arrayItem->username != "") {
                    if ($arrayItem->ult_resp >= $arrayItem->id || $arrayItem->ult_resp == "") {
                        $classBtn = 'disabled';
                        $onclick = '';
                    }
                }
                if ($arrayItem->username)
                    $classTr = 'success';
            }
            $registroRutaAprendizaje .= "</tr>";
            echo sprintf($registroRutaAprendizaje, $classTr, strtoupper($arrayItem->nombre), $classBtn, $onclick);
        }
        ?>
    </tbody>
</table>
<div id="contentEvaliuacion" style="display: none;">
    <h1>Ruta de aprendizaje</h1>
    <div id="evaluacion">
        <div id="divComic" class="divElementosOrden">
            <legend>Comic</legend>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">
                <param name="movie" id="paramComic" />
                <param name="quality" value="high" />
                <param name="allowfullscreen" value="true" />
                <embed id="embedComic" allowfullscreen="true" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>
            </object>
        </div>
        <div id="divVideo" class="divElementosOrden">
            <iframe id="iframeVideo" width="420" height="315" src="http://www.youtube.com/embed/nz2Xx5jtXRQ" frameborder="0" allowfullscreen></iframe>
        </div>
        <div id="divPresentacion" class="divElementosOrden">
            <legend>Presentación</legend>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">
                <param id="paramPresentacion" name="movie" />';
                <param name="quality" value="high" />
                <param name="allowfullscreen" value="true" />
                <embed id="embedPresentacion" allowfullscreen="true" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>
            </object>        
        </div>
        <div id="divActividad">
            <legend>Actividad</legend>
            <iframe width='600' id="iframeActividad" height='400' frameborder='0' src='' ></iframe><br />
        </div>
    </div>
    <div id="test"></div>
</div>
