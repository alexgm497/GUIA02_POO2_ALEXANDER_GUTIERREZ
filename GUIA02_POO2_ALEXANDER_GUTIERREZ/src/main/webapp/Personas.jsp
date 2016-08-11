<%-- 
    Document   : Personas
    Created on : 08-10-2016, 04:54:54 PM
    Author     : Laboratorio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <center><h2 class="teal-text text-lighten-2">Mantenimiento de personas</h2></center>
            <br/>
            <center><h3 class="teal-text text-lighten-2">${mensAlert}</h3></center>
            <br/>
            <div class="row">
                <form method="POST" action="PersonasServ" class="col s12" enctype="multipart/form-data">                    
                    <input type="hidden" name="codiPers" value="${codiPers}"/>
                    <jsp:useBean id="beanTipoPersCtrl" class="com.sv.udb.controlador.TipoPersCtrl" scope="page"/>
                    <jsp:useBean id="beanDireccCtrl" class="com.sv.udb.controlador.DireccCtrl" scope="page"/>
                    <div class="input-field col s6">
                        <input name="Nombre" type="text" class="validate">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="Apellidos" type="text" class="validate">
                        <label for="Apellidos">Apellidos</label>
                    </div>
                    <div class="input-field col s6">
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Foto</span>
                                <input type="file" name="Foto">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <div class="input-field col s6">                    
                        <select name="cmbTipo">
                            <c:forEach items="${beanTipoPersCtrl.consTodo()}" var="fila">
                                <c:choose>
                                    <c:when test="${fila.idTipo == cmbTipo}">
                                        <option value="${fila.idTipo}" selected>${fila.nombTipo}</option>                                      
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${fila.idTipo}">${fila.nombTipo}</option>                                      
                                    </c:otherwise>
                                </c:choose>                                
                            </c:forEach>
                        </select>
                        <label for="cmbTipo">Tipo: </label>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <div class="input-field col s6">
                        <select name="cmbGene">
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                        <label for="cmbGene">Genero:</label>
                    </div>
                    <div class="input-field col s6">
                        <label for="FechaNac">Nacimiento:</label>
                        <input type="date" class="datepicker" id="FechaNac" name="Naci">
                    </div>
                    <div class="input-field col s6">
                        <input name="DUI" type="text" class="validate">
                        <label for="DUI">DUI:</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="NIT" type="text" class="validate">
                        <label for="NIT">NIT:</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="TipoSang" type="text" class="validate">
                        <label for="TipoSang">Tipo de sangre:</label>
                    </div>
                    <div class="input-field col s6">                    
                        <select name="cmbDirec">
                            <c:forEach items="${beanDireccCtrl.consTodo()}" var="fila">
                                <c:choose>
                                    <c:when test="${fila.idDirec == cmbDirec}">
                                        <option value="${fila.idDirec}" selected>${fila.nombDirec}</option>                                      
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${fila.idDirec}">${fila.nombDirec}</option>                                      
                                    </c:otherwise>
                                </c:choose>                                
                            </c:forEach>
                        </select>
                        <label for="cmbDirec">Dirección: </label>
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
        <script type="text/javascript" src="js/materialize.js"></script>
        <script>
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
        <script>
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 100 // Creates a dropdown of 15 years to control year
            });
        </script>
    </body>
</html>
