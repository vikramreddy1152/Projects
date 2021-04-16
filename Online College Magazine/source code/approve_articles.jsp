<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String category; 
%>

<%
	try{
	category=request.getParameter("cat");
	session.setAttribute("categ",category);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from articles where category='"+category+"'");
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<BR>
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" color="blue">Category</font></strong></td>
<td align="center" ><input type="text" name="categ" value=<%=category%> ></td>
</tr>
<%
	while(rs.next())
	{
%>
 <tr style="color: blue;"><td colspan="2" ><a href="maintain.jsp"><%=rs.getInt(1)%></a><b>.</b>&nbsp;&nbsp;<%=rs.getString(4)%></b></td>
      </tr>
	
<%
	}

%>
	</table>
 </body></HTML>
<%
}
catch(Exception e)
{
	e.printStackTrace();
	
}
%>