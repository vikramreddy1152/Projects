<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"></link>
</head>
<body>

<div align="center">
<h1 style="color: white;">Activate Members</h1>

<font color="white">
<table border="2" style="background-color: black;">
<tr>
<td>Member Id</td>
<td>Member Name</td>
<td>Member Email</td>
<td>Mobile</td>

<td>Activate</td>
</tr>
<%

Connection con=null;
Statement st=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	st=con.createStatement();
     ResultSet rs=  st.executeQuery("select * from member_profile where status='Not Activated'");


     
     while(rs.next())
     {
    	 %>
    	 
    	 
    	 
    	 <tr>
    	<td><%=rs.getString(1) %></td>
    	<td><%=rs.getString(3) %></td>
    	<td><%=rs.getString(4) %></td>
    	<td><%=rs.getString(5) %></td>
    	<td><a href="activate.jsp?mid=<%=rs.getString(1)%>">Activate</a></td>
    	 
    	 </tr>
    	 
    	 
    	 
    	
    	 
    	 <%
    	 
     }
}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</table>
</font>
</div>
<%-- <jsp:include page="admin_home.html"></jsp:include> --%>


</body>
</html>