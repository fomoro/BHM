<!-- #INCLUDE FILE="dbconnection.inc" -->
<%
Dim errorMessage

' Verificar si se ha enviado el formulario
If Request.Form("submit") <> "" Then
    Dim conn, rs, sql, usuario, clave

    ' Obtener los valores del formulario
    usuario = Request.Form("usuario")
    clave = Request.Form("clave")

    ' Crear una conexión a la base de datos usando la cadena de conexión global
    Set conn = GetConnection()

    ' Definir la consulta SQL para verificar el usuario y la clave
    sql = "SELECT Id, Usuario, Perfil, Nombre FROM UsuariosIngresos WHERE Usuario = '" & usuario & "' AND Clave = '" & clave & "' AND Estado = 1"

    ' Crear y ejecutar el objeto Recordset
    Set rs = ExecuteQuery(conn, sql)

    ' Verificar si se encontró el usuario
    If Not rs.EOF Then
        ' Iniciar sesión y redirigir al home
        Session("UsuarioId") = rs("Id")
        Session("Usuario") = rs("Usuario")
        Session("Perfil") = rs("Perfil")
        Session("Nombre") = rs("Nombre")
        Response.Redirect "home.asp"
    Else
        ' Establecer mensaje de error
        errorMessage = "Usuario o clave incorrectos."
    End If

    ' Cerrar el Recordset y la conexión
    rs.Close
    conn.Close

    Set rs = Nothing
    Set conn = Nothing
End If
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4">
            <h2 class="text-center">Login</h2>
            <% If errorMessage <> "" Then %>
                <div class="alert alert-danger" role="alert">
                    <%= errorMessage %>
                </div>
            <% End If %>
            <form method="post" action="login.asp">
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="form-group">
                    <label for="clave">Clave:</label>
                    <input type="password" class="form-control" id="clave" name="clave" required>                 
                </div>
                <input type="submit" name="submit" value="Login" class="btn btn-primary btn-block">
            </form>
        </div>
    </div>

    <!-- Incluye Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
