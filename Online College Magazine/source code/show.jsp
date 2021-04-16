<%@ page import="java.sql.*"%>

<%!
      String article;int aid,count;
	  Connection con;
	  Statement stmt,s;
	  ResultSet rs;
	 
%>

<%
  try{
    article=request.getParameter("article").trim();
	aid=Integer.parseInt(request.getParameter("aid"));
    Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	stmt=con.createStatement();
	rs=stmt.executeQuery("select count from articles_status");
	if(rs.next())
       count=rs.getInt(1);
    count=count+1;
	s=con.createStatement();
	s.executeUpdate("update articles_status set count='"+count+"' where article_id='"+aid+"'");
	stmt.close();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<html><head>
<link rel="stylesheet" href="style.css"></link>
</head>
<body><BR><BR>
<form action="com_rating.jsp" name="form1" onsubmit="return validate()">
<INPUT TYPE="hidden" name="aid" value='<%=aid%>'>
<table  align="center" cellpadding="3" cellspacing="3" >
<tr>
   <td colspan="2"align="center"><strong><font size="3" color="maroon">Article</font></strong></td>
</tr>
<tr><td  align="center">&nbsp;&nbsp;</td></tr>
<tr>
   <td colspan="2" align="center"><strong><font size="3" color="maroon"><%=article%></font></strong></td>
</tr>
<tr><td>&nbsp;&nbsp;</td></tr>
<tr>
   <td align="center"><strong><font size="3" color="maroon">comment</font></strong></td>
   <td align="center"><TEXTAREA NAME="com" ROWS="3" COLS="18"></TEXTAREA></td>
</tr>
<tr>
   <td align="center"><strong><font size="3" color="maroon">Rating</font></strong></td>
   <td align="center"><select name="rat"><option value="0">0<option value="1">1<option value="2">2</select></td>
</tr>
<tr><td colspan="2" align="center"><INPUT TYPE="submit" value="SUBMIT">&nbsp;&nbsp;&nbsp;<a href="college.jsp"><h3 >BACK</h3></a></td></tr>
</table>
</form>
</body>
</html>




    