<%@page import="java.sql.*"%>
<%!
 Connection con;
 PreparedStatement  pst;
String mid,pass,mname,addr,email,mobile;
%>
<%
  try{
	
    mid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm","ocm");
	pst=con.prepareStatement("update member_profile set password=?,name=?,email=?,mobile=?,address=? where mem_login_id='"+mid+"'");


pass=request.getParameter("pass").trim();
mname=request.getParameter("mname").trim();
mobile=request.getParameter("mobile").trim();
email=request.getParameter("email").trim();
addr=request.getParameter("addr").trim();



pst.setString(1,pass);
pst.setString(2,mname);
pst.setString(4,mobile);
pst.setString(3,email);
pst.setString(5,addr);


int i=pst.executeUpdate();

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
<strong><font color="aqua">You Have Successfully Updated your profile.......</font></strong>
<a href="mem_home.jsp"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	pst.close();
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
<strong><font color="red">Due to internal ERROR ,Your profile was not updated.......</font></strong>
<a href="mem_home.jsp"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	pst.close();
    con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>