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
        <%
            String nombreUsuario = "";
            for(Cookie c: request.getCookies()) {
                if (c.getName().equals("nombreUsuario")) {
                    nombreUsuario = c.getValue();
                }
            }
        %>
        <main>
            <h1>Autentificación</h1>
            
            <form action="ControladorUsuario" method="post">
                <table>
                    <tr>
                        <td><strong>Usuario</strong></td>
                        <td><input type="text" name="nombre" required value="<%= nombreUsuario %>" /></td>
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
                        <td colspan="2">
                            <% if (request.getParameter("msj") != null) { %>
                                <span class="alert"><%= request.getParameter("msj") %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="hidden" name="accion" value="1" />
                            <input type="submit" value="Ingresar" />
                        </td>
                    </tr>    
                </table>
            </form>
        </main>
    </body>
</html>
