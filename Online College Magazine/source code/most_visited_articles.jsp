<html>
<head>
<!-- <link rel="stylesheet" href="style.css"></link> -->
 </head>
<body>
<font color="blue" size="4" class="ttl">Most Visited Articles &nbsp;&nbsp;</font>
<br><BR>
<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String qstr;int aid,i;
	 String memId="Guest";
%>

<%
   try
   {
   	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
    stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	rs=stmt.executeQuery("select article_id,count from articles_status where status='accepted' order by count ");
    stmt1=con.createStatement();
    rs.afterLast();
%>
<marquee behavior="scroll" direction="up" onMouseOver="this.stop()" onMouseOut="this.start()">
<%
  i=0;
	while(rs.previous() && i<3)
	{
		i++;
	   aid=rs.getInt(1);
       rs1=stmt1.executeQuery("select * from articles where article_id='"+aid+"'");
       while(rs1.next())
		{
%>
      <p><acronym title="type tag in search to view article">
	  <font color="maroon"><i><%=rs1.getString(3)%></i></font><b>.</b>&nbsp;&nbsp;<%=rs1.getString(4)%></b></acronym>
	  
	  <a href="guest_storecomments.jsp?aid=<%=rs.getInt(1)%>&uid=<%=memId%>">Comment</a>
	  
	  </p>
<%
		}//rs1
    }//rs
	i=0;
	stmt.close();
	stmt1.close();
	con.close();
%>
 </marquee></body></HTML>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
