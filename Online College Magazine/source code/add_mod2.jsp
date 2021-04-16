<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 PreparedStatement pst;
	 ResultSet rs;
	 String mid,mname,pass,mobile,email,cat;
	 int i;
%>

<%
	try{
	mid=request.getParameter("id").trim();
	mname=request.getParameter("name").trim();
    pass=request.getParameter("pass").trim();
	cat=request.getParameter("cat").trim();
	mobile=request.getParameter("mobile").trim();
	email=request.getParameter("email").trim();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	pst=con.prepareStatement("insert into moderator_profile values(?,?,?,?,?,?)");
	
	pst.setString(1,mid);
	pst.setString(2,pass);
	pst.setString(3,mname);
	pst.setString(4,email);
	pst.setString(5,mobile);
	pst.setString(6,cat);

	i=pst.executeUpdate();
   
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
<strong><font size="4" color="white">Moderator  <%=mname%> is added Successfully.......<BR>
To add one more Moderator click on</font></strong>
<a href="add_moderator.jsp"><h3 color="white">BACK</h3></a>
</center>
</body>
<% i=0;
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
<strong><font size="4" color="red">Due to internal ERROR ,Moderator details are not Added.<br> Try again.......</font></strong>
<a href="admin_home.jsp"><h3 color="green">HOME</h3></a>
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