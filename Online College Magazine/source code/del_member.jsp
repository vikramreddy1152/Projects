<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String uid,status;
%>

<%
	try{

	uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select mem_login_id from member_profile");
%>
<html>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
<script language="javascript">
	function f()
     {
         a=window.confirm("Are u sure ?");
         if(a)
            return true;
	     else 
	        return false;
    }
	</script>
</HEAD>
<body><BR><BR>
<form action="mem_delete.jsp"  onsubmit="return f()">
<table   align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="maroon">Select Member Id</font></strong></td>
   <td align="center">
<select name="meid">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>
<%
	}
%>
</select></td>
<%
	stmt.close();
	con.close();
	}
	catch(Exception e)
{
	e.printStackTrace();
}
%>
<td colspan="2" align="center" ><input type="submit" value="Delete" ></td>
</tr>
</table>
</form>
</body></HTML>
