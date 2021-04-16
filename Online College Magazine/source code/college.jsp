<HTML>
<head>
<link rel="stylesheet" href="style.css"></link> 
</head>
<BODY>
<BR>
<h3 style="color:blue;">College news</h3>
<table  style="color: white;" border="2"><tr>
<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;String str1,str2;
	 int i,len;
%>

<%
	try{

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	rs=stmt.executeQuery("select * from collegenews order by dateofpost");
	rs.afterLast();

	 i=0;
	while(rs.previous() && i<3)
	{
		i++;
%>
<td   align="center" style="color:blue"><b><%=rs.getString(2)%></b><br>
(<%=rs.getString(3)%>)<br>
<%
StringBuffer  sbr=new StringBuffer(rs.getString(4));
len=sbr.length();
String []a={"","","","","","","","","","",""};
		int h,j=0;
		for ( h=0;h<len/25 ;h++ )
		{
             a[h]=sbr.substring(j,j+25);
			 j=j+25;
		}
         a[h]=sbr.substring(j,j+(len%25));
 %>

<div><%       for (int k=0;k<a.length-1 ;k++ )
                           {
		                 		out.println(a[k]+"<br>");
						    }
    	%></div></td>
<%
	}//while
    stmt.close();
	con.close();
}//try
catch(Exception e)
{
	e.printStackTrace();
}
%>
</tr></table>
</BODY>
</HTML>
