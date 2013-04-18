<style>
    .content{width: 80%; margin: 0 auto;}
    .content ul li{float: left; display: inline; margin-right: 30px; min-width: 100px; min-height: 40px; font-weight: bold; line-height: 40px;}
    .btnMe{ clear: both; display:block;}
</style>
<script type="text/javascript">
    var GLOBAL = {
        valores : [1,2,3],
        combos: ['ordencomic','ordenvideos','ordenactividades']
    };
    $(document).ready(function(){
        disparaCombos();
        $("#categoria").change(function(){
            var sistemaValor = $(this).val();
            $.ajax({
                url: "<?php echo base_url("index.php/rutaAprendizaje/readFiles"); ?>", 
                type: "POST",
                data: {"tipoSistemaDigestivo": $(this).val(), "tipoArchivo": "video"},
                success: function(archivos){
                    var listadoDeArchivos = "";
                    archivos = JSON.parse(archivos);
                    for(i=2; i < archivos.videos.length; i++){
                        listadoDeArchivos += "<li><input type='radio' name='videos' value='" + archivos.videos[i] + "'>" + archivos.videos[i] + "</li>";
                    }
                    listadoDeArchivos = "";
                    for(i=2; i < archivos.actividades.length; i++){
                        listadoDeArchivos += "<li><input type='radio' name='actividades' value='" + archivos.actividades[i] + "'>" + archivos.actividades[i] + "</li>";
                    }
                },
                error: function(error){
                    //alert(error);
                }
            });
            $.ajax({
                url: "<?php echo base_url("index.php/test/getTest"); ?>", 
                type: "POST",
                data: {"tipoSistemaDigestivo": $(this).val()},
                success: function(arraytests){
                    arraytests = JSON.parse(arraytests);
                    var testhtml = "";
                    for(var testItem in arraytests){
                        testhtml += "<li><input type='radio' id=" + arraytests[testItem].id + " name='test' value='" + arraytests[testItem].id + "'>" + arraytests[testItem].nombre + "</li>";
                    }
                    $("#test").html(testhtml);
                    cambiaSistema(sistemaValor);
                },
                error: function(error){
                    alert(error);
                }
            });
        });
    });
    function insertRutaAprendizaje(){
        var dataRutaAprendizaje = {"videos":"", "comic": "", "actividades": "", "presentacion": "","test":"", "orden":""};
        if($("#categoria").val() == "alto"){
            dataRutaAprendizaje.videos = "alto.flv";
            dataRutaAprendizaje.comic = "comic_alto.swf";
            dataRutaAprendizaje.actividades = "act_alto.jclic.zip";
            dataRutaAprendizaje.presentacion = "presalto.swf";
            $("input[type=radio], [name=test]").each(function(){
                if($(this).is(":checked"))
                {
                    dataRutaAprendizaje.test = $(this).val();
                }
            });
        }else if($("#categoria").val() == "medio"){
            dataRutaAprendizaje.videos = "medio.flv";
            dataRutaAprendizaje.comic = "comic_medio.swf";
            dataRutaAprendizaje.actividades = "act_medio.jclic.zip";
            dataRutaAprendizaje.presentacion = "presmedio.swf";
            $("input[type=radio], [name=test]").each(function(){
                if($(this).is(":checked"))
                {
                    dataRutaAprendizaje.test = $(this).val();
                }
            });
        }
        else if($("#categoria").val() == "bajo"){
            dataRutaAprendizaje.videos = "bajo.flv";
            dataRutaAprendizaje.comic = "comic_bajo.swf";
            dataRutaAprendizaje.actividades = "act_bajo.jclic.zip";
            dataRutaAprendizaje.prese
                = "presbajo.swf";
            $("input[type=radio], [name=test]").each(function(){
                if($(this).is(":checked"))
                {
                    dataRutaAprendizaje.test = $(this).val();
                }
            });
        }
        dataRutaAprendizaje.orden = $("#ordenvideos").val() + "," + $("#ordencomic").val() + "," + "0," + $("#ordenactividades").val() + "," + $("#ordentest").val();
        $.ajax({
            url: "<?php echo base_url("index.php/rutaAprendizaje/insert"); ?>", 
            type: "POST",
            data: {"nombre": $("#nombre").val(), "data": dataRutaAprendizaje,"id":document.getElementById("idRutaAprendizaje").value,"sistema":document.getElementById("categoria").value},
            success: function(guardo){alert(guardo);},
            error: function(error){alert(error);}
        });
        
    }
    function validaOrden(id){
        if(id.value == ""){
            verificaQueOptionHabilitar();
            return true;
        }
        switch(id.id){
            case 'ordencomic':
                desabilidaOption('ordenvideos',id.value);
                desabilidaOption('ordenactividades',id.value);
                break;
            case 'ordenvideos':
                desabilidaOption('ordencomic',id.value);
                desabilidaOption('ordenactividades',id.value);
                break;
            case 'ordenactividades':
                desabilidaOption('ordenvideos',id.value);
                desabilidaOption('ordencomic',id.value);
                break;
        }
        verificaQueOptionHabilitar();
        return true;
    }
    function verificaQueOptionHabilitar(){
        var arrNoHabilita = new Array();
        for(var i = 0; i < GLOBAL.combos.length; i++){
            for(var c = 0; c < GLOBAL.valores.length; c++){
                if(GLOBAL.valores[c] == document.getElementById(GLOBAL.combos[i]).value){
                    arrNoHabilita.push(GLOBAL.valores[c]);
                }
            }
        }
        for(var c = 0; c < GLOBAL.valores.length; c++){
            if(arrNoHabilita.indexOf(GLOBAL.valores[c]) === -1){
                habilitaOpcion(GLOBAL.valores[c]);
            }
        }
        return true;
    }
    function habilitaOpcion(valor){
        for(var c = 0; c < GLOBAL.combos.length; c++){
            var opt = document.getElementById(GLOBAL.combos[c]).getElementsByTagName("option");
            for(var i = 0;i < opt.length;i++){
                if(opt[i].value == valor){
                    opt[i].disabled = false;
                }
            }
        }
        return true;
    }
    function desabilidaOption(id,valor){
        var opt = document.getElementById(id).getElementsByTagName("option");
        for(var i = 0;i < opt.length;i++){
            if(opt[i].value == valor){
                opt[i].disabled = true;
            }
        }
        return true;
    }
    function disparaCombos(){
        for(var c = 0; c < GLOBAL.combos.length; c++){
            validaOrden(document.getElementById(GLOBAL.combos[c]));
        }
    }
    function cambiaSistema(sistema){
        $.ajax({
            url: "<?php echo base_url("index.php/rutaAprendizaje/validaExistenciaRuta"); ?>", 
            type: "POST",
            data: {"sistema": sistema},
            dataType: "JSON",
            success: function(existe){
                if(existe.ok){
                    document.getElementById("divAlertaBien").style.display = "none";
                    document.getElementById("divAlerta").style.display = "none";
                    document.getElementById("idRutaAprendizaje").value = 0;
                    switch(existe.estado){
                        case 1:
                            document.getElementById("spAlerta").innerHTML = existe.mensaje;
                            document.getElementById("divAlerta").style.display = "block";
                            document.getElementById("idRutaAprendizaje").value = existe.id;
                            var array = existe.orden.split(",");
                            document.getElementById("ordencomic").value = array[2];
                            document.getElementById("ordenvideos").value = array[1];
                            document.getElementById("ordenactividades").value = array[4];
                            if(document.getElementById(array[0]) != undefined){
                                document.getElementById(array[0]).checked = true;
                            }
                            break;
                        case 2: 
                            document.getElementById("spAlertaBien").innerHTML = existe.mensaje;
                            document.getElementById("divAlertaBien").style.display = "block";                    
                            break;
                        default: console.log("Error programa"); break;
                    }
                    disparaCombos();
                }else{
                    alert(existe.mensaje);
                }
            },
            error: function(error){}
        });  
    }
</script>
<div class="content">
    <h1>Creacion de rutas de aprendizaje</h1>
    <legend>Nombre de ruta de aprendizaje</legend>
    <div style="clear: both;">* Nombre: <input id="nombre" type="text" value=""/></div>
    <legend>Categoria</legend>
    <select id="categoria" >
        <option>Seleccione...</option>
        <?php
        if ($sistemas->num_rows() > 0) {
            foreach ($sistemas->result() as $sistema) {
                echo "<option value='{$sistema->codigo}'>{$sistema->nombre}</option>";
            }
        }
        ?>
    </select>
    <legend>Comics Correspondientes a la categoria seleccionada.</legend>
    <ul id="comic"></ul>
    <div style="clear: both;">* Orden: <select id="ordencomic" onchange="validaOrden(this);"><option value="">Elija</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></div>
    <legend>Videos Correspondientes a la categoria seleccionada.</legend>
    <ul id="videos"></ul>
    <div style="clear: both;">* Orden: <select id="ordenvideos" onchange="validaOrden(this);"><option value="">Elija</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></div>
    <legend>Actividades Correspondientes a la categoria seleccionada.</legend>
    <ul id="actividades"></ul>
    <div style="clear: both;">* Orden: <select id="ordenactividades" onchange="validaOrden(this);"><option value="">Elija</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select> </div>
    <legend>Tests Correspondientes a la categoria seleccionada.</legend>
    <ul id="test"></ul>
    <div style="clear: both;">* Orden: <select id="ordentest" ><option value="4">4</option></select></div>
    <input type="hidden" id="idRutaAprendizaje" name="idRutaAprendizaje" />
    <input type="button" class="btn btn-large btn-inverse btnMe" onclick="insertRutaAprendizaje();" value="Crear Ruta de Aprendizaje"/>

</div>

