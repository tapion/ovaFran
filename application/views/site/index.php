<script type="text/javascript">
    var estudiante = "5";
    var docente = "3";
    var rol = "<?php echo $role_id; ?>";
    $(function(){
        
        if(rol == estudiante)
            $("#est").css("display", "block");
        else if(rol == docente)
            $("#doc").css("display", "block");
        
    });
</script>
<div class="site-index">
    <p>A continuacion se describen el procedimeinto para el proceso de creacion de las rutas de aprendizaje que realizan los docentes y como los estudiantes pueden ingresar a la plataforma para ejecutar el proceso de evaluación.</p>
    <br/>
    <div id="est" style="display: none;">
        <legend><img src="<?php echo base_url("img/est.png"); ?>" style="width:128px; height: 128px;" alt="Estudiantes">ESTUDIANTES</legend>
        <div class="control">
            <ol>
                <li>Los estudiantes ejecutan responden las rutas de aprendizaje creadas por el docente.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/responderRuta/index"); ?>';">Responder Rutas de Aprendizaje</button>
        </div>
        <br/>
        <div class="control">
            <ol start="2">
                <li>Responder Examen Final.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/examenfinal"); ?>';">Responder Examen Final</button>
        </div>
        <br/>
    </div>
    <div id="doc" style="display: none;">
        <legend><img src="<?php echo base_url("img/doce.png"); ?>" style="width:128px; height: 128px;" alt="Estudiantes">DOCENTES</legend>
        <div class="control">
            <ol>
                <li>Ejecuta el proceso de creacion para las rutas de aprendizaje que los estudiantes desarrollaran por medio de la aplicacion.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;"  class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/rutaAprendizaje/index"); ?>';">Crear Ruta de Aprendizaje</button>
        </div>
        <br/>
        <div class="control">
            <ol start='2'>
                <li>Ejecute el proceso de creación de test.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;"  class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/test/"); ?>';">Crear Test</button>
        </div>
        <br/>
        <div class="control">
            <ol start='3'>
                <li>Preguntas para examen final.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/pregunta/index/-1"); ?>';">Crear Preguntas para Examen Final</button>
        </div>
        <div class="control">
            <ol start='3'>
                <li>Resultados Examen Final.</li>
            </ol>
            <button style="width: 300px; margin-left: 25px;" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo site_url("examenfinal/verResultadosFinalesView"); ?>';">Ver Resultados</button>
        </div>
    </div>
</div>
