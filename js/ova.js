function repondioTodoTest(nombresPreguntas){
    var diligenciado = true;
    for(var i = 0;i < nombresPreguntas.length; i++){
        var repondio = false;
        $("[name='" + nombresPreguntas[i] + "']").each(function(){
            if($(this).is(":checked")){
                repondio = true;
            }
        });
        if(!repondio) diligenciado = false;
    }
    return diligenciado;
}

