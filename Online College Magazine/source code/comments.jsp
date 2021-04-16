<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String work=""; 
%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	stmt1=con.createStatement();
	rs=stmt.executeQuery("select a.article_id,a.article,c.comments from articles a,comments c where c.article_id=a.article_id");
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<h2 align="center"><font color="purple">Comments Details <font></h2>
<table align="center"  cellpadding="3" cellspacing="5" border="1">
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article Id</font></strong></td>
   <td align="center"><strong><font size="4" color="maroon">Article</font></strong></td>
   <td align="center"><strong><font size="4" color="maroon">Comment</font></strong></td>
 </tr>
<%
	while(rs.next())
	{
%>
 <tr>
   <td align="center"><font size="2" color="fuchsia	"><%=rs.getInt(1)%></font></td>
   <td align="center"><font size="2" color="fuchsia"><%=rs.getString(2)%></font></td>
   <td align="center"><font size="2" color="fuchsia"><%=rs.getString(3)%></font></td>
 </tr>
<%
    }
%>
</table></body></HTML>
<%
	stmt.close();stmt1.close();con.close();
  }
catch(Exception e)
{
	e.printStackTrace();
}
%>
