<%
' Crear una conexión a la base de datos usando la cadena de conexión global
Dim conn, rs, sql

' Obtener la cadena de conexión desde el objeto Application
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("ConexionDB")

' Definir la consulta SQL
sql = "SELECT TOP 10 Id, Usuario, Clave, Perfil, Estado, Comentario, Nombre, Ips FROM UsuariosIngresos"

' Crear y ejecutar el objeto Recordset
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open sql, conn

' Verificar si se obtuvieron resultados
If Not rs.EOF Then
    ' Mostrar los resultados
    Response.Write("<h2>Listado de Empleados</h2>")
    Response.Write("<table border='1'>")
    Response.Write("<tr><th>ID</th><th>Usuario</th><th>Clave</th></tr>")
    
    Do While Not rs.EOF
        Response.Write("<tr>")
        Response.Write("<td>" & rs("Id") & "</td>")
        Response.Write("<td>" & rs("Usuario") & "</td>")
        Response.Write("<td>" & rs("Clave") & "</td>")
        Response.Write("</tr>")
        rs.MoveNext
    Loop
    
    Response.Write("</table>")
Else
    Response.Write("No se encontraron empleados.")
End If

' Cerrar el Recordset y la conexión
rs.Close
conn.Close

Set rs = Nothing
Set conn = Nothing
%>
