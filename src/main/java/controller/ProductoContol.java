
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Producto;
import util.MySQLConexion;

public class ProductoContol {
    
    public List<Producto> LisProducto() {
        List<Producto> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();

        try {
            String sql = "SELECT id_producto, nombre_producto, descripcion, unidad_medida, categoria FROM productos";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt(1));
                p.setNombre_producto(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setUnidad_medida(rs.getString(4));
                p.setCategoria(rs.getString(5));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return lista;
    }

    
    public void AddProducto(String nombre, String descripcion, String unidad, String categoria) {
        Connection cn = MySQLConexion.getConexion();

        try {
            String sql = "INSERT INTO productos (nombre_producto, descripcion, unidad_medida, categoria) VALUES (?, ?, ?, ?)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, nombre);
            st.setString(2, descripcion);
            st.setString(3, unidad);
            st.setString(4, categoria);
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
