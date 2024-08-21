<%
' Establecer la codificación de la respuesta
Response.CodePage = 65001
Response.Charset = "UTF-8"

' Verificar si se ha enviado el formulario
If Request.Form("submit") <> "" Then
    Dim conn, rs, sql, usuario, clave

    ' Obtener los valores del formulario
    usuario = Request.Form("usuario")
    clave = Request.Form("clave")

    ' Crear una conexión a la base de datos usando la cadena de conexión global
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open Application("ConexionDB")

    ' Definir la consulta SQL para verificar el usuario y la clave
    sql = "SELECT Id, Usuario, Perfil FROM UsuariosIngresos WHERE Usuario = '" & usuario & "' AND Clave = '" & clave & "' AND Estado = 1"

    ' Crear y ejecutar el objeto Recordset
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn

    ' Verificar si se encontró el usuario
    If Not rs.EOF Then
        ' Iniciar sesión y redirigir al home
        Session("UsuarioId") = rs("Id")
        Session("Usuario") = rs("Usuario")
        Session("Perfil") = rs("Perfil")
        Response.Redirect "home.asp"
    Else
        ' Mostrar mensaje de error
        Response.Write("Usuario o clave incorrectos.")
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
</head>
<body>
    <h2>Login</h2>
    <form method="post" action="login.asp">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required><br>
        <label for="clave">Clave:</label>
        <input type="password" id="clave" name="clave" required><br>
        <input type="submit" name="submit" value="Login">
    </form>
</body>
</html>
