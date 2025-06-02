<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Almacen</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            * {
                box-sizing: border-box;
            }

            .search-filter-row {
                display: flex;
                align-items: center; /* Alinea verticalmente los elementos al centro */
                margin-bottom: 30px;
                flex-wrap: wrap; /* Permite que los elementos se envuelvan en pantallas pequeñas */
                gap: 10px; /* Espacio entre elementos */
            }

            /* Ajustes para el input y el botón */
            .search-input-group {
                display: flex; /* Usa flexbox para el input y el botón */
                flex-grow: 0; /* Evita que el grupo de input crezca demasiado */
            }
            .search-input-group .form-control {
                width: 250px; /* Puedes ajustar este ancho fijo para la barra de búsqueda */
            }
            .search-input-group .btn {
                white-space: nowrap; /* Evita que el texto del botón se rompa */
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

            .estado-pendiente {
                color: #f0ad4e;
            }
            .estado-transito {
                color: #5bc0de;
            }
            .estado-recibido {
                color: #5cb85c;
            }

            footer {
                margin-top: 40px;
                text-align: center;
                font-size: 14px;
                color: #888;
            }

            .table-responsive {
                border: 1px solid #dee2e6; /* Borde general para enmarcar la tabla */
                border-radius: 8px; /* Bordes redondeados para la tabla */
                overflow-x: auto; /* Permite desplazamiento horizontal en pantallas pequeñas */
                margin-top: 20px; /* Espacio superior */
                box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Sombra suave para el enmarcado */
            }

            .table-header span {
                /* flex: 1;  <-- Asegúrate de que esta línea esté comentada o eliminada */
                /* text-align: center; <-- Comentamos o eliminamos esta línea general */
                padding: 0 10px; /* Mantenemos el padding horizontal para separación */
            }

            .table-header span:nth-child(1) { /* NOMBRE DEL PRODUCTO */
                flex: 4;
                text-align: center; /* ¡CAMBIO CLAVE: Alinear al centro! */
            }
            .table-header span:nth-child(2) { /* CÓDIGO */
                flex: 2;
                text-align: center; /* ¡CAMBIO CLAVE: Alinear al centro! */
            }
            .table-header span:nth-child(3) { /* CANTIDAD */
                flex: 1.5;
                text-align: center; /* ¡CAMBIO CLAVE: Alinear al centro! */
            }
            .table-header span:nth-child(4) { /* PRECIO */
                flex: 2;
                text-align: center; /* ¡CAMBIO CLAVE: Alinear al centro! */
            }

            .table-row span {
                /* flex: 1;  <-- Asegúrate de que esta línea esté comentada o eliminada */
                text-align: center; /* Si quieres que los datos de las filas también estén centrados */
                padding: 0 10px;
            }

            .table-row span:nth-child(1) { /* Dato de NOMBRE DEL PRODUCTO */
                flex: 4;
                text-align: left; /* Mantener la alineación a la izquierda para el nombre del producto en las filas */
            }
            .table-row span:nth-child(2) { /* Dato de CÓDIGO */
                flex: 2;
                text-align: center;
            }
            .table-row span:nth-child(3) { /* Dato de CANTIDAD */
                flex: 1.5;
                text-align: center;
            }
            .table-row span:nth-child(4) { /* Dato de PRECIO */
                flex: 2;
                text-align: right; /* Mantener la alineación a la derecha para el precio en las filas */
            }
        </style>
    </head>
    <body>
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
        <div class="main-content">
            <h2>ALMACEN</h2>

            <div class="search-filter-row">
                <div class="search-input-group">
                    <input type="text" class="form-control" placeholder="Buscar producto...">
                    <button type="button" class="btn btn-primary d-flex align-items-center ms-2">
                        BUSCAR <i class="fas fa-search ms-2"></i> </button>
                </div>

                <div class="ms-auto"> <select class="form-select w-auto">
                        <option selected>Categoría</option>
                        <option value="1">Electrónica</option>
                        <option value="2">Ropa</option>
                        <option value="3">Hogar</option>
                    </select>
                </div>
            </div>
            
            <div class="table-responsive">
                <div class="table-header">
                    <span>NOMBRE DEL PRODUCTO</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <span>CÓDIGO</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;   
                    <span>CANTIDAD</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <span>PRECIO</span>
                </div>
            </div>
            
            <br><br>
            <nav class="pagination-container" aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            </nav>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
