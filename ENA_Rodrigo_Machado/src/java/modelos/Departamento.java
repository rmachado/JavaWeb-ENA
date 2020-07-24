/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.util.ArrayList;

/**
 *
 * @author rodrigo
 */
public class Departamento {

    private int id;
    private String nombre;
    private Gerencia gerencia;
    private boolean asignabe;
    private ArrayList<Encargado> encargados;

    public Departamento() {
    }

    public Departamento(int id, String nombre, Gerencia gerencia, boolean asignabe) {
        this.id = id;
        this.nombre = nombre;
        this.gerencia = gerencia;
        this.asignabe = asignabe;
        this.encargados = new ArrayList();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Gerencia getGerencia() {
        return gerencia;
    }

    public void setGerencia(Gerencia gerencia) {
        this.gerencia = gerencia;
    }

    public boolean isAsignabe() {
        return asignabe;
    }

    public void setAsignabe(boolean asignabe) {
        this.asignabe = asignabe;
    }

    public ArrayList<Encargado> getEncargados() {
        return encargados;
    }

    public void setEncargados(ArrayList<Encargado> encargados) {
        this.encargados = encargados;
    }
    
    @Override
    public String toString() {
        return nombre;
    }
        
}
