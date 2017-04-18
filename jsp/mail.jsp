<%@ page contentType="text/html; charset=utf-8" language="java" import="mail.SendEmail,org.apache.commons.lang.*,java.sql.*" errorPage="" %>
<%--sent confirm E-mail--%>
<%String addr=request.getParameter("addr");%>
<jsp:useBean id="email" scope="application" class="mail.SendEmail" />
<%email.setToAddr(addr);%>
<jsp:setProperty name="email" property="fromAddr" value="357611628@qq.com" />  
<jsp:setProperty name="email" property="username" value="357611628@qq.com" />  
<jsp:setProperty name="email" property="password" value="chen08280210" />  
<jsp:setProperty name="email" property="subject" value="欢迎订阅JStorage！" />  
<%String text="Click the link,enjoy your web developer life!<br/>We'll sent you e-mail about JS tools and news once a week.<br/>";
	String url="http://localhost/jsp/confirm.jsp?";
	String randid=RandomStringUtils.randomAlphanumeric(32);
	String content=text+"<a href="+url+randid+">"+url+randid+"</a>";
	email.setContent(content);
	Boolean result=email.sendMail();
%>
<%--connect and insert into Database--%>
<%
if(result){
Class.forName("com.mysql.jdbc.Driver");
String DBname="jdbc:mysql://123.206.88.84:3306/JStorage";
String DBuser="root";
String DBcode="";
System.out.println("Connecting to database...");
Connection conn = DriverManager.getConnection(DBname,DBuser,DBcode);
System.out.println("success!");
PreparedStatement ps;
String sql="Insert into sub_mail values(?,?,0)";
ps=(PreparedStatement)conn.prepareStatement(sql);
	ps.setString(1,randid);
	ps.setString(2,addr);
	ps.executeUpdate();
	ps.close();
	conn.close();}
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>邮件已经成功发送！</title>

    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/local.css" />

    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>   
	
	<style>
#return{
font: 14px/1.5 'Microsoft YaHei',arial,tahoma,\5b8b\4f53,sans-serif;
}
	</style>
</head>
<body>

    <div id="wrapper">
       <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.html">Back to JStorage</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="active" class="nav navbar-nav side-nav">
					<li><a href="../index.html"><i class="fa fa-home"></i>Home</a></li>                 
                    <li><a href="../blog.jsp"><i class="fa fa-bookmark"></i> Blog</a></li>
                    <li><a href="../signup.html"><i class="fa fa-envelope-o"></i> Subscribe</a></li>
                    <li><a href="../register.html"><i class="fa fa-user"></i> Register</a></li>
                    <li><a href="../timeline.html"><i class="fa fa-clock-o"></i> Timeline</a></li>
                    <li><a href="../code.jsp"><i class="fa fa-pencil-square-o"></i> Forms</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>

                        </ul>
                    </li>
                    <li class="divider-vertical"></li>
                    <li>
                        <form class="navbar-search">
                            <input type="text" placeholder="Search" class="form-control">
                        </form>
                    </li>
                </ul>
            </div>
        </nav>

        <div id="page-wrapper">

            <div class="row">

                <div class="col-lg-12 text-center v-center">

                    <h1><%=result%>已向您的邮箱发送确认邮件</h1>
                    

                    <br>
                    <br>
                    <br>

                    <p id="return">前往邮箱确认，即刻享受丰富的前端开发资讯！</p>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="text-center">
                <h1>关注我</h1>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center v-center" style="font-size: 39pt;">
                    <a href="https://plus.google.com/113135398210865908528"><span class="avatar"><i class="fa fa-google-plus"></i></span></a>
                    <a href="https://www.linkedin.com/in/%E4%B9%8B%E7%90%9B-%E8%B5%B5-32905a124"><span class="avatar"><i class="fa fa-linkedin"></i></span></a>
                    <a href="https://www.facebook.com/profile.php?id=100009588520473"><span class="avatar"><i class="fa fa-facebook"></i></span></a>
                    <a href="https://github.com/zhzhch335"><span class="avatar"><i class="fa fa-github"></i></span></a>
                </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /#page-wrapper -->
    </div>    
</body>
</html>
