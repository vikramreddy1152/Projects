<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String uid,status;
%>

<%
	try{

	uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select article_id from articles where poster_id='"+uid+"'");
      
%>
 <html>
<HEAD>
 
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<form action="update_articles1.jsp">
<table  align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="maroon">Select Article Id</font></strong></td>
   <td align="center">
<select name="aid">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%>
<%
	}
%>
</select></td>
<td align="center"><select name="option"><option value="edit" >EDIT<option value="delete" >DELETE</select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="  OK  "></td>
</tr>
</table></form></body></html>
<%
	stmt.close();
	con.close();
	}
	catch(Exception e)
{
	e.printStackTrace();
}
%>