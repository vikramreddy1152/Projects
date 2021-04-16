<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 String uid,status,reason;
	 int j,aid;
%>

<%
	try{
	
	aid=Integer.parseInt(request.getParameter("aid"));
	System.out.println("artical id " +aid);
	uid=(String)session.getAttribute("uid");
	System.out.println("user id "+uid);
    status=request.getParameter("status").trim();
	
    
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	con.setAutoCommit (false);

	if(status.equals("approved"))
	{
		j=stmt.executeUpdate("update articles_status set status='"+status+"',reason='-' where article_id='"+aid+"'");
		//out.println(aid);
		//System.out.println(j);
	}
	if(status.equals("rejected"))
	{
		reason=request.getParameter("reason");
		j=stmt.executeUpdate("update articles_status set status='"+status+"',reason='"+reason+"' where article_id='"+aid+"'");
	
	}
	
	 if(j==1)
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="green">Article status is saved Successfully.......<BR>
To give status to one more Article click on</font></strong>
<a href="approve_articles.jsp"><h3 >BACK</h3></a>
</center>
</body></html>
<% j=0;
    con.commit();
	stmt.close();
	con.close();
	}
	 else
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="red">Due to internal ERROR ,Article staus is not saved. Try again.......</font></strong>
<a href="admin_home.html"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	con.rollback();
    stmt.close();
	con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>