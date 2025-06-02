<%@ page import="java.util.List" %>
<%@ page import="model.DetalleImporta" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Detalles de Importación</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Detalles de Importación</h2>
    <a href="buscarImportaciones.jsp" class="btn btn-secondary mb-3">← Volver</a>
    <%
        List<DetalleImporta> detalles = (List<DetalleImporta>) request.getAttribute("listaDetalles");
        if (detalles != null && !detalles.isEmpty()) {
    %>
    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID Detalle</th>
            <th>ID Producto</th>
            <th>Cantidad</th>
            <th>Precio Unitario</th>
            <th>Subtotal</th>
        </tr>
        </thead>
        <tbody>
        <% for (DetalleImporta det : detalles) { %>
            <tr>
                <td><%= det.getId_detalle() %></td>
                <td><%= det.getId_producto() %></td>
                <td><%= det.getCantidad() %></td>
                <td><%= det.getPrecio_unitario() %></td>
                <td><%= det.getSubtotal() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
        <div class="alert alert-warning">No se encontraron detalles para esta importación.</div>
    <% } %>
</div>
</body>
</html>
