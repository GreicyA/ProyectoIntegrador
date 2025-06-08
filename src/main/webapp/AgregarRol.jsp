<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Rol</title>
       
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
        <a href="#">Detalle Importación</a>
        <a href="#">Seguimiento de Plazos</a>
        <a href="#">Almacenes</a>
        <a href="#">Alertas</a>
        <a href="#">Historial de Cambios</a>
        <a href="#">Devoluciones</a>
        </div>
        <div class="main-content">
        <h2 class="text-cyan">Registro De Roles</h2>
        <form action="rol?action=add" method="post" id="id_form">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input class="form-control" type="text" id="nombre" name="nombre" 
                           placeholder="Ingrese nombre del Rol" required>
                </div>
               
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Agregar Rol</button>
                    <button type="button" class="btn btn-danger" 
                            onclick="window.location.href='rol'">Cancelar</button>
                </div>
            </form>
        </div>
        
        <script>
            // Validación adicional del lado del cliente
            document.getElementById('id_form').addEventListener('submit', function(e) {
                const correo = document.getElementById('correo').value;
                if (!correo.includes('@')) {
                    alert('Por favor ingrese un correo electrónico válido');
                    e.preventDefault();
                }
                
                const contrasena = document.getElementById('contrasena').value;
                if (contrasena.length < 6) {
                    alert('La contraseña debe tener al menos 6 caracteres');
                    e.preventDefault();
                }
            });
        </script>
    </body>
</html>
