<!-- #INCLUDE FILE="../../../db/dbconnection.inc" -->
<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "../../../auth/login.asp"
End If

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
    clientes = "<div class='mb-4'><h3>Listado de Clientes</h3></div>"
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

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Bienvenido, <%= Server.HTMLEncode(Session("Usuario")) %></h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <%= clientes %>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
