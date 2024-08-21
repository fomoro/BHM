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
        <!-- Incluye AdminLTE CSS -->
        <link rel="stylesheet" href="../assets/vendor/adminlte-3.2.0/css/adminlte.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome-free/css/all.min.css">
        <link rel="icon" href="../assets/images/icons/app-favicon.ico" type="image/x-icon">
        <style>
            .login-logo img {
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>

    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <img src="../assets/images/logos/logo-falck.png" alt="Logo Falck" class="logo">
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Datos de Ingreso</p>
                    <% If errorMessage <> "" Then %>
                        <div class="alert alert-danger mt-3"><%= errorMessage %></div>
                    <% End If %>
                    <form action="login.asp" method="post" id="login-form">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Usuario" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                            </div>
                            <div class="col-4">
                                <input type="submit" class="btn btn-primary btn-block" name="submit" value="Ingresar">
                                
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->
        
        <!-- Incluye jQuery, Popper.js, Bootstrap JS y AdminLTE JS -->
        <script src="../assets/plugins/jquery/jquery.min.js"></script>
        <script src="../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/adminlte-3.2.0/js/adminlte.min.js"></script>
    </body>
</html>
