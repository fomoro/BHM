<!-- #INCLUDE FILE="../../../db/dbconnection.inc" -->
<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "../../../auth/login.asp"
End If

' Crear una conexión a la base de datos usando la cadena de conexión global
Dim conn, rs, sql

' Crear una conexión a la base de datos usando la cadena de conexión global
Set conn = GetConnection()

' Definir la consulta SQL
sql = "SELECT * FROM PlanillaElectronica ORDER BY Fecha DESC"

' Crear y ejecutar el objeto Recordset
Set rs = ExecuteQuery(conn, sql)

' Verificar si se obtuvieron resultados
Dim planilla
planilla = ""
If Not rs.EOF Then
    ' Construir los resultados en una tabla HTML
    planilla = "<div class='mb-4'><h3>Listado de Planilla Electrónica</h3></div>"
    planilla = planilla & "<table class='table table-striped'>"
    planilla = planilla & "<thead><tr><th>Fecha</th><th>Detalle</th></tr></thead>"
    planilla = planilla & "<tbody>"
    
    Do While Not rs.EOF
        planilla = planilla & "<tr>"
        planilla = planilla & "<td>" & Server.HTMLEncode(rs("Fecha")) & "</td>"
        planilla = planilla & "<td>" & Server.HTMLEncode(rs("Detalle")) & "</td>"
        planilla = planilla & "</tr>"
        rs.MoveNext
    Loop
    
    planilla = planilla & "</tbody>"
    planilla = planilla & "</table>"
Else
    planilla = "<div class='alert alert-warning'>No se encontraron registros de planilla electrónica.</div>"
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
    <title>Planilla Electrónica</title>
    <!-- Incluye AdminLTE CSS -->
    <link rel="stylesheet" href="../../../assets/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../../assets/vendor/adminlte-3.2.0/css/adminlte.min.css">
    <link rel="icon" href="../../../assets/images/icons/app-favicon.ico" type="image/x-icon">
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
                        <h1 class="m-0">Planilla Electrónica</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%= planilla %>
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
<script src="../../../assets/plugins/jquery/jquery.min.js"></script>
<script src="../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../assets/vendor/adminlte-3.2.0/js/adminlte.min.js"></script>
</body>
</html>
