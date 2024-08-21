<%
Dim conn

' Configuración de la respuesta
Response.addHeader "pragma", "no-cache"
Response.CacheControl = "Private"
Response.Expires = 0
Response.Charset = "ISO-8859-1"

' Crear el objeto de conexión
Set conn = Server.CreateObject("ADODB.Connection")

' Configurar el modo y el tiempo de espera de la conexión
conn.Mode = 3
conn.ConnectionTimeOut = 0

' Intentar abrir la conexión
On Error Resume Next
conn.Open "Provider=SQLOLEDB; Data Source=172.174.16.59; Initial Catalog=BHMTC; User ID=sa; Password=eb2022$$"
If Err.Number <> 0 Then
    Response.Write "Error al conectar a la base de datos: " & Err.Description
    Response.End
End If
On Error GoTo 0
%>
