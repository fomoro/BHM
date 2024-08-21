<%
' Establecer la codificación de la respuesta
Response.CodePage = 65001
Response.Charset = "UTF-8"

' Cerrar la sesión
Session.Abandon
Response.Redirect "login.asp"
%>
