/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.DepartamentoDAO;
import dao.EncargadoDAO;
import dao.GerenciaDAO;
import dao.RequerimientoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Departamento;
import modelos.Encargado;
import modelos.Gerencia;
import modelos.Requerimiento;

/**
 *
 * @author rodrigo
 */
@WebServlet(name = "ControladorRequerimiento", urlPatterns = {"/ControladorRequerimiento"})
public class ControladorRequerimiento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("accion")!=null){
            String accion = request.getParameter("accion");
            switch(accion){
                case "1": ingresarRequerimiento(request,response);
                    break;
                case "2": cerrarRequerimiento(request, response);
                    break;
                default: response.sendRedirect("ingresarRequerimiento.jsp?msj=Acción no permitida");
            }
        }else{
            response.sendRedirect("ingresarRequerimiento.jsp?msj=Acción no permitida");
        }
    }
    
    private void ingresarRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idGerencia = Integer.parseInt(request.getParameter("idGerencia"));
            int idDptoSolicitante = Integer.parseInt(request.getParameter("idDptoSolicitante"));
            int idEncargado = Integer.parseInt(request.getParameter("idEncargado"));
            String descripcion = request.getParameter("descripcion");
            
            if (descripcion.equals("") || idGerencia <= 0 || idDptoSolicitante <= 0 || idEncargado <= 0) {
                response.sendRedirect("ingresarRequerimiento.jsp?msj=Faltan datos obligatorios");
            } else {
                GerenciaDAO gd = new GerenciaDAO();
                Gerencia gerencia = gd.obtenerGerencia(idGerencia);
                if (gerencia != null) {
                    DepartamentoDAO dd = new DepartamentoDAO();
                    Departamento dptoSolicitante = dd.obtenerDepartamento(idDptoSolicitante);
                    if (dptoSolicitante != null) {
                        EncargadoDAO ed = new EncargadoDAO();
                        Encargado encargado = ed.obtenerEncargado(idEncargado);
                        if (encargado != null) {
                            RequerimientoDAO rd = new RequerimientoDAO();
                            Requerimiento nuevoReq = new Requerimiento(dptoSolicitante, encargado, descripcion, false);
                            
                            int res = rd.ingresarRequerimiento(nuevoReq);
                            if (res == 1) {
                                response.sendRedirect("ingresarRequerimiento.jsp?msj=El requerimiento fue ingresado correctamente");
                            } else {
                                response.sendRedirect("ingresarRequerimiento.jsp?msj=El requerimiento no se pudo ingresar");
                            }
                        } else {
                            response.sendRedirect("ingresarRequerimiento.jsp?msj=El encargado no existe");
                        }
                    } else {
                        response.sendRedirect("ingresarRequerimiento.jsp?msj=El departamento solicitante no existe");
                    }
                } else {
                    response.sendRedirect("ingresarRequerimiento.jsp?msj=La gerencia no existe");
                }
            }
        } catch (Exception e) {
            response.sendRedirect("ingresarRequerimiento.jsp?msj=" + e.getMessage());
        }
    }
    
    private void cerrarRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idRequerimiento = Integer.parseInt(request.getParameter("idRequerimiento"));
            
            if (idRequerimiento <= 0) {
                response.sendRedirect("cerrarRequerimientos.jsp?msj=Faltan datos obligatorios");
            } else {
                RequerimientoDAO rd = new RequerimientoDAO();
                Requerimiento req = rd.obtenerRequerimiento(idRequerimiento);
                if (req != null) {
                    req.setCerrado(true);
                    int res = rd.modificarRequerimiento(req);
                    if (res == 1) {
                        response.sendRedirect("cerrarRequerimientos.jsp?msj=El requerimiento fue cerrado correctamente");
                    } else {
                        response.sendRedirect("cerrarRequerimientos.jsp?msj=El requerimiento no se pudo cerrar");
                    }
                } else {
                    response.sendRedirect("cerrarRequerimientos.jsp?msj=El requerimiento no existe");
                }
            }
        } catch (Exception e) {
            response.sendRedirect("cerrarRequerimientos.jsp?msj=" + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
