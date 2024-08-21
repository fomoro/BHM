<%
Dim conn, sql, Csc_Barrio, Dsc_Barrio, Upz_Csc

Csc_Barrio = Request.Form("Csc_Barrio")
Dsc_Barrio = Request.Form("Dsc_Barrio")
Upz_Csc = Request.Form("Upz_Csc")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("ConnectionString")

sql = "INSERT INTO Barrio (Csc_Barrio, Dsc_Barrio, Upz_Csc) VALUES (" & Csc_Barrio & ", '" & Dsc_Barrio & "', " & Upz_Csc & ")"
conn.Execute(sql)

conn.Close
Set conn = Nothing

Response.Redirect "list.asp"
%>
