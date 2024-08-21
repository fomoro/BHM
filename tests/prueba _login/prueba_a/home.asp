<%
' Establecer la codificación de la respuesta
Response.CodePage = 65001
Response.Charset = "UTF-8"

' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "login.asp"
End If

' Crear una conexión a la base de datos usando la cadena de conexión global
Dim conn, rs, sql

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("ConexionDB")

' Definir la consulta SQL
sql = "SELECT DISTINCT Dsc_Cliente FROM Clientes ORDER BY Dsc_Cliente ASC"

' Crear y ejecutar el objeto Recordset
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open sql, conn

' Verificar si se obtuvieron resultados
If Not rs.EOF Then
    ' Mostrar los resultados
    Response.Write("<h2>Listado de Clientes</h2>")
    Response.Write("<table border='1'>")
    Response.Write("<tr><th>Cliente</th></tr>")
    
    Do While Not rs.EOF
        Response.Write("<tr>")
        Response.Write("<td>" & Server.HTMLEncode(rs("Dsc_Cliente")) & "</td>")
        Response.Write("</tr>")
        rs.MoveNext
    Loop
    
    Response.Write("</table>")
Else
    Response.Write("No se encontraron clientes.")
End If

' Cerrar el Recordset y la conexión
rs.Close
conn.Close

Set rs = Nothing
Set conn = Nothing
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
    <h2>Bienvenido, <%= Server.HTMLEncode(Session("Usuario")) %></h2>
    <p><a href="default.asp">Volver a Default</a></p>
    <p><a href="logout.asp">Cerrar Sesión</a></p>
</body>
</html>
