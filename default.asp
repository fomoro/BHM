<%
' Incluir el archivo dbconnection.inc para usar la función GetDBConnection
<!-- #INCLUDE FILE="src/db/dbconnection.inc" -->

' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "src/auth/login.asp"
Else
    Response.Redirect "src/app/pages/home.asp"
End If
%>
