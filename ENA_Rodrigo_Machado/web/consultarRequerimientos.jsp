<%-- 
    Document   : consultarRequerimientos
    Created on : Jul 24, 2020, 3:17:05 PM
    Author     : rodrigo
--%>

<%@page import="dao.RequerimientoDAO"%>
<%@page import="modelos.Requerimiento"%>
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
        <title>Consultar Requerimientos</title>
    </head>
    <%
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp?msj=Acceso denegado");
        }
        
        ArrayList<Gerencia> gerencias = new GerenciaDAO().obtenerGerencias();
        ArrayList<Departamento> dptos = new DepartamentoDAO().obtenerDepartamentos();
        ArrayList<Encargado> encargados = new EncargadoDAO().obtenerEncargados();
        
        int idGerencia = request.getParameter("idGerencia") != null ? Integer.parseInt(request.getParameter("idGerencia")) : 0;
        int idDpto = request.getParameter("idDptoSolicitante") != null ? Integer.parseInt(request.getParameter("idDptoSolicitante")) : 0;
        int idEncargado = request.getParameter("idEncargado") != null ? Integer.parseInt(request.getParameter("idEncargado")) : 0;
    %>
    <body>
        <main>
            <h1>Consultar Requerimientos</h1>
            
            <form action="consultarRequerimientos.jsp" method="get">
                <table>
                    <tr>
                        <td><strong>Gerencia:</strong></td>
                        <td>
                            <select name="idGerencia" id="gerencia" required>
                                <option value="0">Todos</option>
                                <% for(Gerencia g: gerencias) { %>
                                    <option value="<%= g.getId() %>" <%if(g.getId() == idGerencia){%>selected="selected"<%}%>>
                                        <%= g %>
                                    </option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Depto.:</strong></td>
                        <td>
                            <select name="idDptoSolicitante" id="dpto" required>
                                <option value="0">Todos</option>
                                <% for(Departamento d: dptos) {
                                    if (idGerencia == 0 || d.getGerencia().getId() == idGerencia) {
                                %>
                                        <option value="<%= d.getId() %>" <%if(d.getId() == idDpto){%>selected="selected"<%}%>>
                                            <%= d %>
                                        </option>
                                <%  }
                                   }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Asignado a:</strong></td>
                        <td>
                            <select name="idEncargado" id="encargado" required>
                                <option value="0">Todos</option>
                                <% for(Encargado e: encargados) {%>
                                    <option value="<%= e.getId() %>" <%if(e.getId() == idEncargado){%>selected="selected"<%}%>>
                                        <%= e %>
                                    </option>
                                <% } %>
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
                        <th><strong>Estado</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int filas = 0;
                        ArrayList<Requerimiento> reqs = new RequerimientoDAO().obtenerRequerimientos();
                        for(Requerimiento req: reqs) {
                            if (idGerencia == 0 || req.getSolicitante().getGerencia().getId() == idGerencia) {
                                if (idDpto == 0 || req.getSolicitante().getId() == idDpto) {
                                    if (idEncargado == 0 || req.getEncargadoAsignado().getId() == idEncargado) {
                                        filas += 1;
                    %>
                        <tr>
                            <td><%= req.getSolicitante().getGerencia() %></td>
                            <td><%= req.getSolicitante() %></td>
                            <td><%= req.getEncargadoAsignado() %></td>
                            <td><%= req.getDescripcion() %></td>
                            <td><%= req.isCerrado() ? "Cerrado" : "Abierto" %></td>
                        </tr>
                    <%
                                    }
                                }
                            }
                        }
                        
                        if (filas == 0) {
                    %>
                        <tr>
                            <td colSpan="5">No hay requerimientos ingresados</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
                
            <% if (request.getParameter("msj") != null) { %>
                <span class="alert"><%= request.getParameter("msj") %></span>
            <% } %>
            
            <a href="menu.jsp"><button type="button">Volver al menú</button></a>
        </main>
        <script>
            window.onload = function() {
                
                function onChange() {
                    var idGerencia = document.getElementById("gerencia").value;
                    var idDpto = document.getElementById("dpto").value;
                    var idEncargado = document.getElementById("encargado").value;
                    window.location.href = "consultarRequerimientos.jsp?idGerencia=" + idGerencia + "&idDptoSolicitante=" + idDpto + "&idEncargado=" + idEncargado;
                }
                
                document.getElementById("gerencia").onchange = onChange;
            }
        </script>
    </body>
</html>
