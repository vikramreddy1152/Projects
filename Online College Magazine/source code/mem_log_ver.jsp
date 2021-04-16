<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 PreparedStatement ps;
	 ResultSet rs;
	String uid,pass;
	Boolean flag;
%>
<%
   try
   {
    uid=request.getParameter("uid").trim();
	pass=request.getParameter("pass").trim();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	//stmt=con.createStatement();
	//rs=stmt.executeQuery("select * member_profile where mid='"+uid+"'");
	ps=con.prepareStatement("select * from member_profile where MEM_LOGIN_ID=? and password=?");
	    
	
	ps.setString(1, uid);
	ps.setString(2, pass);
	ResultSet rs=ps.executeQuery();
	
	flag=true;

	/* while(rs.next())
	   {
		if(uid.equals(rs.getString(1))){
		  if(pass.equals(rs.getString(2)))
		   {
			flag=false;
			 session.setAttribute("uid",uid);
			 stmt.close();
			 con.close();

			 response.sendRedirect("memlinks.html");
			}
		}
	   }//while */
	   
	   if(rs.next())
	   {
		   if(rs.getString(7).equalsIgnoreCase("Not Activated"))
		   {%>
		    
		    
		    Not Yet approved <br>
		    Please Contact Admin
		  <jsp:include page="mem_login.html"/>
		  <%}
		   else
		   {
			   session.setAttribute("uid",uid); 
			   response.sendRedirect("memlinks.html");
		   }
		 
		   
	   }
	   
	   else{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR>
<br><br><h4><font color="red">You are Entering wrong Username and password.<br> Or You are Not approved Yet.....</font></h4>
            <jsp:include page="mem_login.html"/></body><HTML>
<%
		}//if
       //stmt.close();
		ps.close();
	  con.close();
	 
  
   }//try
   
   catch(Exception e){
        e.printStackTrace();}
   %>