/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author rodrigo
 */
public class Requerimiento {

    private int id;
    private Departamento solicitante;
    private Encargado encargadoAsignado;
    private String descripcion;
    private boolean cerrado;

    public Requerimiento() {
    }

    public Requerimiento(Departamento solicitante, Encargado encargadoAsignado, String descripcion, boolean cerrado) {
        this.solicitante = solicitante;
        this.encargadoAsignado = encargadoAsignado;
        this.descripcion = descripcion;
        this.cerrado = cerrado;
    }
    
    public Requerimiento(int id, Departamento solicitante, Encargado encargadoAsignado, String descripcion, boolean cerrado) {
        this.id = id;
        this.solicitante = solicitante;
        this.encargadoAsignado = encargadoAsignado;
        this.descripcion = descripcion;
        this.cerrado = cerrado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Departamento getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(Departamento solicitante) {
        this.solicitante = solicitante;
    }

    public Encargado getEncargadoAsignado() {
        return encargadoAsignado;
    }

    public void setEncargadoAsignado(Encargado encargadoAsignado) {
        this.encargadoAsignado = encargadoAsignado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isCerrado() {
        return cerrado;
    }

    public void setCerrado(boolean cerrado) {
        this.cerrado = cerrado;
    }
   
}
