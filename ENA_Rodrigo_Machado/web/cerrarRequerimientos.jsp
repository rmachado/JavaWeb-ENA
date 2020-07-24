<%-- 
    Document   : cerrarRequerimientos
    Created on : Jul 24, 2020, 3:27:14 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css" />
        <title>Cerrar Requerimientos</title>
    </head>
    <body>
        <center>
            <h1>Cerrar Requerimientos</h1>
            
            <form>
                <table>
                    <tr>
                        <td><strong>Gerencia:</strong></td>
                        <td>
                            <select name="idGerencia" required>
                                <option value="">Seleccionar</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Depto.:</strong></td>
                        <td>
                            <select name="idDptoSolicitante" required>
                                <option value="">Seleccionar</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Asignado a:</strong></td>
                        <td>
                            <select name="idDptoAsignado" required>
                                <option value="">Seleccionar</option>
                            </select>
                        </td>
                        <td>
                            <input type="submit" value="Buscar" />
                        </td>
                    </tr>
                </table>
            </form>
            
            <table class="celled">
                <thead>
                    <tr>
                        <th><strong>Gerencia</strong></th>
                        <th><strong>Depto.</strong></th>
                        <th><strong>Asignado a</strong></th>
                        <th><strong>Requerimiento</strong></th>
                        <th><strong>Acciones</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colSpan="5">No hay requerimientos abiertos</td>
                    </tr>
                </tbody>
            </table>
            
            <a href="menu.jsp"><button type="button">Volver al menú</button></a>
        </center>
    </body>
</html>
