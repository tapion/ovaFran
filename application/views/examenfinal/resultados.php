<script type="text/javascript">
    var GLOBAL = {
        parametros: [],
    }
    $(function(){
        $("#users").change(function(){
            $.ajax({
                url: "<?php echo site_url("examenfinal/verResultadosFinales") ?>",
                type: "POST",
                data: {"userid": $(this).val()},
                success: function(html){
                    $("#tresult").html(html);
                }
            }); 
        });
    });
    function mostrarUsuario(){
        ocultarTodo();
        document.getElementById("divResultUsuario").style.display = "block";
    }
    function ocultarTodo(){
        document.getElementById("divResultGrupo").style.display = "none";
        document.getElementById("divResultUsuario").style.display = "none";
    }
    function mostrarGrupo(){
        ocultarTodo();
        $.ajax({
                url: "<?php echo site_url("examenfinal/estadisticasGenerales") ?>",
                type: "POST",
                dataType: "JSON",
                data: {},
                success: function(html){
                    GLOBAL.parametros = html;
                    console.log(html)
                    document.getElementById("divResultGrupo").style.display = "block";
                    $("#tresult").html(html);
                }
            }); 
        
    }
</script>
<style>
    #divResultUsuario{
        display: none;
    }
    #divResultGrupo{
        display: none;
    }
    #divBotones{
        width: 100%;
        text-align: center;
    }
    /*    #divBotones button{
            font-size: 150%;
        }*/
</style>
<legend>Visualización de Resultados para examen final.</legend>
<div id="divBotones">
    <button type="button" id="btnUsuario" onclick="mostrarUsuario();" class="btn btn-primary btn-large">Por usuario</button>
    <button type="button" id="btnGrupo" onclick="mostrarGrupo();" class="btn btn-primary btn-large">Grupales</button>
</div>
<div id="divResultUsuario">
    <label for="users">Elija el usuario: </label>
    <select id="users">
        <option value="">Seleccione...</option>
        <?php echo $users; ?>
    </select>
    <table id="tresult" class="table">

    </table>
</div>
<div id="divResultGrupo">

</div>
 <div id="chart_div" style="width: 900px; height: 500px;"></div>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    function drawChart(arreglo) {
        var data = google.visualization.arrayToDataTable(arreglo);
        var options = {
            title: 'Estadística general',
            hAxis: {title: 'Operaciones Mentales', titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>
