<%@ page contentType="text/html; charset=utf-8" language="java" import="mail.SendEmail,org.apache.commons.lang.*,java.sql.*" errorPage="" %>
<%--connect and insert into Database--%>
<%Class.forName("com.mysql.jdbc.Driver");
String DBname="jdbc:mysql://123.206.88.84:3306/JStorage";
String DBuser="root";
String DBcode="";
System.out.println("Connecting to database...");
Connection conn = DriverManager.getConnection(DBname,DBuser,DBcode);
System.out.println("success!");
Statement ps=(Statement)conn.createStatement();
String id=request.getQueryString();
String sql="SELECT * FROM blog WHERE id='" + id +"'";
ResultSet rs=ps.executeQuery(sql);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%rs.next();
	out.print(rs.getString("title"));
	%></title>

    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/local.css" />

    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>   
		
	<style>
	.threed{
color: #fafafa;
letter-spacing: 0;
text-shadow: 0px 0px 0px #999, 0px 1px 0px #888, 0px 2px 0px #777, 0px 3px 0px #666, 0px 4px 0px #555, 0px 5px 0px #444, 0px 6px 0px #333, 0px 7px 6px #001135 }
code {
text-indent:0;
border-color:#000;
border-style:dashed;
border-width:1px;
display:block;
font-size:12px;
font-family:Calibri,"微软雅黑", "新宋体", "宋体";
margin:10px 0 0 0;
padding:10px 0 10px 5px;
-moz-border-radius:5px;
background:#f5f5f5;
color:#000;
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

       <div class="container">
            <div class="row">
               
                <div class="col-sm-9">
					<%
					
					out.print("<div class='row'><div class='col-xs-12'><h2>");
					out.print(rs.getString(3));
					out.print("</h2><small>");
					out.print(rs.getString(6));
					out.print("</small><p>");
					out.print(rs.getString(5));
					out.println("</p><div class='text-center'><a href='#'><i class='fa fa-plus'></i>");
					out.print(rs.getString(2));
					out.println("</a><a href='#'><i class='fa fa-comment'></i>2 Comments</a><a href='#'><i class='fa fa-share'></i>211 Shares</a></div></div></div><hr />");															
					rs.close();
					ps.close();
					conn.close();
                      %>
					  </div>
                </div>
    </div>

</body>
</html>
