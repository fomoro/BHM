<%
' Incluir el archivo dbconnection.inc para usar la función GetDBConnection

' Cerrar la sesión
Session.Abandon
Response.Redirect "login.asp"
%>
