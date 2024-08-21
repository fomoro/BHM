<%

' Función para conectar a la base de datos
Function GetConnection()
  Dim conn
  Set conn = Server.CreateObject("ADODB.Connection")
  conn.Open Application("ConexionDB")
  Set GetConnection = conn
End Function

' Función para ejecutar una consulta SQL y devolver un Recordset
Function ExecuteQuery(conn, sql)
  Dim rs
  Set rs = Server.CreateObject("ADODB.Recordset")
  rs.Open sql, conn
  Set ExecuteQuery = rs
End Function

' Cerrar el Recordset y la conexión
Function CerrarConexion(rs, conn)
    If Not rs Is Nothing Then
        If rs.State = 1 Then rs.Close
        Set rs = Nothing
    End If
    If Not conn Is Nothing Then
        If conn.State = 1 Then rs.Close
        Set conn = Nothing
    End If
    CerrarConexion = True
End Function
%>