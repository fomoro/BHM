<!--#include file="conexion.asp" -->

<%
' Definir la consulta SQL
Dim sql, rs
sql = "SELECT TOP 10 Id, Usuario, Clave, Perfil, Estado, Comentario, Nombre, Ips FROM UsuariosIngresos"

' Ejecutar la consulta
Set rs = conn.Execute(sql)

' Verificar si hay resultados
If Not rs.EOF Then
    ' Imprimir los resultados en una tabla HTML
    Response.Write "<table border='1'>"
    Response.Write "<tr>"
    Response.Write "<th>Id</th>"
    Response.Write "<th>Usuario</th>"
    Response.Write "<th>Clave</th>"
    Response.Write "<th>Perfil</th>"
    Response.Write "<th>Estado</th>"
    Response.Write "<th>Comentario</th>"
    Response.Write "<th>Nombre</th>"
    Response.Write "<th>Ips</th>"
    Response.Write "</tr>"

    ' Imprimir los registros
    Do Until rs.EOF
        Response.Write "<tr>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Id"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Usuario"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Clave"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Perfil"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Estado"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Comentario"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Nombre"))) & "</td>"
        Response.Write "<td>" & Server.HTMLEncode(CStr(rs("Ips"))) & "</td>"
        Response.Write "</tr>"
        rs.MoveNext
    Loop

    Response.Write "</table>"
Else
    Response.Write "No se encontraron registros."
End If

' Cerrar el Recordset y la conexión
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
