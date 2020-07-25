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
import modelos.Requerimiento;

/**
 *
 * @author rodrigo
 */
public class RequerimientoDAO extends Conexion {
    
    public int ingresarRequerimiento(Requerimiento requerimiento) throws SQLException {
        String sentencia = "insert into requerimiento (idDptoSolicitante, idEncargadoAsignado, descripcion, cerrado) values (?,?,?,?)";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ps.setInt(1, requerimiento.getSolicitante().getId());
            ps.setInt(2, requerimiento.getEncargadoAsignado().getId());
            ps.setString(3, requerimiento.getDescripcion());
            ps.setInt(4, requerimiento.isCerrado() ? 1 : 0);
            
            return ps.executeUpdate();
        } catch (Exception e) {
            return -1;
        } finally {
            desconectar();
        }
    }
    
    public int modificarRequerimiento(Requerimiento requerimiento) throws SQLException {
        String sentencia = "update requerimiento set cerrado=? where id = ?";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ps.setInt(1, requerimiento.isCerrado() ? 1 : 0);
            ps.setInt(2, requerimiento.getId());
            
            return ps.executeUpdate();
        } catch (Exception e) {
            return -1;
        } finally {
            desconectar();
        }
    }
    
    public Requerimiento obtenerRequerimiento(int idRequerimiento) throws SQLException {
        String sentencia = "select * from v_requerimiento where id = ?";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ps.setInt(1, idRequerimiento);
            ResultSet rs = ps.executeQuery();
            Requerimiento req = null;
            while(rs.next()){
                Gerencia gerencia = new Gerencia(rs.getInt("idGerencia"), rs.getString("gerencia"));
                Departamento dptoSolicitante = new Departamento(rs.getInt("idDptoSolicitante"), rs.getString("departamento"), gerencia, rs.getInt("asignable") == 1);
                Departamento dptoAsignado = new Departamento(rs.getInt("idDepartamentoAsignado"), rs.getString("departamentoAsignado"), null, true);
                Encargado encargado = new Encargado(rs.getInt("idEncargadoAsignado"), rs.getString("nombreEncargado"), rs.getString("apellidoEncargado"), dptoAsignado);
                
                req = new Requerimiento(rs.getInt("id"), dptoSolicitante, encargado, rs.getString("descripcion"), rs.getInt("cerrado") == 1);
            }
            return req;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Requerimiento> obtenerRequerimientos() throws SQLException {
        String sentencia = "select * from v_requerimiento";
        try{
            conectar();
            PreparedStatement ps= obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Requerimiento> reqs = new ArrayList();
            while(rs.next()){
                Gerencia gerencia = new Gerencia(rs.getInt("idGerencia"), rs.getString("gerencia"));
                Departamento dptoSolicitante = new Departamento(rs.getInt("idDptoSolicitante"), rs.getString("departamento"), gerencia, rs.getInt("asignable") == 1);
                Departamento dptoAsignado = new Departamento(rs.getInt("idDepartamentoAsignado"), rs.getString("departamentoAsignado"), null, true);
                Encargado encargado = new Encargado(rs.getInt("idEncargadoAsignado"), rs.getString("nombreEncargado"), rs.getString("apellidoEncargado"), dptoAsignado);
                
                reqs.add(new Requerimiento(rs.getInt("id"), dptoSolicitante, encargado, rs.getString("descripcion"), rs.getInt("cerrado") == 1));
            }
            return reqs;
        }catch(Exception e){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
    
}
