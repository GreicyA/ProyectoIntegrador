<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .login-box {
            width: 350px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <% 
        String fallo = "";
        if (request.getAttribute("fallo")!=null){
            fallo=(String)request.getAttribute("fallo");
        }
    %>
    <div class="login-box">
        <h2>Iniciar Sesión</h2>
        <form action="LoginServlet" >
            <input type="hidden" name="opc" value="1">
            <label>Correo:</label>
            <input type="text" name="usuario" required>

           

            <label>Contraseña:</label>
            <input type="password" name="clave" required>

            <button type="submit">Ingresar</button>

          
            <p class="error"> <%= fallo %></p>
          
        </form>
    </div>
</body>
</html>
