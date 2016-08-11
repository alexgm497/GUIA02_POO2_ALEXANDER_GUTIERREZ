/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Personas;
import com.sv.udb.recursos.Conexion;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alexander José
 */
public class PersonasCtrl {
    public boolean guar(Personas obje, InputStream foto, String FechAlta){
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try{
            String Consulta = "INSERT INTO PERS VALUES(?,?,?,?,?,?,STR_TO_DATE(?, '%d-%m-%Y'),?,?,?,?,STR_TO_DATE(?, '%d-%m-%Y %H:%i:%s'),NULL,NULL)";
            PreparedStatement cmd = cn.prepareStatement(Consulta);
            cmd.setInt(1, obje.getIdPers());
            cmd.setString(2, obje.getNombPers());
            cmd.setString(3, obje.getApelPers());
            cmd.setBlob(4, foto);
            cmd.setInt(5, obje.getIdTipo());
            cmd.setString(6, obje.getGenePers());
            cmd.setString(7, obje.getFechNaci());
            cmd.setString(8, obje.getDui());
            cmd.setString(9, obje.getNit());
            cmd.setString(10, obje.getTipoSangre());
            cmd.setInt(11, obje.getIdDirec());
            cmd.setString(12, FechAlta);
            cmd.executeUpdate();
            resp = true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            if(cn!= null){
                try{
                    if(!cn.isClosed()){
                        cn.close();
                    }
                }catch(SQLException ex){
                     ex.printStackTrace();
                }
            }
        }
        return resp;
    }
    public int consNum(){
        int cant = 0;
        Connection cn = new Conexion().getConn();
        try{
            String consulta = "SELECT COUNT(*) FROM PERS";
            PreparedStatement cmd = cn.prepareStatement(consulta);
            ResultSet rs = cmd.executeQuery();
            if(rs.next()){
                cant = rs.getInt(1);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            if(cn!= null){
                try{
                    if(!cn.isClosed()){
                        cn.close();
                    }
                }catch(SQLException ex){
                     ex.printStackTrace();
                }
            }
        }
        return cant;
    }
}
