<%-- 
    Document   : inde
    Created on : Jul 24, 2020, 2:49:20 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css" />
        <title>Autentificación</title>
    </head>
    <body>
        <center>
            <h1>Autentificación</h1>
            
            <form>
                <table>
                    <tr>
                        <td><strong>Usuario</strong></td>
                        <td><input type="text" name="nombre" required /></td>
                    </tr>
                    <tr>
                        <td><strong>Password</strong></td>
                        <td><input type="password" name="password" required /></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="recordar" />
                            Recordar
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Ingresar" />
                        </td>
                    </tr>    
                </table>
            </form>
        </center>
    </body>
</html>
