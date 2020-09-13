package net.admin.action;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class AdminSMTP extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("test123@paxi.site","1234");
    }
}


