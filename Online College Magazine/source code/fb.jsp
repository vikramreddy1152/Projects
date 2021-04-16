<%@page import="java.sql.*"%>
<%!
 Connection con;
 Statement stmt,stmt1; 
 ResultSet rs;
String fb;int i,c;
%>
<%
  try{
	     fb=request.getParameter("fb");
         Class.forName("oracle.jdbc.driver.OracleDriver");
	     con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm","ocm");
		 stmt=con.createStatement();
		 stmt1=con.createStatement();
		 rs=stmt.executeQuery("select * from feedback");
         c=0;
		 while(rs.next())
			 c++;
		 c=c+1;
		 i=stmt1.executeUpdate("insert into feedback values('"+c+"','"+fb+"')");

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
<strong><font size="4" color="green">Thank you for giving the Feedback.......<BR></font></strong>
<a href="middleframe.html"><h3 >BACK</h3></a>
</center>
</body>
<% i=0;c=0;
	stmt.close();
	stmt1.close();
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
<strong><font size="4" color="red">Due to internal ERROR ,Feedback is not saved. Try again.......</font></strong>
<a href="middleframe.html"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
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
