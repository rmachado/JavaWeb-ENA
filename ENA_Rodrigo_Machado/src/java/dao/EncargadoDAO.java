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
import modelos.Encargado;

/**
 *
 * @author rodrigo
 */
public class EncargadoDAO extends Conexion {
    
    public ArrayList<Encargado> obtenerEncargados() throws SQLException {
        String sentencia = "select * from encargado";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Encargado> encargados = new ArrayList();
            while(rs.next()){
               encargados.add(new Encargado(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido")));
            }
            return encargados;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
}
