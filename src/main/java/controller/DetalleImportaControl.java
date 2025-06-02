
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.DetalleImporta;
import util.MySQLConexion;

public class DetalleImportaControl {
     public List<DetalleImporta> listaDetallePorImportacion(int idImportacion) {
        List<DetalleImporta> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT id_detalle, id_importacion, id_producto, cantidad, precio_unitario, subtotal " +
                         "FROM detalle_importacion WHERE id_importacion = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, idImportacion);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DetalleImporta d = new DetalleImporta();
                d.setId_detalle(rs.getInt(1));
                d.setId_importacion(rs.getInt(2));
                d.setId_producto(rs.getInt(3));
                d.setCantidad(rs.getInt(4));
                d.setPrecio_unitario(rs.getDouble(5));
                d.setSubtotal(rs.getDouble(6));
                lista.add(d);
            }
            rs.close();
            st.close();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
    
}
