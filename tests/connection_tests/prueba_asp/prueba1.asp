<!--#include file="conexion.asp" -->

<select name="ips" id="ips" style="width:200px; display:<%=ipsAEstado%>">
  <%
  ' Definir la consulta SQL
  Dim sql, rsIA, ipsAdmin
  sql = "SELECT DISTINCT Dsc_Cliente FROM Clientes ORDER BY Dsc_Cliente ASC"

  ' Ejecutar la consulta
  Set rsIA = conn.Execute(sql)

  ' Verificar si hay resultados
  If Not rsIA.EOF Then
      Do Until rsIA.EOF
          ipsAdmin = rsIA("Dsc_Cliente")
  %>
          <option value="<%=ipsAdmin%>"><%=ipsAdmin%></option>
  <%
          rsIA.MoveNext
      Loop
  Else
  %>
      <option value="">No se encontraron registros</option>
  <%
  End If

  ' Cerrar el Recordset
  rsIA.Close
  Set rsIA = Nothing
  %>
</select>

<%
' Cerrar la conexión
conn.Close
Set conn = Nothing
%>
