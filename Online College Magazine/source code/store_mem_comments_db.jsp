<%@page import="com.ahtc.ocm.db.DBUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

int aid=Integer.parseInt(request.getParameter("aid"));
String givenBy=request.getParameter("uname");
String commnet=request.getParameter("comment");

Connection con=null;
Statement st=null;

PreparedStatement ps,ps1=null;

int i,j=0;


try
{
Class.forName(DBUtilities.DRIVER_NAME);
con=DriverManager.getConnection(DBUtilities.DRIVER_URL, DBUtilities.USERNAME,DBUtilities.PASSWORD);


st=con.createStatement();
//st1=con.createStatement();

ps=con.prepareStatement("insert into comments values(?,?,?)");

ps.setInt(1,aid );
ps.setString(2,commnet);
ps.setString(3, givenBy);


i=ps.executeUpdate();


ResultSet rs=st.executeQuery("select * from ARTICLES_STATUS where ARTICLE_ID="+aid);

int rating=0;
if(rs.next())
{
	rating=rs.getInt(3);
	
}
System.out.println(rating);
ps1=con.prepareStatement("update ARTICLES_STATUS set rating=? where ARTICLE_ID=?");


ps1.setInt(1, rating+1);

ps1.setInt(2, aid);


j=ps1.executeUpdate();


if((i==1)&&(j==1))
{
	out.println("Comments Stored Succefully");
	


	
	RequestDispatcher rd=request.getRequestDispatcher("mem_veiwarticles.jsp");
	
	rd.include(request, response);
}


}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	try
	{
		con.close();
	}catch(Exception e1)
	{
		e1.printStackTrace();
	}
}
%>


</body>
</html>