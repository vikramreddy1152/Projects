<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String qstr;int i;
%>

<%
	try{

    qstr=request.getParameter("qstr").trim();
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from articles");
%>
<html><head>
<link rel="stylesheet" href="style.css"></link>
</head>
<body><BR><BR>
<table  align="center" cellpadding="3" cellspacing="3" >
<tr>
   <td  align="left"><strong><font size="3" color="purple">Search results for String : <I><U><%=qstr%></U></I></font></strong></td></tr>
  <tr>
  <td align="center">&nbsp;</td></tr>
  <tr>
<%
	while(rs.next())
	{
		if(qstr.indexOf(rs.getString(3)) !=-1)
		{
%>
     <form action="show.jsp">
      <tr><td><%=rs.getInt(1)%><b>.</b>&nbsp;&nbsp;<%=rs.getString(4)%></b>
	  <INPUT TYPE="hidden" name="aid" value='<%=rs.getInt(1)%>'>
 	  <INPUT TYPE="hidden" name="article" value='<%=rs.getString(4)%>'>
	  <INPUT TYPE="submit" value="show">
	  </td>
      </tr>
	  </form>
<%
		}
    }
	stmt.close();
	con.close();
%>
 </table>
 </body></HTML>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>