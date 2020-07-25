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
        
        int idGerencia = request.getParameter("gerencia") != null ? Integer.parseInt(request.getParameter("gerencia")) : 0;
        int idDptoSolicitante = request.getParameter("dpto") != null ? Integer.parseInt(request.getParameter("dpto")) : 0;
        int idDptoAsignado = request.getParameter("asignado") != null ? Integer.parseInt(request.getParameter("asignado")) : 0;
        int idEncargado = request.getParameter("encargado") != null ? Integer.parseInt(request.getParameter("encargado")) : 0;
    %>
    <body>
        <main>
            <h1>Ingresar Requerimiento</h1>

            <form action="ControladorRequerimiento" method="post">
                <table>
                    <tr>
                        <td><strong>Gerencia:</strong></td>
                        <td>
                            <select name="idGerencia" id="gerencia" required>
                                <option value="0">Seleccionar</option>
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
                            <select name="idDptoSolicitante" id="dptoSolicitante" required>
                                <option value="0">Seleccionar</option>
                                <% for(Departamento d: dptos) {
                                    if (idGerencia == 0 || d.getGerencia().getId() == idGerencia) {
                                %>
                                        <option value="<%= d.getId() %>" <%if(d.getId() == idDptoSolicitante){%>selected="selected"<%}%>>
                                            <%= d %>
                                        </option>
                                <%  }
                                   }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Asignar a:</strong></td>
                        <td>
                            <select name="idDptoAsignado" id="dptoAsignado" required>
                                <option value="0">Seleccionar</option>
                                <% for(Departamento d: dptos) {
                                     if (d.isAsignabe()) {
                                %>
                                        <option value="<%= d.getId() %>" <%if(d.getId() == idDptoAsignado){%>selected="selected"<%}%>>
                                            <%= d %>
                                        </option>
                                <%   }
                                   }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Encargado:</strong></td>
                        <td>
                            <select name="idEncargado" id="encargado" required>
                                <option value="0">Seleccionar</option>
                                <% for(Encargado e: encargados) {
                                      if (idDptoAsignado == 0 || e.getDepartamento().getId() == idDptoAsignado) {
                                %>
                                        <option value="<%= e.getId() %>" <%if(e.getId() == idEncargado){%>selected="selected"<%}%>>
                                            <%= e %>
                                        </option>
                                <%    }
                                   }
                                %>
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
        <script>
            window.onload = function() {
                
                function onChange() {
                    var idGerencia = document.getElementById("gerencia").value;
                    var idDpto = document.getElementById("dptoSolicitante").value;
                    var idAsignado = document.getElementById("dptoAsignado").value;
                    var idEncargado = document.getElementById("encargado").value;
                    window.location.href = "ingresarRequerimiento.jsp?gerencia=" + idGerencia + "&dpto=" + idDpto + "&asignado=" + idAsignado + "&encargado=" + idEncargado;
                }
                
                document.getElementById("gerencia").onchange = onChange;
                document.getElementById("dptoAsignado").onchange = onChange;
            }
        </script>
    </body>
</html>
