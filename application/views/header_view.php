<!DOCTYPE html>
<html>
    <head>
        <title>Objeto virtual de aprendizaje del sistema digestivo humano.</title>
        <meta charset="utf-8"/>
        <script src="<?php echo base_url() . "js/jquery.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap.min.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-alert.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-button.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-carousel.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-collapse.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-dropdown.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-modal.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-popover.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-scrollspy.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-tab.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-tooltip.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-transition.js" ?>" type="text/javascript" ></script>
        <script src="<?php echo base_url() . "js/bootstrap-typeahead.js" ?>" type="text/javascript" ></script>
        <link href="<?php echo base_url() . "css/css/bootstrap.css" ?>" type="text/css" rel="stylesheet" />
        <link href="<?php echo base_url() . "css/site.css" ?>" type="text/css" rel="stylesheet" />

        <style>
            #header{width: 100%;}
            #content{width: 90%; margin: 0 auto;}
        </style>

    </head>
    <body>
        <script>
            $(document).on('ajaxStart',function(){
                $('#myModal').modal('show');
            });
            $(document).on('ajaxStop',function(){
                $('#myModal').modal('hide');
            });
    
        </script>
        <div id="myModal" class="modal hide fade" style="width:182px;margin-top: 0px"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Cargando...</h3>
            </div>
            <div class="modal-body" style="width:80%;text-align:center">
                <img src="<?php echo base_url("img/cargando.gif"); ?>" alt="Cargando" style="height: 70px;width:70px" />
            </div>
            <!--        <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                        <button class="btn btn-primary">Save changes</button>
                    </div>-->
        </div>
        <div id="header" class="container navbar navbar-inverse navbar-static-top">
            <div class="navbar-inner">
                <a class="brand" href="#">Aprendizaje del Sistema Digestivo Humano</a>
                <ul class="nav">
                    <li class="active">
                        <a href="<?php echo base_url(); ?>">Inicio</a>
                    </li>
                    <!--<li><a href="<?php echo base_url("index.php/test"); ?>">Test</a></li>-->
                    <li><a href="<?php echo base_url("index.php/responderRuta"); ?>">Rutas de Aprendizaje</a></li>
                    <li><a href="<?php echo base_url("index.php/examenfinal"); ?>">Examen Final</a></li>
                    <li><a href="<?php echo site_url("site/logout"); ?>">Cerrar Sesión</a></li>
                </ul>
            </div>
        </div>
        <div id="content">
            <div class="site-index">
                <h1>Objeto virtual de aprendizaje del sistema digestivo humano.</h1>

                <p>El objetivo de este objeto virtual de aprendizaje es aprender la importancia del sistema digestivo humano, el funcionamiento de cada órgano y los cuidados que debemos tener para el buen funcionamiento de este.</p>
            </div>
            <div class="alert fade in" id="divAlerta" style="display: none;">
                <strong>¡Atención!</strong> <span id="spAlerta"></span>
            </div>
            <div class="alert alert-success fade in" id="divAlertaBien" style="display: none;">
<!--                <button type="button" class="close" data-dismiss="alert">&times;</button>-->
                <strong>Ok</strong> <span id="spAlertaBien"></span>
            </div>
