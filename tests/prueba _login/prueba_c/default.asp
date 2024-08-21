<%
' Incluir el archivo dbconnection.inc para usar la función GetDBConnection

' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "login.asp"
End If
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Default</title>
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">Bienvenido, <%= Server.HTMLEncode(Session("Usuario")) %></h2>
                <p class="card-text">
                    <a href="home.asp" class="btn btn-primary">Ir a Home</a>
                    <a href="logout.asp" class="btn btn-danger">Cerrar Sesión</a>
                </p>
            </div>
        </div>
    </div>

    <!-- Incluye Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
