<!-- #INCLUDE FILE="../db/dbconnection.inc" -->
<%
Dim errorMessage

' Verificar si se ha enviado el formulario
If Request.Form("submit") <> "" Then
    Dim conn, rs, sql, usuario, clave

    ' Obtener los valores del formulario
    usuario = Request.Form("username")
    clave = Request.Form("password")

    ' Crear una conexión a la base de datos usando la cadena de conexión global
    On Error Resume Next
    Set conn = GetConnection()
    If Err.Number <> 0 Then
        errorMessage = "Error al conectar a la base de datos: " & Err.Description
        Response.Write "<div class='alert alert-danger'>" & errorMessage & "</div>"
        Response.End
    End If
    On Error GoTo 0

    ' Definir la consulta SQL para verificar el usuario y la clave
    sql = "SELECT Id, Usuario, Perfil, Nombre FROM UsuariosIngresos WHERE Usuario = '" & usuario & "' AND Clave = '" & clave & "' AND Estado = 1"

    ' Crear y ejecutar el objeto Recordset
    On Error Resume Next
    Set rs = ExecuteQuery(conn, sql)
    If Err.Number <> 0 Then
        errorMessage = "Error al ejecutar la consulta SQL: " & Err.Description
        Response.Write "<div class='alert alert-danger'>" & errorMessage & "</div>"
        Response.End
    End If
    On Error GoTo 0

    ' Verificar si se encontró el usuario
    If Not rs.EOF Then
        ' Iniciar sesión y redirigir al home
        Session("UsuarioId") = rs("Id")
        Session("Usuario") = rs("Usuario")
        Session("Perfil") = rs("Perfil")
        Session("Nombre") = rs("Nombre")
        Response.Redirect "../app/pages/home.asp"
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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/libreries/bootstrap-4.5.3/css/bootstrap.css">
    <link rel="stylesheet" href="../assets/libreries/css/login.css">
    <link rel="icon" href="../assets/images/icons/app-favicon.ico" type="image/x-icon">
</head>
<body>
    <div class="container login-container">
        <div class="card login-card">
            <div class="card-body">
                <% If errorMessage <> "" Then %>
                    <div class="alert alert-danger mt-3"><%= errorMessage %></div>
                <% End If %>
                <form action="login.asp" method="post" id="login-form">
                    <!-- Contenedor para los fieldsets -->
                    <div class="form-container">
                        <fieldset class="text-center">
                            <img src="../assets/images/logos/logo-falck.png" alt="Logo" class="logo">
                        </fieldset>
                        <fieldset>
                            <legend>Datos de Ingreso</legend>
                            <div class="form-group row">
                                <label for="username" class="col-sm-4 col-form-label">Usuario:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-sm-4 col-form-label">Contraseña:</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <!-- Botones alineados a la derecha -->
                    <div class="btn-container text-center d-flex justify-content-end">
                        <input type="submit" class="btn btn-custom" name="submit" value="Ingresar">
                        <input type="button" class="btn btn-custom ml-2" value="Cancelar" onclick="document.getElementById('login-form').reset();">
                    </div>
                </form>                
            </div>
        </div>
    </div>

    <!-- Incluye jQuery, Popper.js y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="../assets/libreries/bootstrap-4.5.3/js/bootstrap.js"></script>
</body>
</html>
