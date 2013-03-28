<script type="text/javascript">
    $(document).ready(function(){
        $(".deletepregunta").click(function(){
            $.ajax({
                url: "<?php echo site_url("pregunta/eliminar");?>",
                type: "POST",
                data: {"idpregunta": $(this).attr("pregunta")},
                success: function(){
                    alert("La pregunta se eliminó correctamente.");
                    location.reload();
                }
            });
        });
    });
</script>
<div>
    
    <img src="<?php echo base_url()."img/preguntas.png"; ?>" alt="preguntas" /><h1 style="display: inline;">Administracion de Preguntas</h1>
    <legend>Agregar Nueva Pregunta</legend>
    <p>Selecciona la siguiente opción para crear una nueva pregunta.</p>
    <a href="<?php echo site_url("pregunta/form_new/$id"); ?>" class='btn btn-info'><i class='icon-plus'></i> Agregar</a>
    
    <legend>Listado de Preguntas Existentes</legend>
    <p>Genera un listado de las preguntas existentes para visualizar de forma ordenada y precisa la información.</p>
    <table class="table table-condensed">
        <thead>
            <tr><th>#</th><th>Pregunta</th><th>Actualizar</th><th>Eliminar</th></tr>
        </thead>
        <tbody>
            <?php  
            $autoNumerico = 1;
            foreach ($preguntasArray->result() as $preguntasItem){
                if($preguntasItem->pregunta == null)
                    echo "<tr><td>$autoNumerico</td><td>Pregunta no asignada</td><td><a href='". site_url("pregunta/form_update/$preguntasItem->id/$id") ."' class='btn btn-success'><i class='icon-pencil'></i> Actualizar</a></td><td><button id='del$preguntasItem->id' class='btn btn-danger deletepregunta' pregunta='$preguntasItem->id'>Eliminar Pregunta</button></td> </tr>";
                else
                    echo "<tr><td>$autoNumerico</td><td>$preguntasItem->pregunta</td><td><a href='". site_url("pregunta/form_update/$preguntasItem->id/$id") ."' class='btn btn-success'><i class='icon-pencil'></i> Actualizar</a></td><td><button id='del$preguntasItem->id' class='btn btn-danger deletepregunta' pregunta='$preguntasItem->id'>Eliminar Pregunta</button></td></tr>";
                $autoNumerico++;
            } 
            ?>
        </tbody>
    </table>
</div>
