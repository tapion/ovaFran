<script type="text/javascript">
    var arraySubcategorias = JSON.parse('<?php echo $subcategorias; ?>');
    var arraySubcategoriasString = [];
    var arrayResultadosString = [];
    $(function(){
        $("#finexamen").click(function(){
            console.log('<?php echo $user; ?>');
            for(item in arraySubcategorias){
                console.log(arraySubcategorias[item].subcategoria);
                var excelente = 0;
                var bueno = 0;
                var malo = 0;
                arraySubcategoriasString.push(arraySubcategorias[item].subcategoria);
                $("." + arraySubcategorias[item].subcategoria.replace(' ', '_')).each(function(){
                    if($(this).is(":checked")){
                        //console.log($(this).attr("correcta"));
                        if($(this).attr("correcta") == "1")
                            excelente++;
                        else
                            bueno++;
                    }
                    else
                        malo++;
                });
                var resultadoFinal = ""
                if(excelente == 2)
                    resultadoFinal ="Bueno";
                else if(bueno == 1 && excelente == 1)
                    resultadoFinal = "Regular";
                else
                    resultadoFinal = "Malo";
                console.log(excelente);
                console.log(bueno);
                console.log(malo);
                console.log(resultadoFinal);
                arrayResultadosString.push(resultadoFinal);
            }
            
            $.ajax({
                url: '<?php echo site_url("examenfinal/almacenarExamenFinal"); ?>',
                type: 'POST',
                data: {"username": '<?php echo $user; ?>', "arraySubcategorias":arraySubcategoriasString.toString(), "arrayResultados": arrayResultadosString.toString() },
                success: function(){
                    alert("El examen final se almaceno con exito.");
                    window.location = "<?php echo site_url("site/"); ?>";
                },
                error: function(){
                    alert("Error al almacenar el examen final.");
                }
            });
        });
    });
</script>
<div>
    <img src="<?php echo base_url() . "img/test.png"; ?>" alt="test" /><h1 style="display: inline;">Formulario Examen Final</h1>
    <legend></legend>
    <?php echo $html; ?>
</div>