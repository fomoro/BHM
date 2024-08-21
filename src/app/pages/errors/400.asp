<%
' Incluir el archivo dbconnection.inc para usar la función GetDBConnection
' y cualquier otro archivo necesario para la configuración global

' Registrar el error 400 en el archivo de log
LogEvent "Error 400: Solicitud incorrecta - " & Request.ServerVariables("URL")

' Función para registrar eventos en el archivo de log
Sub LogEvent(message)
    Dim fs, f, logFilePath
    logFilePath = Server.MapPath("/data/logs/app_log.txt")
    Set fs = Server.CreateObject("Scripting.FileSystemObject")
    Set f = fs.OpenTextFile(logFilePath, 8, True)
    f.WriteLine Now() & " - " & message
    f.Close
    Set f = Nothing
    Set fs = Nothing
End Sub
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error 400 - Solicitud incorrecta</title>
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">Error 400</h2>
                <p class="card-text">La solicitud realizada no es válida. Por favor, verifica la URL o los datos enviados.</p>
                <a href="home.asp" class="btn btn-primary">Ir a Home</a>
            </div>
        </div>
    </div>

    <!-- Incluye Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
