<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="style.css"></link>
</head>
<body>

<%
Connection con=null;
Statement st=null;

int aid=Integer.parseInt(request.getParameter("aid"));




try
{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from articles where ARTICLE_ID="+aid);
	
	
	if(rs.next())
	{
		
		
		session.setAttribute("aid", rs.getInt(1));
		
		String uid=(String)session.getAttribute("uid");
		System.out.println(uid);
		
		session.setAttribute("uid", uid);
		%>
		
		<div align="center"  style="color: white;">
		<fieldset>
		
		
		<legend>Review articles</legend>
		
		<form action="acceptarticle.jsp">
		Article Id:<br>
		<input type="text" name="aid" value="<%=rs.getInt(1)%>" readonly="readonly">
		<br>
		
		Category :<br>
		<input type="text" name="cat" value="<%=rs.getString(2)%>" readonly="readonly">
		
		<br>
		Posted By<br>
		<input type="text" name="postby" value="<%=rs.getString(5)%>">
		
		<br>
		
		Tag
		<br>
		<input type="text" name="tag" value="<%=rs.getString(3)%>">
		
		<br>
		
		Article
		
	<br>
	
	<textarea rows="" cols="" name="article"><%=rs.getString(4) %></textarea>
	
	<br>
	Remarks
	<br>
	<textarea rows="10" cols="17" name="article"></textarea>	
	
	<br>
	<input type="submit" value="Accept">
	
		</form>
		
		<br>
		<br>
		<a href="mod_approve_articles.jsp" style="text-decoration: no"><button>Back</button></a>
		</fieldset>
		</div>
		
		
		<%
		
		
		
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	con.close();
}



%>


</body>
</html>