package com.tech.service;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;


@Service
public class EmailSerivce {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String text) {
        MimeMessage message = mailSender.createMimeMessage();
        
        try {
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);
            helper.setFrom("noreply@techjobs.com", "TechJobs");
            mailSender.send(message);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    
    public void sendPasswordResetEmail(String to, String newPassword) {
    	MimeMessage message = mailSender.createMimeMessage();
    	try {
    		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
    		helper.setTo(to);
    		helper.setSubject("Đặt lại mật khẩu");
    		helper.setText("Mật khẩu mới của bạn là: " + newPassword);
    		helper.setFrom("noreply@techjobs.com", "TechJobs");
            mailSender.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    }
}

