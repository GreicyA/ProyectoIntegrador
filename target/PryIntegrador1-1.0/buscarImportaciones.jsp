<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Importacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte de Importaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      background-color: #f4f4f4;
    }

    /* Menú lateral */
    .sidebar {
      width: 220px;
      background-color: #003366;
      color: white;
      height: 100vh;
      position: fixed;
      display: flex;
      flex-direction: column;
      padding-top: 20px;
    }

    .sidebar h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    .sidebar a {
      padding: 12px 20px;
      text-decoration: none;
      color: white;
      display: block;
      transition: background 0.3s;
    }

    .sidebar a:hover {
      background-color: #0059b3;
    }

    /* Contenido principal */
    .main-content {
      margin-left: 220px;
      padding: 20px;
      flex-grow: 1;
    }

    .card {
      background: white;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      padding: 20px;
      justify-content: space-evenly;
    }
    .card1 {
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      width: 300px;
      text-align: center;
    }

    .card h3 {
      margin-top: 0;
    }
    .status {
      font-weight: bold;
    }
    .alerta {
      color: #d9534f;
    }

    .estado-pendiente { color: #f0ad4e; }
    .estado-transito { color: #5bc0de; }
    .estado-recibido { color: #5cb85c; }

    footer {
      margin-top: 40px;
      text-align: center;
      font-size: 14px;
      color: #888;
    }
  </style>
</head>
<body class="bg-light">

    <div class="sidebar">
      <h2>Menú</h2>
      <a href="principal.jsp">Principal</a>
            <a href="#">Roles</a>
            <a href="#">Empleados</a>
            <a href="LisProvee.jsp">Proveedores</a>
            <a href="#">Tipo de Seguimiento</a>
            <a href="Producto.jsp">Productos</a>
            <a href="buscarImportacion.jsp">Importaciones</a>
            <a href="buscarImportaciones.jsp">Detalle Importación</a>
            <a href="#">Seguimiento de Plazos</a>
            <a href="almacen.jsp">Almacenes</a>
            <a href="#">Alertas</a>
            <a href="#">Historial de Cambios</a>
            <a href="devolucion.jsp">Devoluciones</a>
  </div>
    
<div class="main-content mt-5">
    <h2 class="mb-4 text-primary">Reporte de Importaciones por Fecha</h2>

    <!-- Formulario -->
    
    <form action="BuscarImporta" method="get" class="row g-3 mt-4">
    <input type="hidden" name="opc" value="1"> <!-- Opcional si tu servlet lo usa -->
    <div class="col-auto">
        <label for="fecha" class="form-label">Seleccione una fecha:</label>
        <input type="date" class="form-control" name="fecha" id="fecha" required>
    </div>
    <div class="col-auto align-self-end">
        <button type="submit" class="btn btn-primary">Buscar Importaciones</button>
    </div>
</form>
    
    <div class="mt-3">
    <a href="nuevaImportacion.jsp" class="btn btn-success">Nueva Importación</a>
     <a href="LisProvee.jsp" class="btn btn-secondary ms-2">← Regresar</a>
</div>


    <hr class="my-4">

    <!-- Resultados -->
    <%
        List<Importacion> lista = (List<Importacion>) request.getAttribute("listaImportaciones");
        if (lista != null) {
            if (lista.isEmpty()) {
    %>
        <div class="alert alert-warning">No se encontraron importaciones para la fecha seleccionada.</div>
    <%
            } else {
    %>
        <table class="table table-bordered table-hover table-striped mt-4">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Código</th>
                <th>Fecha Emisión</th>
                <th>Estimada Arribo</th>
                <th>Real Arribo</th>
                <th>Estado</th>
                <th>ID Proveedor</th>
                <th>Responsable</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Importacion imp : lista) {
            %>
            <tr>
                <td><%= imp.getId_importacion() %></td>
                <td><%= imp.getCodigo_importacion() %></td>
                <td><%= imp.getFecha_emision() %></td>
                <td><%= imp.getFecha_estimada_arribo() %></td>
                <td><%= imp.getFecha_real_arribo() %></td>
                <td><%= imp.getEstado() %></td>
                <td><%= imp.getId_proveedor() %></td>
                <td><%= imp.getResponsable() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    <%
            }
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
