<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,s;
	 ResultSet rs,r;
	 String uid;int id;
%>

<%
	try{
    uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select article_id from articles where poster_id='"+uid+"' ");
	s=con.createStatement();
	
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<h2 align="center"><font color="purple">Article Details <font></h2>
<table align="center"  cellpadding="3" cellspacing="5" border="1">
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article ID</font></strong></td>
   <td align="center"><strong><font size="4" color="maroon">Status</font></strong></td>
   <td align="center"><strong><font size="4" color="maroon">Reason</font></strong></td>
 </tr>
<%
	while(rs.next())
	{
	   id=rs.getInt(1);  
       r=s.executeQuery("select * from articles_status where article_id='"+id+"'");
	   while(r.next())
		{
%>
 <tr>
   <td align="center"><font size="2" color="fuchsia"><%=r.getInt(1)%></font></td>
   <td align="center"><font size="2" color="fuchsia"><%=r.getString(5)%></font></td>
   <td align="center"><font size="2" color="fuchsia"><%=r.getString(6)%></font></td>
 </tr>
<%
		}
    }
%>
</table></body></HTML>
<%
	s.close();
    stmt.close();
    con.close();
  }
catch(Exception e)
{
	e.printStackTrace();
}
%>
