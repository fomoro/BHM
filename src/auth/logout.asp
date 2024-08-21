<%
' Incluir el archivo dbconnection.inc para usar la función GetDBConnection
<!-- #INCLUDE FILE="../db/dbconnection.inc" -->

' Cerrar la sesión
Session.Abandon
Response.Redirect "login.asp"
%>
