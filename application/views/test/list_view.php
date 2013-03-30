<script type="text/javascript">
    $(document).ready(function(){
        $(".deltest").click(function(){
            $.ajax({
                url: "<?php echo site_url("test/eliminar");?>",
                type: "POST",
                data: {"idtest": $(this).attr("test")},
                success: function(){
                    alert("El test se eliminó correctamente.");
                    location.reload();
                }
            });
        });
    });
</script>
<div>
    <img src="<?php echo base_url()."img/test.png"; ?>" alt="test" /><h1 style="display: inline;">Administracion de Test</h1>
    <legend>Agregar Nuevo Test</legend>
    <p>Selecciona la siguiente opción para crear un nuevo test.</p>
    <a href="<?php echo site_url("test/form_new/"); ?>" class='btn btn-info'><i class='icon-plus'></i> Agregar</a>
    
    <legend>Listado de Test Existentes</legend>
    <p>Genera un listado de los test existentes para visualizar de forma ordenada y precisa la información.</p>
    <table class="table table-condensed">
        <thead>
            <tr><th>#</th> <th>Nombre Test</th><th>Preguntas</th><th>Actualizar</th><th>Eliminar</th></tr>
        </thead>
        <tbody>
            <?php  
            $autoNumerico = 0;
            foreach ($testArray->result() as $testItem){
                if($testItem->nombre == null)
                    echo "<tr><td>$autoNumerico</td><td>Nombre no aisgnado</td><td><a href='". site_url("test/update/$testItem->id") ."' class='btn btn-info'><i class='icon-list'></i> Preguntas</a></td><td><a href='". site_url("test/form_update/$testItem->id") ."' class='btn btn-success'><i class='icon-pencil'></i> Actualizar</a></td><td><button id='del$testItem->id' class='btn btn-danger deltest' test='$testItem->id'>Eliminar Test</button></td></tr>";
                else
                    echo "<tr><td>$autoNumerico</td><td>$testItem->nombre</td><td><a href='". site_url("pregunta/index/$testItem->id") ."' class='btn btn-info'><i class='icon-list'></i> Preguntas</a></td><td><a href='". site_url("test/form_update/$testItem->id") ."' class='btn btn-success'><i class='icon-pencil'></i> Actualizar</a></td><td><button id='del$testItem->id' class='btn btn-danger deltest' test='$testItem->id'>Eliminar Test</button></td></tr>";
                $autoNumerico++;
            } 
            ?>
        </tbody>
    </table>
</div>
