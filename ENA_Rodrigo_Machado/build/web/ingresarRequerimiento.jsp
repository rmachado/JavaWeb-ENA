<%-- 
    Document   : ingresarRequerimiento
    Created on : Jul 24, 2020, 3:04:10 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css" />
        <title>Ingresar Requerimiento</title>
    </head>
    <body>
        <center>
            <h1>Ingresar Requerimiento</h1>

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
                        <td><strong>Asignar a:</strong></td>
                        <td>
                            <select name="idDptoAsignado" required>
                                <option value="">Seleccionar</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Encargado:</strong></td>
                        <td>
                            <select name="idEncargado" required>
                                <option value="">Seleccionar</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Requerimiento:</strong></td>
                        <td>
                            <textarea name="descripcion" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Guardar" />
                        </td>
                        <td>
                            <a href="menu.jsp"><button type="button">Volver al menú</button></a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>
