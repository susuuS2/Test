package Controller.Join;


import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;


public class mailsend {

	
	public void mailFalse(HttpServletRequest request, HttpServletResponse response) throws Exception{ // 1차 미승인이 났을 때
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = dao.select();
		
		String em = dto.getJoinEmail1();
		String em2 = dto.getJoinEmail2();
		 request.setCharacterEncoding("utf-8");
		   String sender = "jhsk3c@gmail.com"; // 보내는 사람
		   String receiver = em+"@"+em2;
		   String subject= "ㅁㅁㅁ사이트의 관리자 입니다.";// 받는 사람 
		   String content= "회원가입에 실패했습니다. 양식을 다시 작성해 주세요. ";

		   		//메일에서 
		   String server = "imap.gmail.com";
		   String port = "465";
		   
		   Properties properties = new Properties();
		   properties.put("mail.smtp.host", server);
		   properties.put("mail.smtp.port", port);
		   // 보안
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.debug", "true");
		   properties.put("mail.smtp.socketFactory.port", port);
		   properties.put("mail.smtp.socketFactory.fallback","false");
		   properties.put("mail.smtp.socketFactory.class",
		         "javax.net.ssl.SSLSocketFactory");
		   
		   Session s = Session.getInstance(properties, 
		         new Authenticator(){
		            protected PasswordAuthentication 
		               getPasswordAuthentication(){
		               return new PasswordAuthentication(
		                     "jhsk3c","dudrms0070");
		            }
		   });
		   Message message = new MimeMessage(s);
		   message.setHeader("content-type", "text/html; charset=UTF-8");
		   message.setSubject(subject);
		   message.setContent(content, "text/html; charset=UTF-8");
		   message.setSentDate(new Date());
		   message.setFrom(new InternetAddress(sender));
		   message.setRecipient(Message.RecipientType.TO, 
		         new InternetAddress(receiver));
		   Transport.send(message, message.getAllRecipients());
	}

	public void mailTrue(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = dao.select();
		
		String em = dto.getJoinEmail1();
		String em2 = dto.getJoinEmail2();
		 request.setCharacterEncoding("utf-8");
		   String sender = "jhsk3c@gmail.com"; // 보내는 사람
		   String receiver = em+"@"+em2;
		   String subject= "ㅁㅁㅁ사이트의 관리자 입니다.";// 받는 사람 
		   String content= "회원가입에 성공하였습니다. 2차 서류를 제출해주세요. ";

		   		//메일에서 
		   String server = "imap.gmail.com";
		   String port = "465";
		   
		   Properties properties = new Properties();
		   properties.put("mail.smtp.host", server);
		   properties.put("mail.smtp.port", port);
		   // 보안
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.debug", "true");
		   properties.put("mail.smtp.socketFactory.port", port);
		   properties.put("mail.smtp.socketFactory.fallback","false");
		   properties.put("mail.smtp.socketFactory.class",
		         "javax.net.ssl.SSLSocketFactory");
		   
		   Session s = Session.getInstance(properties, 
		         new Authenticator(){
		            protected PasswordAuthentication 
		               getPasswordAuthentication(){
		               return new PasswordAuthentication(
		                     "jhsk3c","dudrms0070");
		            }
		   });
		   Message message = new MimeMessage(s);
		   message.setHeader("content-type", "text/html; charset=UTF-8");
		   message.setSubject(subject);
		   message.setContent(content, "text/html; charset=UTF-8");
		   message.setSentDate(new Date());
		   message.setFrom(new InternetAddress(sender));
		   message.setRecipient(Message.RecipientType.TO, 
		         new InternetAddress(receiver));
		   Transport.send(message, message.getAllRecipients());
	}
	
	public void mailTrueTwo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = dao.select();
		
		String em = dto.getJoinEmail1();
		String em2 = dto.getJoinEmail2();
		 request.setCharacterEncoding("utf-8");
		   String sender = "jhsk3c@gmail.com"; // 보내는 사람
		   String receiver = em+"@"+em2;
		   String subject= "ㅁㅁㅁ사이트의 관리자 입니다.";// 받는 사람 
		   String content= "회원가입에 성공하였습니다. ";

		   		//메일에서 
		   String server = "imap.gmail.com";
		   String port = "465";
		   
		   Properties properties = new Properties();
		   properties.put("mail.smtp.host", server);
		   properties.put("mail.smtp.port", port);
		   // 보안
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.debug", "true");
		   properties.put("mail.smtp.socketFactory.port", port);
		   properties.put("mail.smtp.socketFactory.fallback","false");
		   properties.put("mail.smtp.socketFactory.class",
		         "javax.net.ssl.SSLSocketFactory");
		   
		   Session s = Session.getInstance(properties, 
		         new Authenticator(){
		            protected PasswordAuthentication 
		               getPasswordAuthentication(){
		               return new PasswordAuthentication(
		                     "jhsk3c","dudrms0070");
		            }
		   });
		   Message message = new MimeMessage(s);
		   message.setHeader("content-type", "text/html; charset=UTF-8");
		   message.setSubject(subject);
		   message.setContent(content, "text/html; charset=UTF-8");
		   message.setSentDate(new Date());
		   message.setFrom(new InternetAddress(sender));
		   message.setRecipient(Message.RecipientType.TO, 
		         new InternetAddress(receiver));
		   Transport.send(message, message.getAllRecipients());
	}

		public void mailFalseTwo(HttpServletRequest request, HttpServletResponse response) throws Exception{ // 1차 미승인이 났을 때
			
			JoinDAO dao = new JoinDAO();
			JoinDTO dto = dao.select();
			
			String em = dto.getJoinEmail1();
			String em2 = dto.getJoinEmail2();
			 request.setCharacterEncoding("utf-8");
			   String sender = "jhsk3c@gmail.com"; // 보내는 사람
			   String receiver = em+"@"+em2;
			   String subject= "ㅁㅁㅁ사이트의 관리자 입니다.";// 받는 사람 
			   String content= "최종 회원가입에 실패했습니다. 2차 서류를 다시 제출해주세요. ";
		
			   		//메일에서 
			   String server = "imap.gmail.com";
			   String port = "465";
			   
			   Properties properties = new Properties();
			   properties.put("mail.smtp.host", server);
			   properties.put("mail.smtp.port", port);
			   // 보안
			   properties.put("mail.smtp.starttls.enable", "true");
			   properties.put("mail.smtp.auth", "true");
			   properties.put("mail.smtp.debug", "true");
			   properties.put("mail.smtp.socketFactory.port", port);
			   properties.put("mail.smtp.socketFactory.fallback","false");
			   properties.put("mail.smtp.socketFactory.class",
			         "javax.net.ssl.SSLSocketFactory");
			   
			   Session s = Session.getInstance(properties, 
			         new Authenticator(){
			            protected PasswordAuthentication 
			               getPasswordAuthentication(){
			               return new PasswordAuthentication(
			                     "jhsk3c","dudrms0070");
			            }
			   });
			   Message message = new MimeMessage(s);
			   message.setHeader("content-type", "text/html; charset=UTF-8");
			   message.setSubject(subject);
			   message.setContent(content, "text/html; charset=UTF-8");
			   message.setSentDate(new Date());
			   message.setFrom(new InternetAddress(sender));
			   message.setRecipient(Message.RecipientType.TO, 
			         new InternetAddress(receiver));
			   Transport.send(message, message.getAllRecipients());
		}
}
	


