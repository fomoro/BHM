<!-- #INCLUDE FILE="../../db/dbconnection.inc" -->
<%
' Redirigir al login si no hay una sesión activa
If Session("UsuarioId") = "" Then
    Response.Redirect "../../auth/login.asp"
End If

' Obtener el valor de la variable de consulta "view"
Dim view
view = Request.QueryString("view")
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Incluye AdminLTE CSS -->
    <link rel="stylesheet" href="../../assets/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../assets/vendor/adminlte-3.2.0/css/adminlte.min.css">
    <link rel="icon" href="../../assets/images/icons/app-favicon.ico" type="image/x-icon">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Incluir el header -->
    <!--#include file="../includes/html/header.asp" -->

    <!-- Incluir el navbar -->
    <!--#include file="../includes/html/navbar.asp" -->

    <!-- Incluir el contenido dinámico -->
    <%
    If view = "barrio" Then
        %><!--#include file="../modules/barrio/list.asp" --><%
    ElseIf view = "disponibilidad" Then
        %><!--#include file="../modules/operador/disponibilidad.asp" --><%
    ElseIf view = "regionales" Then
        %><!--#include file="../modules/operador/regionales.asp" --><%
    Else
        %><!--#include file="../modules/home/index.asp" --><%
    End If
    %>

    <!-- Incluir el footer -->
    <!--#include file="../includes/html/footer.asp" -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Incluye jQuery, Popper.js, Bootstrap JS y AdminLTE JS -->
<script src="../../assets/plugins/jquery/jquery.min.js"></script>
<script src="../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/vendor/adminlte-3.2.0/js/adminlte.min.js"></script>
</body>
</html>
