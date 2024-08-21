<%
' Establecer la codificación de la respuesta
Response.CodePage = 65001
Response.Charset = "UTF-8"

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
</head>
<body>
    <h2>Bienvenido, <%= Server.HTMLEncode(Session("Usuario")) %></h2>
    <p><a href="home.asp">Ir a Home</a></p>
    <p><a href="logout.asp">Cerrar Sesión</a></p>
</body>
</html>
