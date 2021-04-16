<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String uid,status;
%>

<%
	try{

	uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select category from categories");
%>
<html>
<HEAD>
 
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body ><BR><BR>
<form action="approve_articles.jsp">
<table   align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="white">Select Category</font></strong></td>
   <td align="center" style="color: white;">
<select name="cat">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>
<%
	}
%>
</select></td>
<%
	stmt.close();
	con.close();
	}
	catch(Exception e)
{
	e.printStackTrace();
}
%>
<td colspan="2" align="center" ><input type="submit" value="View Articles" ></td>
</tr>
</table>
</form>
</body></HTML>
