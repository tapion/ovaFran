<script type="text/javascript">
    var test = "<?php echo $test; ?>";
    var textPregunta = "";
    var arrayImagenes = new Array(); 
    $(document).ready(function(){
        textPregunta = $("#prevPregunta").html();
        $("#subcategorias").val("<?php echo $subcategoria; ?>");
        $("#respuestacorrecta").val("<?php echo $respuestacorrecta; ?>");
        if(test == "-1")
            $("#valorPregunta").css("display","none");
    });
    function prev(){
        for (var item in arrayImagenes) {
            var search = "["+arrayImagenes[item][0]+"]";
            textPregunta = textPregunta.replace(search," " + arrayImagenes[item][1] + " ");
        }
        $("#prevPregunta").html(textPregunta);
    }
    function validacionesFormulario(){
        if((parseInt(test) > 0) && isNaN(parseInt(document.getElementById("valor").value))){
            alert("Debe ingresar un valor numerico en el campo valor");
            return false;
        }
        if(document.getElementById("respuestacorrecta").value == ""){
            alert("Debe elegir una respuesta correcta");
            return false;
        }
        if(document.getElementById("pregunta").value == ""){
            alert("La pregunta es obligatoria");
            return false;
        }
    }
    function datosPreguntaCompletos(){
        if(document.getElementById("pregunta").value == ""){
            alert("Debe ingresar el contenido de la pregunta");
            return false;
        }
        if((parseInt(test) > 0) && document.getElementById("valor").value == "" || isNaN(document.getElementById("valor").value)){
            alert("El valor de la pregunta debe ser un valor númerico válido");
            return false;
        }
        return true;
    }
</script>
<style type="text/css">
    #contentTest { width: 49%; float: left;}
    #modRespuestas { width: 49%; float: right; border-left: 2px dashed #969696; padding: 0px 10px 0 10px;}
</style>
<div id="contentTest">
    <h1>Administracion del test: (<?php echo $nombreTest; ?>)</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera una pregunta completa luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("pregunta/update/$id/$test"); ?>" class="form-horizontal" method="POST" onsubmit="return validacionesFormulario();">
        <legend>Agregar Nueva Pregunta</legend>
        <div class="control-group">
            <label class="control-label" from="pregunta">Subcategoria</label>
            <div class="controls">
                <select id="subcategorias" name="subcategorias">
                    <?php
                    foreach ($arraySubcategorias->result() as $itemSubcategoria) {
                        echo "<option id='$itemSubcategoria->id' value='$itemSubcategoria->subcategoria' >" . $itemSubcategoria->subcategoria . "</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="control-group">
            <input type="hidden" value="<?php echo $id; ?>" />
            <label class="control-label" from="pregunta">Pregunta</label>
            <div class="controls">
                <textarea style="width: 80%;" name="pregunta" id="pregunta" placeholder="Ingrese texto aqui..." ><?php echo $pregunta; ?></textarea> 
            </div>
        </div>
        <div id="valorPregunta" class="control-group">
            <label class="control-label" from="valor">Valor</label>
            <div class="controls">
                <input name="valor" id="valor" type="text" placeholder="Ingrese un valor númerico..." value="<?php echo $valor; ?>"/> 
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="respuestacorrecta">Respuesta Correcta</label>
            <div class="controls">
                <select name="respuestacorrecta" id="respuestacorrecta"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select> 
            </div>
        </div>
    </form>
    <legend>Previzualización de pregunta</legend>
    <p id="prevPregunta"><?php echo $pregunta; ?></p> 

    <button class="btn" onclick="prev();">Previsualizar</button>
</div>
