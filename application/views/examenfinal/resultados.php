<script type="text/javascript">
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
</script>
<legend>Visualización de Resultados para examen final.</legend>
<select id="users">
    <option value="">Seleccione...</option>
    <?php echo $users; ?>
</select>
<table id="tresult" class="table">

</table>