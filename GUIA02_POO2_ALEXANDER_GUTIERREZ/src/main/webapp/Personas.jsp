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
                <form name="DatosForm" method="POST" action="PersonasServ" class="col s12" enctype="multipart/form-data">                    
                    <input type="hidden" name="codiPers" value="${codiPers}"/>
                    <jsp:useBean id="beanTipoPersCtrl" class="com.sv.udb.controlador.TipoPersCtrl" scope="page"/>
                    <jsp:useBean id="beanDireccCtrl" class="com.sv.udb.controlador.DireccCtrl" scope="page"/>
                    <div class="input-field col s6">
                        <input name="Nombre" type="text" class="validate" value="${Nombre}" required>
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="Apellidos" type="text" class="validate" value="${Apellidos}" required>
                        <label for="Apellidos">Apellidos</label>
                    </div>
                    <div class="input-field col s6">
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Foto</span>
                                <input type="file" name="Foto" required>
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
                    <c:choose>
                        <c:when test="${opConsulta == 1}">
                            <div class="input-field col s6">
                                <select name="cmbGene" disabled>
                                    <c:choose>
                                        <c:when test="${'Masculino' == cmbGene}">
                                            <option value="M" selected>Masculino</option>                                      
                                        </c:when>
                                        <c:when test="${'Femenino' == cmbGene}">
                                            <option value="F" selected>Femenino</option>                                      
                                        </c:when>
                                        <c:otherwise>
                                            <option value="M">Masculino</option>  
                                            <option value="F">Femenino</option>                               
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                                <label for="cmbGene">Genero:</label>
                            </div>
                            <div class="input-field col s6">
                                <label for="FechaNac">Nacimiento:</label>
                                <input type="date" class="datepicker" id="FechaNac" name="Naci" value="${Naci}" disabled>
                            </div>
                            <div class="input-field col s6">
                                <input name="DUI" type="text" class="validate" value="${DUI}" disabled required>
                                <label for="DUI">DUI:</label>
                            </div>
                            <div class="input-field col s6">
                                <input name="NIT" type="text" class="validate" value="${NIT}" disabled required>
                                <label for="NIT">NIT:</label>
                            </div>
                            <div class="input-field col s6">
                                <input name="TipoSang" type="text" class="validate" value="${TipoSang}" disabled required>
                                <label for="TipoSang">Tipo de sangre:</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="input-field col s6">
                                <select name="cmbGene">
                                    <c:choose>
                                        <c:when test="${'Masculino' == cmbGene}">
                                            <option value="M" selected>Masculino</option>                                      
                                        </c:when>
                                        <c:when test="${'Femenino' == cmbGene}">
                                            <option value="F" selected>Femenino</option>                                      
                                        </c:when>
                                        <c:otherwise>
                                            <option value="M">Masculino</option>  
                                            <option value="F">Femenino</option>                               
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                                <label for="cmbGene">Genero:</label>
                            </div>
                            <div class="input-field col s6">
                                <label for="FechaNac">Nacimiento:</label>
                                <input type="date" class="datepicker" id="FechaNac" name="Naci" value="${Naci}">
                            </div>
                            <div class="input-field col s6">
                                <input name="DUI" type="text" class="validate" value="${DUI}" required>
                                <label for="DUI">DUI:</label>
                            </div>
                            <div class="input-field col s6">
                                <input name="NIT" type="text" class="validate" value="${NIT}" required>
                                <label for="NIT">NIT:</label>
                            </div>
                            <div class="input-field col s6">
                                <input name="TipoSang" type="text" class="validate" value="${TipoSang}" required>
                                <label for="TipoSang">Tipo de sangre:</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
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
                            <c:choose>
                                <c:when test="${opConsulta == 1}">
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Guardar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Modificar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" onclick="return confirm('¿Desea borrar el dato?')" value="Eliminar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Cancelar"/>                                      
                                </c:when>
                                <c:otherwise>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Guardar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Modificar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" onclick="return confirm('¿Desea borrar el dato?')" value="Eliminar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Cancelar"/>                                     
                                </c:otherwise>
                            </c:choose>
                        </center>
                        <br/>
                    </div>
                </form>
                <form name="TablaForm" method="POST" action="PersonasServ" class="col s12">
                    <jsp:useBean id="beanPersonasCtrl" class="com.sv.udb.controlador.PersonasCtrl" scope="page"/>
                    <table border="1" class="striped">
                        <thead>
                            <tr>
                                <th class="card-panel teal lighten-2">Nombre</th>
                                <th class="card-panel teal lighten-2">Apellido</th>
                                <th class="card-panel teal lighten-2">Tipo</th>
                                <th class="card-panel teal lighten-2">Genero</th>
                                <th class="card-panel teal lighten-2">Nacimiento</th>
                                <th class="card-panel teal lighten-2">DUI</th>
                                <th class="card-panel teal lighten-2">NIT</th>
                                <th class="card-panel teal lighten-2">Tipo sangre</th>
                                <th class="card-panel teal lighten-2">Dirección</th>
                                <th class="card-panel teal lighten-2">--</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${beanPersonasCtrl.consTodo()}" var="fila">
                                <tr>
                                    <td><c:out value="${fila.nombPers}"></c:out></td>
                                    <td><c:out value="${fila.apelPers}"></c:out></td>
                                    <td><c:out value="${fila.nombTipo}"></c:out></td>
                                    <td><c:out value="${fila.genePers}"></c:out></td>
                                    <td><c:out value="${fila.fechNaci}"></c:out></td>
                                    <td><c:out value="${fila.dui}"></c:out></td>
                                    <td><c:out value="${fila.nit}"></c:out></td>
                                    <td><c:out value="${fila.tipoSangre}"></c:out></td>
                                    <td><c:out value="${fila.nombUbic}"></c:out></td>
                                    <td><p><input id="${fila.idPers}" type="radio" name="codiPersRadi" value="${fila.idPers}"/><label for="${fila.idPers}"></label></p></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                    <div class="col s12">
                        <center>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Consultar"/>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Ficha"/>
                        </center>
                    </div>
                    <br/>
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
