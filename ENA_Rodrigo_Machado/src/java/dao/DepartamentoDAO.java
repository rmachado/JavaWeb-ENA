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
import modelos.Gerencia;

/**
 *
 * @author rodrigo
 */
public class DepartamentoDAO extends Conexion {
    
    public ArrayList<Departamento> obtenerDepartamentos() throws SQLException {
        String sentencia = "select * from v_departamento";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Departamento> departamentos = new ArrayList();
            while(rs.next()){
               Gerencia gerencia = new Gerencia(rs.getInt("idGerencia"), rs.getString("nombreGerencia"));
               departamentos.add(new Departamento(rs.getInt("id"), rs.getString("nombre"), gerencia, rs.getInt("asignable") == 1));
            }
            return departamentos;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
}
