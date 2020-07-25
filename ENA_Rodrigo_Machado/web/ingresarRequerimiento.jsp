<%-- 
    Document   : ingresarRequerimiento
    Created on : Jul 24, 2020, 3:04:10 PM
    Author     : rodrigo
--%>

<%@page import="dao.EncargadoDAO"%>
<%@page import="modelos.Encargado"%>
<%@page import="dao.DepartamentoDAO"%>
<%@page import="modelos.Departamento"%>
<%@page import="dao.GerenciaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Gerencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css" />
        <title>Ingresar Requerimiento</title>
    </head>
    <%
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp?msj=Acceso denegado");
        }
        
        ArrayList<Gerencia> gerencias = new GerenciaDAO().obtenerGerencias();
        ArrayList<Departamento> dptos = new DepartamentoDAO().obtenerDepartamentos();
        ArrayList<Encargado> encargados = new EncargadoDAO().obtenerEncargados();
    %>
    <body>
        <main>
            <h1>Ingresar Requerimiento</h1>

            <form action="ControladorRequerimiento" method="post">
                <table>
                    <tr>
                        <td><strong>Gerencia:</strong></td>
                        <td>
                            <select name="idGerencia" required>
                                <option value="">Seleccionar</option>
                                <% for(Gerencia g: gerencias) { %>
                                    <option value="<%= g.getId() %>"><%= g %></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Depto.:</strong></td>
                        <td>
                            <select name="idDptoSolicitante" required>
                                <option value="">Seleccionar</option>
                                <% for(Departamento d: dptos) { %>
                                    <option value="<%= d.getId() %>"><%= d %></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Asignar a:</strong></td>
                        <td>
                            <select name="idDptoAsignado" required>
                                <option value="">Seleccionar</option>
                                <% for(Departamento d: dptos) {
                                     if (d.isAsignabe()) {
                                %>
                                        <option value="<%= d.getId() %>"><%= d %></option>
                                <%   }
                                   }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Encargado:</strong></td>
                        <td>
                            <select name="idEncargado" required>
                                <option value="">Seleccionar</option>
                                <% for(Encargado e: encargados) { %>
                                    <option value="<%= e.getId() %>"><%= e %></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Requerimiento:</strong></td>
                        <td>
                            <textarea name="descripcion" required rows="5" cols="30" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan="2">
                            <% if (request.getParameter("msj") != null) { %>
                                <span class="alert"><%= request.getParameter("msj") %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="accion" value="1" />
                            <input type="submit" value="Guardar" />
                        </td>
                        <td>
                            <a href="menu.jsp"><button type="button">Volver al menú</button></a>
                        </td>
                    </tr>
                </table>
            </form>
        </main>
    </body>
</html>
