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
</head>
<body>


<%

String mid=request.getParameter("mid");

System.out.println(mid);
String email=request.getParameter("email");
Connection con=null;
Statement st=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	st=con.createStatement();
	
	int res=st.executeUpdate("update member_profile set status='Activated' where MEM_LOGIN_ID='"+mid+"'");


   if(res==1)
   {
	   
	  ResultSet rs= st.executeQuery("select * from member_profile  where MEM_LOGIN_ID='"+mid+"'");
	   rs.next();
	   
	   String host="", user="", pass="";

	   host ="smtp.gmail.com"; //"smtp.gmail.com";

	   user ="hr1.valueminds@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

	   pass ="maddelajoy&josh"; //Your gmail password

	   String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

	   String to =rs.getString(4); // out going email id

	   String from ="hr1.valueminds@gmail.com"; //Email id of the recipient

	   String subject ="Welcome To Abhinav Hitech   College of Engineering -Online College Magzine";

	   String messageText ="Hello"+rs.getString(3)+" Your Subscription For Online magzine <br> is Acivated "+"Now You can Post articles";


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

	   out.println("message not successfully sended"); // assume it’s a fail
	   }
	   transport.close();

	   
	 response.sendRedirect("admin_home.html");
	   
   }

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>