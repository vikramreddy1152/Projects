<%!
    String cat;
%>
<% 
   cat=(String)session.getAttribute("categ");
 %>
<HTML>
<HEAD>
<script>
  function validate() 
	{
            if(document.form1.aid.value=="")
			 {
			    alert(" please enter Article ID .");
				document.form1.aid.focus();
				return false;
			 }
	       if(isNaN(document.form1.aid.value))
		    {  
			   alert("Article ID should be in digits.");
			   document.form1.aid.focus();
			   document.form1.aid.value="";
			   return false;
			}
		   if(document.form1.status.value=="")
			 {
			    alert(" please select status details....");
				return false;
			 }

       return true;
	}   
function madefield()
{
f=document.createElement("input");
f.type="text";
f.name="reason";
f.value="";
res.insertBefore(f);
}
function remove()
{
   var parent=document.getElementsByTagName("td")[0];
   var ele=document.getElementById("reason");
   var old=(ele.parentNode).removeChild(ele);
}
  
</script>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<BR>
<form action="add_reason.jsp" name="form1" onsubmit="return validate()">
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" color="maroon">Category</font></strong></td>
<td align="center" ><input type="text" name="cat" value="<%=cat%>" ></td>
</tr>
<tr>
<td align="center"><strong><font size="4" color="maroon"> Article ID</font></strong></td>
<td align="center" ><input type="text" name="aid"></td>
</tr>
<td align="center"><strong><font size="4" color="maroon"> Status</font></strong></td>
<td align="center"><font size="2" color="olive">

                      <input type="radio" name="status" value="approved" >

					  Approve
					  <input type="radio" name="status" value="rejected" onclick="madefield(this)">
					  Reject</font></td>

<tr><td></td><td align="center"><div id=""></div></td>
<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="OK" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table>
</body>
</HTML>