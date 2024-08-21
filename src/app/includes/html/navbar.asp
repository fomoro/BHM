<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/src/app/pages/home.asp" class="brand-link">
        <img src="/src/assets/images/icons/app-favicon.ico" alt="Falck Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">FalckSL</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="/src/assets/vendor/adminlte-3.2.0/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><%= Server.HTMLEncode(Session("Nombre")) %></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="/src/app/pages/home.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/pages/home.asp") > 0 Then Response.Write "active" %>">
                        <i class="nav-icon fas fa-home"></i>
                        <p>
                            Home
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/") > 0 Then Response.Write "menu-open" %>">
                    <a href="#" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/") > 0 Then Response.Write "active" %>">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Operador
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/src/app/modules/operador/programacion.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/programacion.asp") > 0 Then Response.Write "active" %>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Programación</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/src/app/modules/operador/planilla_electronica.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/planilla_electronica.asp") > 0 Then Response.Write "active" %>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Planilla Electrónica</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/src/app/modules/operador/disponibilidad.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/disponibilidad.asp") > 0 Then Response.Write "active" %>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Disponibilidad</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/src/app/modules/operador/regionales.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/operador/regionales.asp") > 0 Then Response.Write "active" %>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Regionales</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/src/app/modules/barrio/list.asp" class="nav-link <% If InStr(Request.ServerVariables("SCRIPT_NAME"), "/src/app/modules/barrio/list.asp") > 0 Then Response.Write "active" %>">
                        <i class="nav-icon fas fa-city"></i>
                        <p>
                            Barrios
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/src/auth/logout.asp" class="nav-link">
                        <i class="nav-icon fas fa-sign-out-alt"></i>
                        <p class="text-danger font-weight-bold">
                            Cerrar Sesión
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
