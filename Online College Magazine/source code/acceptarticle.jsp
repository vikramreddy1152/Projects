<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    
    <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="style.css"></link>
</head>
<body>


<%

Integer aid=(Integer)session.getAttribute("aid");


String uid=(String)session.getAttribute("uid");


int aid1=aid.intValue();


Connection con=null;
Statement st,st1,st2,st3,st4=null;



try
{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	st=con.createStatement();
	st1=con.createStatement();
	
	int i=st.executeUpdate("update articles set status='accepted' where ARTICLE_ID="+aid);
	int j=st1.executeUpdate("update ARTICLES_STATUS set status='accepted',REVIEWEDBY='"+uid+"' where ARTICLE_ID="+aid);
	
	if((i==1)&&(j==1))
	{
		st2=con.createStatement();
		st3=con.createStatement();
		st4=con.createStatement();
      Statement st5=con.createStatement();
		ResultSet rs=st2.executeQuery("select * from member_profile  where MEM_LOGIN_ID='"+uid+"'");
		rs.next();
		ResultSet rs1=st3.executeQuery("select * from articles where ARTICLE_ID="+aid);
		String postedby=null;
	
		if(rs1.next())
		{
			postedby=rs1.getString(5);
		}
		
		
		ResultSet rs2=st4.executeQuery("select * from MEMBER_PROFILE where MEM_LOGIN_ID='"+postedby+"'");
		rs2.next();
		
		  String host="", user="", pass="";

		   host ="smtp.gmail.com"; //"smtp.gmail.com";

		   user ="hr1.valueminds@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

		   pass ="maddelajoy&josh"; //Your gmail password

		   String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

		   String to =rs2.getString(4); // out going email id

		   String from ="hr1.valueminds@gmail.com"; //Email id of the recipient

		   String subject ="Your Post  :"+rs1.getString(3)+" is Accepted";

		   
		   
		   
		  
		   
		   
		   
		   
		   
		   String footerText=" Regards <br><br>Ms Divya ,<br>  Editor<br> AHTC-OCM";
		   
		   
		   String messageText ="<div style='border:2px solid green;width:350px;background-color:Tomato; color:white'>Hello"+rs2.getString(3)+" Your Post "+rs1.getString(3)+" <br>"+" is Acivated "+"Now Your Post is Live"+"<br><br><br>"+footerText+"</div>";


		   //session.setAttribute("emailid",emailid);
		   boolean sessionDebug = true;

		   Properties props = System.getProperties();
		   props.put("mail.host", host);
		   props.put("mail.transport.protocol.", "smtp");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.", "true");
		   props.put("mail.smtp.port", "465");
		   props.put("mail.smtp.socketFactory.fallback", "false");
		   props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		   Session mailSession = Session.getDefaultInstance(props, null);
		   mailSession.setDebug(sessionDebug);
		   Message msg = new MimeMessage(mailSession);
		   msg.setFrom(new InternetAddress(from));
		   InternetAddress[] address = {new InternetAddress(to)};
		   msg.setRecipients(Message.RecipientType.TO, address);
		   msg.setSubject(subject);
		   msg.setContent(messageText, "text/html"); // use setText if you want to send text
		   Transport transport = mailSession.getTransport("smtp");
		   transport.connect(host, user, pass);
		   try {
		   transport.sendMessage(msg, msg.getAllRecipients());
		   //out.println("message successfully sended"); // assume it was sent

		   }
		   catch (Exception err) {

			   err.printStackTrace();
		  // out.println("message not successfully sended"); // assume it’s a fail
		   }
		   transport.close();
		
		
		   ResultSet rs3=st5.executeQuery("select * from MEMBER_PROFILE where status='Activated'");
		   
		   
		   
		   
		   
		   String messageText1 ="<div style='border:2px solid green;width:350px;background-color:Tomato; color:white'>Dear"+rs2.getString(3)+" The Author "+postedby+" <br>"+" is posted New Aricle "+"is Live Now <br> Please visit out Online College Magzine"+"<br><br><br>"+footerText+"</div>";
		   
ArrayList useremails=new ArrayList();
		   
		   while(rs3.next())
		   {
			 useremails.add(rs3.getString(4))  ;
			 
			 
		   }
		   
		   
		   
		   
	Iterator it=useremails.iterator();
	
	while(it.hasNext())
	{
		
		to=(String)it.next();
		
		  // Properties props1 = System.getProperties();
		   props.put("mail.host", host);
		   props.put("mail.transport.protocol.", "smtp");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.", "true");
		   props.put("mail.smtp.port", "465");
		   props.put("mail.smtp.socketFactory.fallback", "false");
		   props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		    mailSession = Session.getDefaultInstance(props, null);
		   mailSession.setDebug(sessionDebug);
		   msg = new MimeMessage(mailSession);
		   msg.setFrom(new InternetAddress(from));
		   InternetAddress[]   address1= {new InternetAddress(to)};
		   msg.setRecipients(Message.RecipientType.TO, address);
		   msg.setSubject(subject);
		   msg.setContent(messageText1, "text/html"); // use setText if you want to send text
		  transport = mailSession.getTransport("smtp");
		   transport.connect(host, user, pass);
		   try {
		   transport.sendMessage(msg, msg.getAllRecipients());
		   //out.println("message successfully sended"); // assume it was sent

		   }
		   catch (Exception err) {

			   err.printStackTrace();
		  // out.println("message not successfully sended"); // assume it’s a fail
		   }
		   transport.close();
		
		
		
		
		
		
		
		
	}
	
	
	
		
		response.sendRedirect("mod_home.jsp");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}


%>
</body>
</html>