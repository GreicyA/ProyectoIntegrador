
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Importacion;
import util.MySQLConexion;


public class ImportaControl {
    public List<Importacion> obtenerImportacionesPorFecha(Date fecha) {
    List<Importacion> lista = new ArrayList<>();
    String sql = "SELECT * FROM importaciones WHERE fecha_emision = ?";
    try (Connection cn = MySQLConexion.getConexion();
         PreparedStatement st = cn.prepareStatement(sql)) {
        
        st.setDate(1, new java.sql.Date(fecha.getTime()));
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Importacion imp = new Importacion();
            imp.setId_importacion(rs.getInt("id_importacion"));
            imp.setCodigo_importacion(rs.getString("codigo_importacion"));
            imp.setFecha_emision(rs.getDate("fecha_emision"));
            imp.setFecha_estimada_arribo(rs.getDate("fecha_estimada_arribo"));
            imp.setFecha_real_arribo(rs.getDate("fecha_real_arribo"));
            imp.setEstado(rs.getString("estado"));
            imp.setId_proveedor(rs.getInt("id_proveedor"));
            imp.setResponsable(rs.getInt("responsable"));
            lista.add(imp);
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return lista;
    }
     public Importacion obtenerImportacionPorId(int id) {
        Importacion imp = null;
        String sql = "SELECT * FROM importaciones WHERE id_importacion = ?";
        try (Connection cn = MySQLConexion.getConexion();
             PreparedStatement st = cn.prepareStatement(sql)) {

            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                imp = new Importacion();
                imp.setId_importacion(rs.getInt("id_importacion"));
                imp.setCodigo_importacion(rs.getString("codigo_importacion"));
                imp.setFecha_emision(rs.getDate("fecha_emision"));
                imp.setFecha_estimada_arribo(rs.getDate("fecha_estimada_arribo"));
                imp.setFecha_real_arribo(rs.getDate("fecha_real_arribo"));
                imp.setEstado(rs.getString("estado"));
                imp.setId_proveedor(rs.getInt("id_proveedor"));
                imp.setResponsable(rs.getInt("responsable"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return imp;
    }
}