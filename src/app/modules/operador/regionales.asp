<!-- #INCLUDE FILE="../../../db/dbconnection.inc" -->
<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "../../../auth/login.asp"
End If

' Crear una conexión a la base de datos usando la cadena de conexión global
Set conn = GetConnection()

' Definir la consulta SQL para listar los 5 primeros registros de Regionales
sql = "SELECT TOP 5 Csc_Regional, Dsc_Regional, Cliente_Csc FROM Regionales ORDER BY Csc_Regional ASC"

' Crear y ejecutar el objeto Recordset
Set rs = ExecuteQuery(conn, sql)

' Verificar si se obtuvieron resultados
Dim regionales
regionales = ""
If Not rs.EOF Then
    ' Construir los resultados en una tabla HTML
    regionales = "<div class='mb-4'><h3>Listado de Regionales</h3></div>"
    regionales = regionales & "<table class='table table-striped'>"
    regionales = regionales & "<thead><tr><th>Código</th><th>Nombre</th><th>Cliente</th></tr></thead>"
    regionales = regionales & "<tbody>"
    
    Do While Not rs.EOF
        regionales = regionales & "<tr>"
        regionales = regionales & "<td>" & Server.HTMLEncode(rs("Csc_Regional")) & "</td>"
        regionales = regionales & "<td>" & Server.HTMLEncode(rs("Dsc_Regional")) & "</td>"
        regionales = regionales & "<td>" & Server.HTMLEncode(rs("Cliente_Csc")) & "</td>"
        regionales = regionales & "</tr>"
        rs.MoveNext
    Loop
    
    regionales = regionales & "</tbody>"
    regionales = regionales & "</table>"
Else
    regionales = "<div class='alert alert-warning'>No se encontraron regionales.</div>"
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
    <title>Listado de Regionales</title>
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
                        <h1 class="m-0">Listado de Regionales</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%= regionales %>
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
