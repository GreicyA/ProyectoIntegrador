<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Empleado" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Empleados</title>
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
        .btn_crear {
    display: inline-block;
    background-color: #007bff; /* Azul */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 25px; /* Esquinas ovaladas */
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.btn_crear:hover {
    background-color: #0056b3; /* Azul más oscuro al pasar el mouse */
}
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>MENU</h2>
        <a href="#">Roles</a>
        <a href="#">Empleados</a>
        <a href="#">Proveedores</a>
        <a href="#">Tipo de Seguimiento</a>
        <a href="#">Productos</a>
        <a href="#" class="active">Importaciones</a>
        <a href="#">Detalle Importación</a>
        <a href="#">Seguimiento de Plazos</a>
        <a href="#">Almacenes</a>
        <a href="#">Alertas</a>
        <a href="#">Historial de Cambios</a>
        <a href="#">Devoluciones</a>
    </div>
    <div class="main-content">
        <div class="header-importacion">
    <h2>Lista de Empleados</h2>
    <a href="AgregarEmpleado.jsp" class="btn_crear">Crear Usuario</a>
    <table class="importacion-table">
        <tr>
            <th>ID</th><th>Nombre</th><th>Apellido</th><th>Correo</th><th>Estado</th><th>Rol</th><th>Acciones</th>
        </tr>
        <%
    List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
    if (empleados != null) {
        for (Empleado e : empleados) {
%>
        <tr>
            <td><%= e.getId_empleado() %></td>
            <td><%= e.getNombre() %></td>
            <td><%= e.getApellido() %></td>
            <td><%= e.getCorreo() %></td>
            <td><%= e.isEstado() ? "Activo" : "Inactivo" %></td>
            <td><%= e.getRol().getNombre_rol() %></td>
           
        <td>
                    <a href="empleado?action=edit&id=<%= e.getId_empleado() %>"><img src="img/icono_editar.png" alt="Modificar" width="20" height="20"/></a>
                    <a href="empleado?action=delete&id=<%= e.getId_empleado() %>" onclick="return confirm('¿Estás seguro de que deseas eliminar a <%= e.getNombre() %> <%= e.getApellido() %>?')"><img src="img/icono_eliminar.png" alt="Eliminar" width="20" height="20"/></a>
                </td>    
        </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="3">No hay empleados disponibles.</td>
        </tr>
<%
    }
%>
    </table>
    </div>
</body>
</html>
