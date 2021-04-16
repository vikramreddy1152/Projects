<%@page import="com.ahtc.ocm.db.DBUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1> Articles</h1>


<table border="3">

<tr>
<td>Article Id</td>
<td>Category</td>
<td>Article Tag</td>

<td>Article </td>
<td>Posted By</td>
<td>Comment</td>
</tr>


<%
Connection con=null;
Statement st,st1,st2=null;

ResultSet rs=null;


String memId=(String)session.getAttribute("uid");

//session.setAttribute("uid", memId);

try
{

	Class.forName(DBUtilities.DRIVER_NAME);
	con=DriverManager.getConnection(DBUtilities.DRIVER_URL, DBUtilities.USERNAME, DBUtilities.PASSWORD);
	
	
	st=con.createStatement();
	
	
	rs=st.executeQuery("select * from articles where status='accepted' and NOT POSTER_ID='"+memId+"'");
	while(rs.next())
	{
		
		%>
		<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>

<td><%=rs.getString(4) %> </td>
<td><%=rs.getString(5) %></td>
<td><a href="storecomments.jsp?aid=<%=rs.getInt(1)%>&uid=<%=memId%>">Comment</a></td>
</tr>
		
		<%
		
		
	}
}
	catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	con.close();
}

%>
</table>


</body>
</html>