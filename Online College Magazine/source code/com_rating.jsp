<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1,ss;
	 ResultSet rs,rr;
	 String uid,comments;
	 int i,artid,c,r,r1;
%>

<%
try{
		artid=Integer.parseInt(request.getParameter("aid"));
        comments=request.getParameter("com");
	    uid=(String)session.getAttribute("uid");
        r=Integer.parseInt(request.getParameter("rat"));
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm","ocm");
	stmt=con.createStatement();
	ss=con.createStatement();
	stmt1=con.createStatement();
	rr=ss.executeQuery("select rating from articles_status where article_id='"+artid+"'");
    if(rr.next())
		if(rr.getInt(1)!=0)
		    r=r+rr.getInt(1);
	ss.executeUpdate("update articles_status set rating='"+r+"' where article_id='"+artid+"'");
	ss.close();

	rs=stmt1.executeQuery("select comments from comments where article_id='"+artid+"'");
    c=0;

	if(comments!="")
	{
	while(rs.next()){
		comments=rs.getString(1)+" && "; c++; }
	}
	
    if(c==0){
               i=stmt.executeUpdate("insert into comments values('"+artid+"','"+comments+"')");
	         }
	     else{
		       i=stmt.executeUpdate("update comments set comments='"+comments+"' where article_id='"+artid+"'"); 
			 }
	
  
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
<strong><font size="4" color="green">Thank you for giving the comment.......<BR></font></strong>
<a href="college.jsp"><h3 >BACK</h3></a>
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
<strong><font size="4" color="red">Due to internal ERROR ,Comment is not saved. Try again.......</font></strong>
<a href="college.jsp"><h3 color="green">HOME</h3></a>
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