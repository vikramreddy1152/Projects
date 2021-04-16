<%@ page import="java.sql.*"%>

  
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%!
     Connection con;
	 Statement stmt,stmt1,stmt2;
	 ResultSet rs;
	 String cat,tag,art,uid;
	 int i,j,k,artid;
%>

<%
	try{
	cat=request.getParameter("cat").trim();
    tag=request.getParameter("tag").trim();
    art=request.getParameter("article").trim();
	artid=Integer.parseInt(request.getParameter("aid"));

	uid=(String)session.getAttribute("uid");
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	stmt1=con.createStatement();
	stmt2=con.createStatement();
	con.setAutoCommit (false);
	i=stmt.executeUpdate("insert into articles values('"+artid+"','"+cat+"','"+tag+"','"+art+"','"+uid+"','rejected')");
 
	j=stmt1.executeUpdate("insert into articles_status values("+artid+",sysdate,'0','0','rejected',' ',' ')");

	
	
	 ResultSet rs= stmt2.executeQuery("select * from member_profile  where MEM_LOGIN_ID='"+uid+"'");
	   rs.next();
	   
	   String host="", user="", pass="";

	   host ="smtp.gmail.com"; //"smtp.gmail.com";

	   user ="hr1.valueminds@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

	   pass ="maddelajoy&josh"; //Your gmail password

	   String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

	   String to =rs.getString(4); // out going email id

	   String from ="hr1.valueminds@gmail.com"; //Email id of the recipient

	   String subject ="Your Arcticle :   "+tag+" is Posted";
	   
	   String footerText="Ms Divya <br> , Editor <br> AHTC-OCM";

	   String messageText ="Hello"+rs.getString(3)+" Your  Article ->"+tag+" is Posted"+"<br> Please allow us for some time to review your post and accept<br>"+footerText;


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
	   
	   err.printStackTrace();
	   }
	   transport.close();

	
	
	
	
	
	
	
	
	
	
	
	
	
	
  if(i==1 && j==1)
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="green">Article is saved Successfully.......<BR>
To add one more Article click on</font></strong>
<a href="post_articles.jsp"><h3 >BACK</h3></a>
</center>
</body>
<% i=0;j=0;
    con.commit();
	stmt.close();
	stmt1.close();
	con.close();
	}
	 else
	{
%>
<body>
<br>
<br><center>
<strong><font size="4" color="red">Due to internal ERROR ,Article is not Added. Try again.......</font></strong>
<a href="mem_home.jsp"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	con.rollback();
    stmt.close();
	stmt1.close();
	con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>