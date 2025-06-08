<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Rol" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.RolControl" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Empleado</title>
    <style>
        /* Estilos similares a los de AgregarEmpleado.jsp */
        .form-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #45a049;
        }
        .radio-group {
            display: flex;
            gap: 15px;
        }
        .radio-option {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <h1>Modificar Rol</h1>
        <form action="rol" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${rol.id_rol}">
            
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="${rol.nombre_rol}" required>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Guardar Cambios" class="btn-submit">
            </div>
        </form>
    </div>
</body>
</html>