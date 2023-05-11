package sixteam.t6_21.model;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

@Service
public class MailService {
 
    private JavaMailSender mailSender;
 
    @Autowired
    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
 
    public void prepareAndSend(String recipient, String message) {
       MimeMessagePreparator messagePreparator = mimeMessage -> {
             MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
             messageHelper.setFrom("jitsung.wu@gmail.com"); //寄出的email
             messageHelper.setTo(recipient); //收到的
             messageHelper.setSubject("神明便利店~[訂購完成通知函]~");
             messageHelper.setText(message,true); 
         };
         try {
             mailSender.send(messagePreparator);
             //System.out.println("sent");
         } catch (MailException e) {
             //System.out.println(e);
             // runtime exception; compiler will not force you to handle it
         }
    }
	public void sendMail(String recipient,String subject,String body) throws MessagingException {    
	MimeMessage msg = mailSender.createMimeMessage();
	MimeMessageHelper helper = new MimeMessageHelper(msg);
	
	helper.setTo(recipient); 						//收件人
	helper.setSubject(subject);						//主旨
	helper.setText(body,true); 						//內文
	helper.setFrom("teemin20230202@gmail.com"); 	//寄送者
	
	mailSender.send(msg);	
	
	
}
 
}
