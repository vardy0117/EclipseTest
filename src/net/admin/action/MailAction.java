package net.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.*;
import javax.net.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.Multipart;
import javax.mail.*;
import com.mysql.fabric.xmlrpc.base.Array;

import net.customer.db.CustomerBean;

public class MailAction extends HttpServlet {
	public void mailtest (HttpServletRequest request, HttpServletResponse response ) throws IOException{

	request.setCharacterEncoding("UTF-8");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	// 입력값 받음
	 
	System.out.println("메일 입력받은 제목 " + subject);
	Properties p = new Properties(); 
	 
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();

	
	try{

	    Session session = Session.getInstance(p, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("6ydz642@naver.com","jfsheamfncj4");
            }
        });
	
            
	    Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));// ur email
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));// 대량메일 발송 가능하게 하는 부분 -> parse 메서드
        message.setSubject(subject);
        message.setText(content);
    
        
        message.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(message); // 전송
	    
	//  out.println("<script>alert('메일발송 성공');location.href='main/admin.jsp';</script>");
	    out.println("<script>alert('메일발송 성공'); window.close(); </script>");
	} catch(Exception e){
	    System.out.println("메일 발송 실패 " + e);
	    out.println("<script>alert('메일발송에 실패하였습니다..');history.back();</script>");

	}

	 
	
}
}