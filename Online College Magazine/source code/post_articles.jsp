<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,s;
	 ResultSet rs,r;
	 int i;
%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from categories");
	s=con.createStatement();
	r=s.executeQuery("select * from articles");
	i=0;
	while(r.next())
		i++;
	i=i+1;
	
%>
<html>
<head>
<script language=javascript>
function validate()
	{
	  if(document.form1.tag.value=="")
	   {
	     alert("Please enter Tag...");
         document.form1.tag.focus();
		 return false;
		 }
      if(document.form1.article.value=="")
	   {
	     alert("Please enter Article...");
         document.form1.article.focus();
		 return false;
		 }
		 return true;
    }
</script>

<link rel="stylesheet" href="style.css"></link>

</head>
<body><BR><BR>
<h2 align="center"><font color="blue">Post Articles Here</font></h3>
<form action="post_articles_db.jsp" name="form1" onsubmit="return validate()">
<table align="center"  cellpadding="3" cellspacing="5">
<tr>
     <td align="center"><strong><font size="4" color="blue">Article ID</font></strong></td>
     <td align="center"><input type=text name="aid" readonly value=<%=i%>></td>
</tr>
<tr><td align="center"><strong><font size="4" color="blue">Category</font></strong></td>
<td align="center">
<select name="cat">
<option value=0>--select--</option>
<%i=0;
	while(rs.next())
	{
%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%>
<%
	}
%>
</select></td></tr>
<%
    s.close();
	stmt.close();
	con.close();
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<tr>
     <td align="center"><strong><font size="4" color="blue">Tag</font></strong></td>
     <td align="center"><input type=text name="tag"></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="blue">Article</font></strong></td>
     <td align="center"><textarea  name="article" rows="5" cols="18"></textarea></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" value="SAVE" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" ></td>
</tr>
</table>
</form>
</body>