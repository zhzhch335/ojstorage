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
        // 变量初始化  
        host = "smtp.qq.com";  
        username = "";  
        password = "";  
        fromAddr = "@";  
    }  
  
    // 发送邮件  
    public boolean sendMail()  
    {  
        Properties prop;  
        Session session;  
        MimeMessage msg;  
  
        try  
        {  
            prop = new Properties(); // 存储连接参数  
            prop.put("mail.smtp.host",host);  
            prop.put("mail.smtp.auth","true");  
  
            session = Session.getDefaultInstance(prop,null); // 获得一个邮件的Session  
            msg = new MimeMessage(session); // 邮件信息  
  
            // 检查邮件地址是否合法  
            if(fromAddr == null || fromAddr.equals(""))  
            {  
                throw new Exception("发件地址错误");  
            }  
            if(toAddr == null || toAddr.equals(""))  
            {  
                throw new Exception("目标地址错误");  
            }  
  
            //设置源地址  
            msg.setFrom(new InternetAddress(fromAddr));  
            //设置目的地址  
            msg.setRecipient(Message.RecipientType.TO,new InternetAddress(toAddr));  
            //设置主题  
            msg.setSubject(subject);  
  
            Multipart mp = new MimeMultipart(); //邮件内容  
            MimeBodyPart mbpContent = new MimeBodyPart();  
            mbpContent.setContent(content,"text/html"); // 邮件格式  
  
  
            mp.addBodyPart(mbpContent);  
            msg.setContent(mp);  
            msg.setSentDate(new Date());  
  
            // 发送邮件  
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