package mail;

import java.util.Date;  
import java.util.Properties;  
  
import javax.mail.*;  
import javax.mail.internet.*;  
  
public class SendEmail  
{  
    String host;  
    String username;  
    String password;  
    String fromAddr;  
    String toAddr;  
    String subject;  
    String content;  
  
    public SendEmail()  
    {  
        // ������ʼ��  
        host = "smtp.qq.com";  
        username = "";  
        password = "";  
        fromAddr = "@";  
    }  
  
    // �����ʼ�  
    public boolean sendMail()  
    {  
        Properties prop;  
        Session session;  
        MimeMessage msg;  
  
        try  
        {  
            prop = new Properties(); // �洢���Ӳ���  
            prop.put("mail.smtp.host",host);  
            prop.put("mail.smtp.auth","true");  
  
            session = Session.getDefaultInstance(prop,null); // ���һ���ʼ���Session  
            msg = new MimeMessage(session); // �ʼ���Ϣ  
  
            // ����ʼ���ַ�Ƿ�Ϸ�  
            if(fromAddr == null || fromAddr.equals(""))  
            {  
                throw new Exception("������ַ����");  
            }  
            if(toAddr == null || toAddr.equals(""))  
            {  
                throw new Exception("Ŀ���ַ����");  
            }  
  
            //����Դ��ַ  
            msg.setFrom(new InternetAddress(fromAddr));  
            //����Ŀ�ĵ�ַ  
            msg.setRecipient(Message.RecipientType.TO,new InternetAddress(toAddr));  
            //��������  
            msg.setSubject(subject);  
  
            Multipart mp = new MimeMultipart(); //�ʼ�����  
            MimeBodyPart mbpContent = new MimeBodyPart();  
            mbpContent.setContent(content,"text/html"); // �ʼ���ʽ  
  
  
            mp.addBodyPart(mbpContent);  
            msg.setContent(mp);  
            msg.setSentDate(new Date());  
  
            // �����ʼ�  
            Transport transport = session.getTransport("smtp");  
            transport.connect((String)prop.get("mail.smtp.host"),username,password);  
            transport.sendMessage(msg,msg.getRecipients(MimeMessage.RecipientType.TO));  
  
            transport.close();  
            return true;  
        }  
        catch(Exception e)  
        {  
            System.out.println(e);  
            return false;  
        }  
    }  
  
    // getter and setter  
    public String getPassword()  
    {  
        return password;  
    }  
    public void setPassword(String password)  
    {  
        this.password = password;  
    }  
  
    public String getHost()  
    {  
        return host;  
    }  
    public void setHost(String host)  
    {  
        this.host = host;  
    }  
  
    public String getUsername()  
    {  
        return username;  
    }  
    public void setUsername(String username)  
    {  
        this.username = username;  
    }  
  
    public String getFromAddr()  
    {  
        return this.fromAddr;  
    }  
    public void setFromAddr(String addr)  
    {  
        fromAddr = addr;  
    }  
  
    public String getToAddr()  
    {  
        return this.toAddr;  
    }  
    public void setToAddr(String addr)  
    {  
        toAddr = addr;  
    }  
  
    public String getSubject()  
    {  
        return subject;  
    }  
    public void setSubject(String sub)  
    {  
        subject = sub;  
    }  
  
    public String getContent()  
    {  
        return content;  
    }  
    public void setContent(String content)  
    {  
        this.content = content;  
    }  
  
}  