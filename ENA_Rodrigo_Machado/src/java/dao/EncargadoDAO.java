/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Departamento;
import modelos.Encargado;
import modelos.Gerencia;

/**
 *
 * @author rodrigo
 */
public class EncargadoDAO extends Conexion {
    
    public Encargado obtenerEncargado(int idEncargado) throws SQLException {
        String sentencia = "select * from v_encargado where id = ?";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ps.setInt(1, idEncargado);
            ResultSet rs = ps.executeQuery();
            Encargado encargado = null;
            if(rs.next()){
               Gerencia gerencia = new Gerencia(rs.getInt("idGerencia"), rs.getString("gerencia")) ;
               Departamento dpto = new Departamento(rs.getInt("idDepartamento"), rs.getString("departamento"), gerencia, rs.getInt("asignable") == 1);
               encargado = new Encargado(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), dpto);
            }
            return encargado;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Encargado> obtenerEncargados() throws SQLException {
        String sentencia = "select * from v_encargado";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Encargado> encargados = new ArrayList();
            while(rs.next()){
               Gerencia gerencia = new Gerencia(rs.getInt("idGerencia"), rs.getString("gerencia")) ;
               Departamento dpto = new Departamento(rs.getInt("idDepartamento"), rs.getString("departamento"), gerencia, rs.getInt("asignable") == 1);
               encargados.add(new Encargado(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), dpto));
            }
            return encargados;
        }catch(Exception e){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
    
}
