<!-- #INCLUDE FILE="dbconnection.inc" -->

<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "login.asp"
End If

' Crear una conexión a la base de datos usando la cadena de conexión global
Dim conn, rs, sql

' Crear una conexión a la base de datos usando la cadena de conexión global
Set conn = GetConnection()

' Definir la consulta SQL
sql = "SELECT DISTINCT TOP 3 Dsc_Cliente FROM Clientes ORDER BY Dsc_Cliente ASC"

' Crear y ejecutar el objeto Recordset
Set rs = ExecuteQuery(conn, sql)

' Verificar si se obtuvieron resultados
Dim clientes
clientes = ""
If Not rs.EOF Then
    ' Construir los resultados en una tabla HTML
    clientes = "<div class='mb-4'><h3>Listado de Clientes</h2></div>"
    clientes = clientes & "<table class='table table-striped'>"
    clientes = clientes & "<thead><tr><th>Cliente</th></tr></thead>"
    clientes = clientes & "<tbody>"
    
    Do While Not rs.EOF
        clientes = clientes & "<tr>"
        clientes = clientes & "<td>" & Server.HTMLEncode(rs("Dsc_Cliente")) & "</td>"
        clientes = clientes & "</tr>"
        rs.MoveNext
    Loop
    
    clientes = clientes & "</tbody>"
    clientes = clientes & "</table>"
Else
    clientes = "<div class='alert alert-warning'>No se encontraron clientes.</div>"
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
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">Bienvenido, <%= Server.HTMLEncode(Session("Usuario")) %></h2>
                <p class="card-text">
                    <a href="default.asp" class="btn btn-primary">Volver a Default</a>
                    <a href="logout.asp" class="btn btn-danger">Cerrar Sesión</a>
                </p>
            </div>
        </div>

        <br>
        <%= clientes %>
        

        
        
        
    </div>

    <!-- Incluye Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
