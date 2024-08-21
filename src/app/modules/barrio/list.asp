<!-- #INCLUDE FILE="../../../db/dbconnection.inc" -->
<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "../../../auth/login.asp"
End If

' Crear una conexión a la base de datos usando la cadena de conexión global
Set conn = GetConnection()

' Definir la consulta SQL para listar los 10 primeros barrios
sql = "SELECT TOP 10 Csc_Barrio, Dsc_Barrio, Upz_Csc FROM Barrio ORDER BY Csc_Barrio ASC"

' Crear y ejecutar el objeto Recordset
Set rs = ExecuteQuery(conn, sql)

' Verificar si se obtuvieron resultados
Dim barrios
barrios = ""
If Not rs.EOF Then
    ' Construir los resultados en una tabla HTML
    barrios = "<div class='mb-4'><h3>Listado de Barrios</h3></div>"
    barrios = barrios & "<table class='table table-striped'>"
    barrios = barrios & "<thead><tr><th>Código</th><th>Nombre</th><th>UPZ</th></tr></thead>"
    barrios = barrios & "<tbody>"
    
    Do While Not rs.EOF
        barrios = barrios & "<tr>"
        barrios = barrios & "<td>" & Server.HTMLEncode(rs("Csc_Barrio")) & "</td>"
        barrios = barrios & "<td>" & Server.HTMLEncode(rs("Dsc_Barrio")) & "</td>"
        barrios = barrios & "<td>" & Server.HTMLEncode(rs("Upz_Csc")) & "</td>"
        barrios = barrios & "</tr>"
        rs.MoveNext
    Loop
    
    barrios = barrios & "</tbody>"
    barrios = barrios & "</table>"
Else
    barrios = "<div class='alert alert-warning'>No se encontraron barrios.</div>"
End If

' Cerrar el Recordset y la conexión
rs.Close
conn.Close

Set rs = Nothing
Set conn = Nothing
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Barrios</title>
    <!-- Incluye AdminLTE CSS -->
    <link rel="stylesheet" href="/src/assets/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="/src/assets/vendor/adminlte-3.2.0/css/adminlte.min.css">
    <link rel="icon" href="/src/assets/images/icons/app-favicon.ico" type="image/x-icon">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Incluir el header -->
    <!--#include file="../../includes/html/header.asp" -->

    <!-- Incluir el navbar -->
    <!--#include file="../../includes/html/navbar.asp" -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Listado de Barrios</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%= barrios %>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Incluir el footer -->
    <!--#include file="../../includes/html/footer.asp" -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Incluye jQuery, Popper.js, Bootstrap JS y AdminLTE JS -->
<script src="/src/assets/plugins/jquery/jquery.min.js"></script>
<script src="/src/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/src/assets/vendor/adminlte-3.2.0/js/adminlte.min.js"></script>
</body>
</html>
