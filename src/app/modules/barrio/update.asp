<%
Dim conn, rs, sql, Csc_Barrio, Dsc_Barrio, Upz_Csc, id

id = Request.QueryString("id")

If Request.Form("submit") <> "" Then
    Csc_Barrio = Request.Form("Csc_Barrio")
    Dsc_Barrio = Request.Form("Dsc_Barrio")
    Upz_Csc = Request.Form("Upz_Csc")

    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open Application("ConnectionString")

    sql = "UPDATE Barrio SET Csc_Barrio = " & Csc_Barrio & ", Dsc_Barrio = '" & Dsc_Barrio & "', Upz_Csc = " & Upz_Csc & " WHERE Csc_Barrio = " & id
    conn.Execute(sql)

    conn.Close
    Set conn = Nothing

    Response.Redirect "list.asp"
Else
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open Application("ConnectionString")

    sql = "SELECT * FROM Barrio WHERE Csc_Barrio = " & id
    Set rs = conn.Execute(sql)

    If Not rs.EOF Then
%>
<form method="post" action="update.asp?id=<%=id%>">
    Csc_Barrio: <input type="text" name="Csc_Barrio" value="<%=rs("Csc_Barrio")%>"><br>
    Dsc_Barrio: <input type="text" name="Dsc_Barrio" value="<%=rs("Dsc_Barrio")%>"><br>
    Upz_Csc: <input type="text" name="Upz_Csc" value="<%=rs("Upz_Csc")%>"><br>
    <input type="submit" name="submit" value="Update">
</form>
<%
    End If

    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End If
%>
