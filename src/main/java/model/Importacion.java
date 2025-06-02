
package model;

import java.util.Date;


public class Importacion {
    int id_importacion;
    String codigo_importacion;
    Date fecha_emision;
    Date fecha_estimada_arribo;
    Date fecha_real_arribo;
    String estado;
    int id_proveedor;
    int responsable;

    public int getId_importacion() {
        return id_importacion;
    }

    public void setId_importacion(int id_importacion) {
        this.id_importacion = id_importacion;
    }

    public String getCodigo_importacion() {
        return codigo_importacion;
    }

    public void setCodigo_importacion(String codigo_importacion) {
        this.codigo_importacion = codigo_importacion;
    }

    public Date getFecha_emision() {
        return fecha_emision;
    }

    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public Date getFecha_estimada_arribo() {
        return fecha_estimada_arribo;
    }

    public void setFecha_estimada_arribo(Date fecha_estimada_arribo) {
        this.fecha_estimada_arribo = fecha_estimada_arribo;
    }

    public Date getFecha_real_arribo() {
        return fecha_real_arribo;
    }

    public void setFecha_real_arribo(Date fecha_real_arribo) {
        this.fecha_real_arribo = fecha_real_arribo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getResponsable() {
        return responsable;
    }

    public void setResponsable(int responsable) {
        this.responsable = responsable;
    }

    
}
