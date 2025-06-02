package controller;

import java.sql.*;
import model.Empleado;
import util.MySQLConexion;

public class EmpleadoControl {
    public Empleado validar(String usuario, String clave) {
        Empleado emp = null;
        try (Connection cn = MySQLConexion.getConexion()) {
            String sql = "SELECT * FROM empleados WHERE correo=? AND contrasena=? ";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(4, usuario);
            st.setString(5, clave);
        
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                emp = new Empleado();
                emp.setId_empleado(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setApellido(rs.getString(3));
                emp.setCorreo(rs.getString(4));
                emp.setContrasena(rs.getString(5));
                emp.setEstado(rs.getString(6));
                emp.setId_rol(rs.getInt(7)); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }
}
