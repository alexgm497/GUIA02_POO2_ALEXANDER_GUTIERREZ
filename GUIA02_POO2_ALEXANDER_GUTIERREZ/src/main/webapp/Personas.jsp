<%-- 
    Document   : Personas
    Created on : 08-10-2016, 04:54:54 PM
    Author     : Laboratorio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personas</title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <nav class="teal lighten-2">
            <div class="nav-wrapper">
                <a href="index.jsp" class="brand-logo right">GUIA 2 - POO2</a>
                <ul id="nav-mobile" class="left hide-on-med-and-down">
                    <li><a href="#">Personas</a></li>
                </ul>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
        <div class="container">
            <div class="row">
                <form method="POST" action="FichaPers.jsp" class="col s12">                    
                    <div class="input-field col s6">
                        <input id="Nombre" type="text" class="validate">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="Apellidos" type="text" class="validate">
                        <label for="Apellidos">Apellidos</label>
                    </div>
                    <div class="input-field col s6">
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Foto</span>
                                <input type="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col s12">
                        <br/>
                        <center>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Guardar"/>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Modificar"/>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Eliminar"/>
                        </center>
                        <br/>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
