<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,s;
	 ResultSet rs;
	 String uid,opt,art;int aid,a,as;
%>

<%
try{
     uid=(String)session.getAttribute("uid");
     aid=Integer.parseInt(request.getParameter("aid"));
	 opt=request.getParameter("option");

	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
     
if(opt.equals("edit"))
	{
	   stmt=con.createStatement();
       rs=stmt.executeQuery("select article from articles where article_id="+aid+"");

	   if(rs.next())
		{
%>
<html>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR><BR>
<form action="update_articles2.jsp">
<table  align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article id</font></strong></td>
   <td align="center"><strong><font size="2" color="maroon"><INPUT TYPE="text" NAME="aid" value="<%=aid%>"></font></strong></td></tr>
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article </font></strong></td>
   <td align="center"><strong><font size="2" color="maroon"><textarea NAME="article" rows="5" cols="18"><%=rs.getString(1)%></textarea></font></strong></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="SUBMIT" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table></form></body></html>
 
<%
		}//if
     stmt.close();
	 con.close();
	}//if
else if(opt.equals("delete"))
	{
       stmt=con.createStatement();
	   s=con.createStatement();
       a=stmt.executeUpdate("delete from articles_status where article_id="+aid+"");
       as=s.executeUpdate("delete from articles where article_id="+aid+"");

	   if(a==1 && as==1)
		{  
%>
<html>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="green">Article is deleted Successfully.......<BR>
To delete one more Article click on</font></strong>
<a href="update_articles.jsp"><h3 >BACK</h3></a>
</center>
</body>
</html>
<%
     stmt.close();
     s.close();
	 con.close();
	}
  }
}//try
catch(Exception e)
{
	e.printStackTrace();
}
%>

