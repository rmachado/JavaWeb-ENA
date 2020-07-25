<%-- 
    Document   : intranet
    Created on : Jul 24, 2020, 2:59:47 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css" />
        <title>Menú Principal</title>
    </head>
    <%
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp?msj=Acceso denegado");
        }
    %>
    <body>
        <main>
            <h1>Menú Principal</h1>
            <table>
                <tr>
                    <td>
                        <a href="ingresarRequerimiento.jsp"><button>Ingresar Requerimiento</button></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="consultarRequerimientos.jsp"><button>Consultar Requerimientos</button></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="cerrarRequerimientos.jsp"><button>Cerrar Requerimientos</button></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="salir.jsp">Cerrar sesión</a>
                    </td>
                </tr>
            </table>
                
            
        </main>
    </body>
</html>
