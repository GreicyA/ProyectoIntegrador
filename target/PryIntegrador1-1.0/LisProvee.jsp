<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Proveedor"%>
<%@page import="controller.ProveeControl"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Proveedores</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
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
        
        .main-content-shifted {
            margin-left: 240px;
            padding: 20px;
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

        .main-content {
            margin-left: 220px;
            padding: 20px;
            flex-grow: 1;
        }

        .header-importacion {
            margin-bottom: 20px;
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-top: 10px;
        }

        .search-container {
            display: flex;
            align-items: center;
        }

        .search-input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
        }

        .search-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            margin-left: -5px;
        }

        .new-importacion-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .importacion-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            overflow: hidden;
        }

        .importacion-table th, .importacion-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .importacion-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .importacion-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .importacion-table .actions {
            display: flex;
            gap: 10px;
            justify-content: center;
            align-items: center;
        }

        .importacion-table .action-icon {
            cursor: pointer;
            font-size: 16px;
        }
        </style>
    </head>
    <body>
        <div class="sidebar">
        <h2>MENU</h2>
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
    <div class="main-content-shifted">
        <%
            ProveeControl obj = new ProveeControl();
            List<Proveedor> lista = obj.LisProvee();
        %>
        <h2 class="text-cyan">Lista de Proveedores</h2>
        <a href="AddProvee.jsp" class="btn btn-default">Agregar Proveedor</a>
        <a href="buscarImportaciones.jsp" class="btn btn-default">Generar Reporte</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-black">
                    <th>Codigo<th>Nombre Empresa<th>Contacto<th>Correo<th>Telefono<th>Direccion<th>Pais Origen
            </thead>
            <% 
                for(Proveedor x:lista){
                out.print("<tr><td>"+x.getId_proveedor()+"<td>"+x.getNombre_empresa()+"<td>"+x.getContacto()+"<td>"+x.getCorreo()+"<td>"+x.getTelefono()+"<td>"+x.getDireccion()+"<td>"+x.getPais_origen());
                }
            %> 
        </table>
    </div>
    </body>
   <div style="position: absolute; top: 20px; right: 20px;">
    <a href="Login.jsp" class="btn btn-danger">Cerrar Sesión</a>
</div>
</html>
