<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs;
	 String art,uid;
	 int i,j,k,artid;
%>

<%
	try{
	
    art=request.getParameter("article").trim();
	artid=Integer.parseInt(request.getParameter("aid"));

	uid=(String)session.getAttribute("uid");
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	stmt1=con.createStatement();
	con.setAutoCommit (false);
	i=stmt.executeUpdate("update articles set article='"+art+"' where article_id='"+artid+"'");
	j=stmt1.executeUpdate("update articles_status set date_of_post=sysdate,status='submitted' where article_id='"+artid+"'");

  if(i==1 && j==1)
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="green">Article is saved Successfully.......<BR>
To edit one more Article click on</font></strong>
<a href="update_articles.jsp"><h3 >BACK</h3></a>
</center>
</body>
<% i=0;j=0;
    con.commit();
	stmt.close();
	stmt1.close();
	con.close();
	}
	 else
	{
%>
<body>
<br>
<br><center>
<strong><font size="4" color="red">Due to internal ERROR ,Article is not Edited. Try again.......</font></strong>
<a href="admin_home.html"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	con.rollback();
    stmt.close();
	stmt1.close();
	con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>