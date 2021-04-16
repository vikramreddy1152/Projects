
<HTML>
<HEAD>
<script>
  function validate() 
	{
            if(document.form1.mname.value=="")
			 {
			    alert(" please enter Member name...");
				document.form1.mname.focus();
				return false;
			 }
            if(document.form1.mid.value=="")
			 {
			    alert(" please enter Member ID...");
				document.form1.mid.focus();
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
           if(document.form1.addr.value=="")
			 {
			    alert(" please enter Address...");
				document.form1.addr.focus();
				return false;
			 }

       return true;
	}   
  
</script>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<BODY><center>

<fieldset>
<legend><font style="color: white;font-size:15 pt; font-family: verdana;font-style: bold;">Member Registration</font></legend>
<form action="mem_register_storing.jsp" name="form1" onsubmit="return validate()">
<br>
<table align="center"  cellpadding="3" cellspacing="5">
<tr>
     <td><strong><font size="4" color="black">Member Name</font></strong></td>
     <td align="center"><input type=text name="mname"></td>
</tr>
<tr>
     <td><strong><font size="4" color="white">Member ID</font></strong></td>
     <td align="center"><input type=text name="mid" placeholder="Enter Your Roll No"></td>
</tr>
<tr>
     <td><strong><font size="4" color="white">Password</font></strong></td>
     <td align="center"><input type=password name="pass"></td>
</tr>
<tr>
     <td><strong><font size="4" color="white">Confirm Password</font></strong></td>
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
     <td><strong><font size="4" color="white">Address</font></strong></td>
     <td align="center"><input type=text name="addr"></td>
</tr>

<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="SUBMIT" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table>
</center>
</form>

</fieldset>
<br><br><br>
</BODY>
</HTML>
