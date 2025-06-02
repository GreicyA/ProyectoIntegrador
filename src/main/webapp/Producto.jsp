<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    class Producto {
        int id;
        String nombre, descripcion, unidad, categoria;
        public Producto(int id, String nombre, String descripcion, String unidad, String categoria) {
            this.id = id;
            this.nombre = nombre;
            this.descripcion = descripcion;
            this.unidad = unidad;
            this.categoria = categoria;
        }
    }

    List<Producto> productos = new ArrayList<>();
    productos.add(new Producto(1, "Laptop Dell XPS", "Procesador i7, 16GB RAM, 512GB SSD", "Unidad", "Tecnología"));
    productos.add(new Producto(2, "Smartphone Samsung Galaxy S23", "Pantalla AMOLED, 128GB, 5G", "Unidad", "Tecnología"));
    productos.add(new Producto(3, "Tablet iPad Air", "10.9'' Liquid Retina, Chip M1", "Unidad", "Tecnología"));
    productos.add(new Producto(4, "Monitor LG UltraWide", "34 pulgadas, resolución QHD", "Unidad", "Tecnología"));
    productos.add(new Producto(5, "Teclado Mecánico Logitech", "Switches Red, retroiluminado RGB", "Unidad", "Tecnología"));
    
     // Simulación de búsqueda
    String codigoBuscar = request.getParameter("codigoBuscar");
    if (codigoBuscar != null && !codigoBuscar.trim().isEmpty()) {
        List<Producto> filtradas = new ArrayList<>();
        for (Producto pro : productos) {
            if (pro.nombre.toLowerCase().contains(codigoBuscar.trim().toLowerCase())) {
                filtradas.add(pro);
            }
        }
        productos = filtradas;
    }

%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Productos Tecnológicos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome para íconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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

        .header-importacion {
            margin-bottom: 20px;
        }

        .controls {
            display: flex;
            justify-content: space-between; /* Mantiene el espacio entre los elementos hijos */
            align-items: flex-start; /* Alinea los elementos verticalmente al inicio */
            margin-top: 10px; /* Un poco de espacio entre el título y los botones */
        }

        .left-controls {
            /* Contenedor para el botón de búsqueda, se alinea a la izquierda */
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

        .right-controls {
            /* Contenedor para el botón de nueva importación, se alinea a la derecha */
        }

        .new-importacion-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Estilos para la tabla */
        .importacion-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            overflow: hidden; /* Para que el borde redondeado funcione con la tabla */
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
            align-items: center; /* Para alinear verticalmente los iconos */
        }

        .importacion-table .action-icon {
            cursor: pointer;
            font-size: 16px;
            /* Aquí podrías usar iconos de fuentes como Font Awesome */
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
<div class="main-content">
    <div class="header-importacion">
            <h1>PRODUCTO</h1>
            <div class="controls">
                <div class="left-controls">
                    <form method="get" class="search-container">
                        <input type="text" name="codigoBuscar" class="search-input" placeholder="Ingrese nombre de producto" value="<%= codigoBuscar != null ? codigoBuscar : "" %>">
                        <button type="submit" class="search-button">Buscar</button>
                    </form>
                </div>
                <div class="right-controls">
                    <button class="new-importacion-button" onclick="nuevaImportacion()">Nuevo Producto</button>
                </div>
            </div>
        </div>
    <table class="importacion-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre del Producto</th>
            <th>Descripción</th>
            <th>Unidad de Medida</th>
            <th>Categoría</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Producto p : productos) {
        %>
        <tr>
            <td><%= p.id %></td>
            <td><%= p.nombre %></td>
            <td><%= p.descripcion %></td>
            <td><%= p.unidad %></td>
            <td><%= p.categoria %></td>
            <td class="acciones">
                <span title="Ver">🔍</span>
                <span title="Editar">✏️</span>
                <span title="Eliminar">🗑️</span>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
