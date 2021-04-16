<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	//stmt2=con.createStatement();
	rs=stmt.executeQuery("select * from categories");
	//rs1=stmt2.executeQuery("selct * from MEMBER_PROFILE ");
%>
<html>
<head>
<script language=javascript>
function validate()
{
  if(document.form1.name.value=="")
   {
	     alert("Please enter Moderator name ...");
         document.form1.name.focus();
		 return false;
	}
  if(document.form1.id.value=="")
	 {
	     alert("Please enter Moderator ID ...");
         document.form1.id.focus();
		 return false;
	 }
  if(document.form1.pass.value=="")
	 {
	     alert("Please enter the password ...");
         document.form1.pass.focus();
		 return false;
	  }
  if(document.form1.pass.value.length<4)
	{
         alert("Password should be atleast 4 charecters");
         document.form1.pass.focus();
		 document.form1.pass.value="";
		 return false;
	}
  if(document.form1.pass.value!=document.form1.cpass.value)
    {
         alert("Password and Confirm password should be same.");
         document.form1.cpass.focus();
         document.form1.cpass.value="";
		 return false;
	 }
  if(document.form1.mobile.value=="")
	 {
	     alert(" please enter Mobile number...");
	     document.form1.mobile.focus();
		 return false;
	 }
	if(isNaN(document.form1.mobile.value))
	  {  
	     alert("mobile number should be in digits.");
	     document.form1.mobile.focus();
	     document.form1.mobile.value="";
	     return false;
	  }
	if(document.form1.mobile.value.length!=10)
	  {
	     alert(" Mobile number should be 10 digits only...");
		 document.form1.mobile.focus();
		 return false;
       }
     if(document.form1.email.value.indexOf("@")==-1)
	  {
         alert("Invalid email......");
	     document.form1.email.focus();
	     document.form1.email.value="";
         return false;
	  }
	if(document.form1.email.value.indexOf(".")==-1||document.form1.email.value.indexOf(".")==0)
	  {
          alert("Invalid email......");
	      document.form1.email.focus();
		  document.form1.email.value="";
		  return false;
	   }
   return true;
}
</script>

<link rel="stylesheet" href="style.css"></link>

</head>
<body><BR><BR>
<h2 align="center"><font color="white">Enter Moderator Details </font></h3>
<form action="add_mod2.jsp" name="form1" onsubmit="return validate()">
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" color="white">Category </font></strong></td>
<td align="center">
<select name="cat">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%>
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
<tr>
     <td align="center"><strong><font size="4" color="white">User ID</font></strong></td>
     <td align="center"><input type=text name="id">
     
     
     
     
     </td>
</tr>


<tr>
     <td align="center"><strong><font size="4" color="white">Moderator Name</font></strong></td>
     <td align="center"><input type=text name="name"></td>
</tr>

<tr>
     <td align="center"><strong><font size="4" color="white">Password</font></strong></td>
     <td align="center"><input type=password name="pass"></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="white">Confirm Password</font></strong></td>
     <td align="center"><input type=password name="cpass"></td>
</tr>
<tr>
     <td><strong><font size="4" color="white">Mobile Number</font></strong></td>
     <td align="center"><input type=text name="mobile"></td>
</tr>
<tr>
     <td><strong><font size="4" color="white">Email ID</font></strong></td>
     <td align="center"><input type=text name="email"></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="SAVE" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table>

</form>
</body>
</html>