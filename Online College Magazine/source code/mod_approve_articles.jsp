<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String category,uid;int i;
%>

<%
	try{

    uid=(String)session.getAttribute("uid");
    System.out.println("Uid Is :"+uid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
    stmt1=con.createStatement();
	rs1=stmt1.executeQuery("select category from moderator_profile where mod_login_id='"+uid+"'");
	if(rs1.next())
		category=rs1.getString(1);
	stmt1.close();
    session.setAttribute("categ",category);
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from articles where category='"+category+"' and status='rejected'");
	
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>


</HEAD>
<body><BR><BR>
<BR>
<table align="center"  cellpadding="3" cellspacing="5" border="3">
<tr><td align="center"><strong><font size="4" color="white">Category</font></strong></td>
<td align="center" colspan="3" ><input type="text" name="categ" value=<%=category%> ></td>
</tr>
<%
	while(rs.next())
	{
%>
 
<tr>
<td style="color:white; font-family: verdana;font-size: 14pt;"><%=rs.getInt(1) %></td>
<td style="color:white; font-family: verdana;font-size: 14pt;"><%=rs.getString(2) %></td>
<td style="color:white; font-family: verdana;font-size: 14pt;"><%=rs.getString(3) %></td>
<td  style="color:white; font-family: verdana;font-size: 14pt;"><%=rs.getString(5) %></td>
<td style="color:white; font-family: verdana;font-size: 14pt;"><a href="reviewarticles.jsp?aid=<%=rs.getInt(1) %>" style="color: white;text-decoration: none" target="home">Review</a></td>
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