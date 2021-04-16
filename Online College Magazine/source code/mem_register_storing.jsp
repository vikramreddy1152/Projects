<%@page import="java.sql.*"%>
<%!
 Connection con;
 PreparedStatement  pst=null; 
 Statement stmt;
 ResultSet rs;
String mid,pass,mname,addr,email,mobile;int i;
String status="Not Activated";

%>
<%
  try{
	
	mname=request.getParameter("mname").trim();
	mid=request.getParameter("mid").trim();
	pass=request.getParameter("pass").trim();
	mobile=request.getParameter("mobile").trim();
	email=request.getParameter("email").trim();
	addr=request.getParameter("addr").trim();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm","ocm");

	
	pst=con.prepareStatement("insert into member_profile values(?,?,?,?,?,?,?)");

	pst.setString(1,mid);
	pst.setString(2,pass);
	pst.setString(3,mname);
	pst.setString(4,email);
	pst.setString(5,mobile);
	pst.setString(6,addr);
	pst.setString(7, status);

	i=pst.executeUpdate();
	
	
	
	//stmt=con.createStatement();
	//rs=stmt.executeQuery("select * from members");

  /* while(rs.next())
	{
	if(mid.equals(rs.getString(1)))
		{

			pst=con.prepareStatement("insert into member_profile values(?,?,?,?,?,?)");

			pst.setString(1,mid);
			pst.setString(2,pass);
			pst.setString(3,mname);
			pst.setString(4,email);
			pst.setString(5,mobile);
			pst.setString(6,addr);

			i=pst.executeUpdate();
		}
	}
  stmt.close(); */
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
<strong><font color="white" size=4>You Have Successfully Registered.......<br>
Please Wait for Admin Confirmation

</font></strong>
<br>
<br>
<font color="green" size=4>Click <a href="mem_login.html">here</a> to login</font>
</center>
</body><HTML>
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
<strong><font color="red" size=4>

Oops .... SomeThing Goes Wrong?
<br>

Please contact Admin


</font></strong>
<a href="mem_login.html"><h3>BACK</h3></a>
</center>
</body></HTML>
<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>