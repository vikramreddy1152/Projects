<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,s;
	 ResultSet rs;
	 int i,id; String heading,news;
%>

<%
try{
	 
	heading=request.getParameter("heading");
	System.out.println("heading" +heading);
	news=request.getParameter("news");
	System.out.println("News	" +news);

	Class.forName("oracle.jdbc.OracleDriver");
	//System.out.println("hhehehhehe");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	/*if(con!=null)
	System.out.println("connection.........");*/

	stmt=con.createStatement();s=con.createStatement();
	rs=stmt.executeQuery("select * from collegenews");
	id=0;
	while(rs.next())
	   id++;
	id=id+1;
    stmt.close();

	i=s.executeUpdate("insert into collegenews values('"+id+"','"+heading+"',sysdate,'"+news+"')");

if(i==1)
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font color="green" size=4>News is added Successfully .......</font></strong>
<a href="admin_home.html"><h3>Home</h3></a>
</center>
</body><HTML>
<%
	s.close();
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
<strong><font color="red" size=4>Dueto internal ERROR news were not saved ...<br>So, You please try again later .....</font></strong>
<a href="admin_home.html"><h3>Home</h3></a>
</center>
</body></HTML>
<%
	s.close();
    con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
