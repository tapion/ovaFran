<script type="text/javascript">
    var GLOBAL = {
        valtotalPreguntas : <?php echo $totPreguntas; ?>
    };
    $(document).ready(function() {
        $("#tipo").val("<?php echo $tipo; ?>");
    });
    function valValorAprobacion(){
        var cincuentaPor = parseInt(GLOBAL.valtotalPreguntas) + 0.5;
        if(parseInt(document.getElementById("valor").value) < parseInt(cincuentaPor)){
            alert("El valor de aprobación no debe ser menor al 50% del total de las preguntas");
            return false;
        }else{
            return true;
        }
    }
</script>
<h1>Administracion de Test</h1>
<p class="lead">Ingresa la información requerida para los campos disponibles, y genera un test completo luego de terminar el proceso.</p>
<br/>
<form id="frmTest" action="<?php echo site_url("test/update"); ?>" class="form-horizontal" onsubmit="return valValorAprobacion();" method="POST">
    <legend>Actualizar Test</legend>
    <div class="control-group">
        <label class="control-label" from="inptNombre">Nombre de Test</label>
        <div class="controls">
            <select id="tipo" name="tipo">
                <option value="alto">Sistema Digestivo Alto</option>
                <option value="medio">Sistema Digestivo Medio</option>
                <option value="bajo">Sistema Digestivo Bajo</option>
            </select>
        </div>
    </div>
    <div class="control-group">
        <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        <input type="hidden" name="fechacreacion" id="fechacreacion" value="<?php echo $fechacreacion; ?>" />
        <label class="control-label" from="inptNombre">Nombre de Test</label>
        <div class="controls">
            <input name="nombre" id="nombre" type="text" placeholder="<?php echo $placeholder; ?>" value="<?php echo $nombre; ?>"/> 
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" from="valor">Valor de aprobación</label>
        <div class="controls">
            <input name="valor" id="valor" type="text" placeholder="Ingrese texto aqui..." value="<?php echo $valor; ?>"/> 
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" from="valor">Total preguntas</label>
        <div class="controls">
            <div ><?php echo $totPreguntas; ?></div>
        </div>
    </div>
    <div>
        <div class="control-group">
            <div class="controls">
                <input type="submit" value="Actualizar" class="btn btn-primary"/> 
            </div>
        </div>
    </div>
</form>