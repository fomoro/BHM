<%
Dim conn, sql, id

id = Request.QueryString("id")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("ConnectionString")

sql = "DELETE FROM Barrio WHERE Csc_Barrio = " & id
conn.Execute(sql)

conn.Close
Set conn = Nothing

Response.Redirect "list.asp"
%>
