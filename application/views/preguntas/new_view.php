<script>
    var examenfinal = "<?php echo $id; ?>";
    
    $(document).ready(function(){
        if(examenfinal == "-1")
            $("#valorcontrol").css("display", "none");
        else
            $("#valorcontrol").css("display", "block");
    });
</script>
<div id="contentTest">
    <h1>Administracion del test: (<?php echo $nombreTest; ?>)</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera una pregunta completa luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("pregunta/insert/$id"); ?>" class="form-horizontal" method="POST">
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
            <label class="control-label" from="pregunta">Pregunta</label>
            <div class="controls">
                <textarea name="pregunta" id="pregunta" placeholder="Ingrese texto aqui..." value="" ></textarea>
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
