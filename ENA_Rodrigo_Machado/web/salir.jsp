<%-- 
    Document   : salir
    Created on : Jul 24, 2020, 7:59:26 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    session.setAttribute("usuario", null);
    response.sendRedirect("index.jsp");
%>