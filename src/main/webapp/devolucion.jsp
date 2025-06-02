<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Devoluciones</title>
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
            
            .devolucion-form-section {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                max-width: 800px; /* Ancho máximo del formulario */
                margin: 20px auto; /* Centra el formulario en la página */
            }

            .devolucion-form-section h3 {
                color: #003366;
                margin-bottom: 25px;
                border-bottom: 1px solid #eee;
                padding-bottom: 10px;
            }

            .form-group {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                flex-wrap: wrap; /* Permite que los elementos se envuelvan en pantallas pequeñas */
            }

            .form-group label {
                font-weight: bold;
                margin-right: 15px;
                flex-basis: 180px; /* Ancho fijo para las etiquetas */
                text-align: right;
            }

            .form-group .form-control,
            .form-group .form-control-date {
                flex-grow: 1; /* Permite que los inputs crezcan */
                max-width: calc(100% - 200px); /* Ajusta el ancho para dejar espacio a la etiqueta */
            }

            .form-group .form-control-date {
                display: flex;
                align-items: center;
            }
            .form-group .form-control-date input {
                flex-grow: 1;
            }
            .form-group .form-control-date .input-group-text {
                 background-color: #e9ecef;
                 border-left: 0;
            }

            /* Ajustes para las áreas de texto (Motivo y Detalle Adicional) */
            .textarea-group {
                display: flex;
                justify-content: space-between;
                gap: 20px; /* Espacio entre las dos textareas */
                margin-top: 30px;
            }

            .textarea-group > div {
                flex: 1; /* Para que cada textarea ocupe la mitad del espacio */
            }

            .textarea-group label {
                display: block; /* Para que la etiqueta esté encima del textarea */
                text-align: left;
                margin-bottom: 10px;
                font-weight: bold;
                flex-basis: auto; /* Anula el flex-basis del form-group */
            }

            .textarea-group textarea {
                width: 100%;
                min-height: 120px; /* Altura mínima para las áreas de texto */
                resize: vertical; /* Permite redimensionar solo verticalmente */
            }

            /* Botones de acción */
            .form-actions {
                display: flex;
                justify-content: flex-end; /* Alinea los botones a la derecha */
                gap: 15px;
                margin-top: 40px;
                padding-top: 20px;
                border-top: 1px solid #eee;
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
            <h2>DEVOLUCIÓN</h2>

            <div class="devolucion-form-section">
                <h3>Información del Pedido:</h3>
                <div class="form-group">
                    <label for="numeroPedido">Número de pedido:</label>
                    <input type="text" class="form-control" id="numeroPedido" name="numeroPedido">
                </div>
                <div class="form-group">
                    <label for="fechaCompra">Fecha de compra:</label>
                    <div class="input-group form-control-date">
                        <input type="date" class="form-control" id="fechaCompra" name="fechaCompra">
                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                    </div>
                </div>

                <h3>Información del Producto a Devolver:</h3>
                <div class="form-group">
                    <label for="nombreProducto">Nombre del producto:</label>
                    <input type="text" class="form-control" id="nombreProducto" name="nombreProducto">
                </div>
                <div class="form-group">
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" class="form-control" id="cantidad" name="cantidad" min="1">
                </div>
                <div class="form-group">
                    <label for="codigoReferencia">Código de referencia (SKU):</label>
                    <input type="text" class="form-control" id="codigoReferencia" name="codigoReferencia">
                </div>

                <div class="textarea-group">
                    <div>
                        <label for="motivoDevolucion">Motivo de devolución:</label>
                        <textarea class="form-control" id="motivoDevolucion" name="motivoDevolucion"></textarea>
                    </div>
                    <div>
                        <label for="detalleAdicional">Detalle Adicional:</label>
                        <textarea class="form-control" id="detalleAdicional" name="detalleAdicional"></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Aceptar</button>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
