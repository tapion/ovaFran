<script>
<?php if(!empty($nombre)){ ?>
    alert('Ya existe un test con el nombre: <?php echo $nombre ?>');
<?php } ?>
</script>
<div id="contentTest">
    <h1>Administracion de Test</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera un test completo luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("test/insert"); ?>" class="form-horizontal" method="POST">
        <legend>Agregar Nuevo Test</legend>
        <div class="control-group">
            <label class="control-label" from="inptNombre">Tipo sistema digestivo</label>
            <div class="controls">
                <select id="tipo" name="tipo">
                    <option value="alto">Sistema Digestivo Alto</option>
                    <option value="medio">Sistema Digestivo Medio</option>
                    <option value="bajo">Sistema Digestivo Bajo</option>
                </select>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="inptNombre">Nombre de Test</label>
            <div class="controls">
                <input name="nombre" id="nombre" type="text" placeholder="Nombre del test" value=""/> 
            </div>
        </div>
        <div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Guardar" class="btn btn-primary"/> 
                </div>
            </div>
        </div>
    </form>
</div>
