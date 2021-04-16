<%@page import="com.ahtc.ocm.db.DBUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css"></link>

<title>Insert title here</title>
</head>
<body>
<%
String memberId=request.getParameter("uid");
int aid=Integer.parseInt(request.getParameter("aid"));

Connection con=null;
Statement st,st1=null;
try
{
	
	Class.forName(DBUtilities.DRIVER_NAME);
	con=DriverManager.getConnection(DBUtilities.DRIVER_URL, DBUtilities.USERNAME, DBUtilities.PASSWORD);
	st=con.createStatement();
ResultSet rs=st.executeQuery("select * from ARTICLES_STATUS where ARTICLE_ID="+aid);
int count=0;

while(rs.next())
{
	count=rs.getInt(4);
}

count++;

st1=con.createStatement();

st.executeUpdate("update ARTICLES_STATUS set count="+count+" where ARTICLE_ID="+aid);


}catch(Exception e)
{
	e.printStackTrace();
}
finally{
	
	
	try
	{
     con.close();		
	}catch(Exception e1)
	{
		e1.printStackTrace();
	}

}
%>

<div align="center" style="color: white;font-size: 13pt;font-family: verdana;">
<H1 style="font-size: 10pt;">Article Comments</H1>
<form action="store_mem_comments_db.jsp">

<table>
<tr>
<td> Aricle Id</td>
<td><input type="text" name="aid" value="<%=aid%>" readonly="readonly"> </td>
</tr>

<tr>
<td>Given By</td>
<td><input type="text" name="uname" value="<%=memberId%>" readonly="readonly"> </td>
</tr>

<tr>
<td> Comments</td>
<td>

<textarea rows="10" cols="16" name="comment"></textarea>



 </td>
</tr>


<tr>
<td colspan="2" align="center"> 
<input type="submit" value="Submit Comments">

</td>
</tr>
</table>


</form>

<link rel="stylesheet" href="style.css"></link>

</body>
</html>