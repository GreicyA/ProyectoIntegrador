<%-- 
    Document   : principal
    Created on : 14 may. 2025, 15:12:19
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Sistema de Control de Plazos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<body>

  <!-- Menú lateral -->
  <div class="sidebar">
      <h2>Menú</h2>
      <a href="principal.jsp">Principal</a>
            <a href="rol">Roles</a>
            <a href="empleado">Empleados</a>
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

  <!-- Contenido principal -->
  <div class="main-content" id="principal">
    <h1>Dashboard - Sistema de Control de Plazos</h1>

<div class="container">

  <!-- Estado de Importaciones -->
  <div class="card1">
    <h3>Importaciones Activas</h3>
    <p class="status estado-pendiente">Pendientes: <strong>4</strong></p>
    <p class="status estado-transito">En tránsito: <strong>3</strong></p>
    <p class="status estado-recibido">Recibidas: <strong>7</strong></p>
  </div>

  <!-- Alertas recientes -->
  <div class="card1">
    <h3>Alertas Recientes</h3>
    <p class="alerta">📌 Retraso en IMP-00234</p>
    <p class="alerta">⏰ Vencimiento próximo en IMP-00238</p>
    <p>✔ Confirmación de recepción: IMP-00230</p>
  </div>

  <!-- Seguimientos -->
  <div class="card1">
    <h3>Seguimiento de Plazos</h3>
    <p>En Proceso: <strong>5</strong></p>
    <p>Completos: <strong>6</strong></p>
    <p class="alerta">Retrasados: <strong>2</strong></p>
  </div>

  <!-- Devoluciones -->
  <div class="card1">
    <h3>Devoluciones</h3>
    <p>Pendientes de envío: <strong>1</strong></p>
    <p>Enviadas: <strong>2</strong></p>
    <p>Confirmadas: <strong>1</strong></p>
  </div>

</div>
<!-- Tabla de Importaciones -->
<div class="card" id="tabla-importaciones">
  <h3>Importaciones recientes</h3>
  <table style="width: 100%; border-collapse: collapse;">
    <thead style="background-color: #003366; color: white;">
      <tr>
        <th style="padding: 10px; border: 1px solid #ccc;">Proveedor</th>
        <th style="padding: 10px; border: 1px solid #ccc;">Producto</th>
        <th style="padding: 10px; border: 1px solid #ccc;">Estado</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="padding: 10px; border: 1px solid #ccc;">GlobalTrade Inc.</td>
        <td style="padding: 10px; border: 1px solid #ccc;">Café Premium</td>
        <td style="padding: 10px; border: 1px solid #ccc;" class="estado-pendiente">Pendiente</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ccc;">Oceanic Suppliers</td>
        <td style="padding: 10px; border: 1px solid #ccc;">Cacao Orgánico</td>
        <td style="padding: 10px; border: 1px solid #ccc;" class="estado-transito">En tránsito</td>
      </tr>
      <tr>
        <td style="padding: 10px; border: 1px solid #ccc;">Importadora Andes</td>
        <td style="padding: 10px; border: 1px solid #ccc;">Maíz Amarillo</td>
        <td style="padding: 10px; border: 1px solid #ccc;" class="estado-recibido">Recibido</td>
      </tr>
    </tbody>
  </table>
</div>

<footer>
  &copy; 2025 Sistema de Gestión Logística - Importadora SAC
</footer>
</div>
</body>
</html>
