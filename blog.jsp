<%@ page contentType="text/html; charset=utf-8" language="java" import="mail.SendEmail,org.apache.commons.lang.*,java.sql.*" errorPage="" %>
<%--connect and insert into Database--%>
<%
int num;
String page_num=request.getQueryString();
if(page_num==null)
	num=-1;
else
	num=Integer.parseInt(page_num);
Class.forName("com.mysql.jdbc.Driver");
String DBname="jdbc:mysql://123.206.88.84:3306/JStorage?useUnicode=true&characterEncoding=UTF-8";
String DBuser="root";
String DBcode="";
System.out.println("Connecting to database...");
Connection conn = DriverManager.getConnection(DBname,DBuser,DBcode);
System.out.println("success!");
Statement ps=(Statement)conn.createStatement();
String sql="SELECT * FROM blog";
ResultSet rs=ps.executeQuery(sql);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資訊 - JStorge</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>   
	
	<script>
		function check_vaild(){
			var val=$("#tittle").val();
			var valt=$("#content").val();
			if(val==""){
				alert("兄弟，写个标题啊！");
				return false;}
			else if(valt==""){
				alert("兄弟，写点内容啊！");				
				return false;
				}
			return true;
			}
	</script>
	
	<style>
	.threed{
color: #fafafa;
letter-spacing: 0;
text-shadow: 0px 0px 0px #999, 0px 1px 0px #888, 0px 2px 0px #777, 0px 3px 0px #666, 0px 4px 0px #555, 0px 5px 0px #444, 0px 6px 0px #333, 0px 7px 6px #001135 }
.demo_line_01{
 height:10px;border:none;border-top:10px groove skyblue;
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
                <a class="navbar-brand" href="index.html">Back to JStorage</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="active" class="nav navbar-nav side-nav">
                    <li><a href="index.html"><i class="fa fa-home"></i>Home</a></li>                 
                    <li class="selected"><a href="blog.jsp"><i class="fa fa-bookmark"></i> Blog</a></li>
                    <li><a href="signup.html"><i class="fa fa-envelope-o"></i> Subscribe</a></li>
                    <li><a href="register.html"><i class="fa fa-user"></i> Register</a></li>
                    <li><a href="timeline.html"><i class="fa fa-clock-o"></i> Timeline</a></li>
                    <li><a href="code.jsp"><i class="fa fa-pencil-square-o"></i> Forms</a></li>
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
				<!--example-->
                    <!--<div class="row">
                        <div class="col-xs-12">
                            <h2>Article Title</h2>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. 
                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis 
                    dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
                    Aliquam in felis sit amet augue.
                            </p>
                            <div class="text-center">
                                <a href="#"><i class="fa fa-plus"></i>Full Story</a>
                                <a href="#"><i class="fa fa-comment"></i>12 Comments</a>
                                <a href="#"><i class="fa fa-share"></i>11 Shares</a>
                            </div>
                        </div>
                    </div>
                    <hr />-->
					<% 
					for(int j=0;j<num;j++)
					{
						rs.next();
						rs.next();
						rs.next();
					}
					for(int i=0;i<=2;i++){
					if(rs.next()){
					out.print("<div class='row'><div class='col-xs-12'><h2><a class='threed' href='./jsp/blogdetail.jsp?");
					out.print(rs.getString(1));
					out.print("'>");
					out.print(rs.getString(3));
					out.print("</a></h2><small>");
					out.print(rs.getTimestamp(6).toString());
					out.print("</small><p>");
					out.print(rs.getString(4));
					out.println("</p><div class='text-center'><i class='fa fa-plus'></i>分类：");
					out.print(rs.getString(2));
					out.println("</div></div></div><hr class='demo_line_01'/>");}										
					}
					rs.close();
					ps.close();
                      %>
					<!--turn the page-->
					<%--这里逻辑比较混乱，需要整理一下思路：
					需要有变化的地方为以下几个：
					上一页和下一页的类
					每一页的类
					上一页和下一页的链接
					--%>
					<ul class="pagination pagination-lg">
                		<li<%if(num==0||num<0) out.print(" class='disabled' onclick='return false;'");%>><a href="blog.jsp?<%=num-1%>">«</a></li>
						<li<%if(num==0||num<0) out.print(" class='active'");%>><a href="blog.jsp?0">1</a></li>
						<li<%if(num==1) out.print(" class='active'");%>><a href="blog.jsp?1">2</a></li>
						<li<%if(num==1) out.print(" class='disabled' onclick='return false;'");%>><a href="blog.jsp?<%if(num>0)out.print(num+1);else out.print(1);%>">»</a></li>
              		</ul>					
                    <!-- the comment box -->
                    <div class="well">
                        <h4>留言板:</h4>
                        <form action="/blog.jsp" onSubmit="return check_vaild();" method="post" target="_self" role="form">
                            <div class="form-group">
								<input id="tittle" name="tittle" class="form-control" type="text" placeholder="标题"> 
                                <textarea id="content" name="content" class="form-control" rows="3" placeholder="内容"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </form>
						<%--value!=""--%>
						<%
						request.setCharacterEncoding("utf-8");
						java.util.Enumeration en =  request.getParameterNames();
						while(en.hasMoreElements()){
							String name=(String)en.nextElement();
							String value=request.getParameter(name);
							if(value!=""){
									PreparedStatement pr;
									String tittle=request.getParameter("tittle");
									String text=request.getParameter("content");
									String randid=RandomStringUtils.randomAlphanumeric(32);					
									String sql1="Insert into all_comment values(?,?,?,Now())";
									pr=(PreparedStatement)conn.prepareStatement(sql1);
										pr.setString(1,randid);
										pr.setString(2,tittle);
										pr.setString(3,text);
										pr.executeUpdate();	
										pr.close();
										break;															
							}
						}				
						%>
						<%--
						if(en.hasMoreElements()){
						PreparedStatement pr;
						String tittle=request.getParameter("tittle");
						String text=request.getParameter("content");
						String randid=RandomStringUtils.randomAlphanumeric(32);					
						String sql1="Insert into all_comment values(?,?,?,Now())";
						pr=(PreparedStatement)conn.prepareStatement(sql1);
							pr.setString(1,randid);
							pr.setString(2,tittle);
							pr.setString(3,text);
							pr.executeUpdate();	
							pr.close();
						}
						--%>
                    </div>

                    <hr>
					<p>最新5条留言：</p>
                    <!-- the comments -->
					<%
					Statement cs=(Statement)conn.createStatement();
					String sql2="SELECT * FROM all_comment order by date DESC";
					ResultSet rcs=cs.executeQuery(sql2);
					for(int k=0;k<=4;k++){
					rcs.next();
					out.print("<h3>");
					out.print(rcs.getString(2));
					out.print("<small>");
					out.print(rcs.getString(4));
					out.print("</small></h3><p>");										
					out.print(rcs.getString(3));
					out.print("</p>");}	
					cs.close();
					rcs.close();
					conn.close();				
					%>
					<!--examples-->
              <!--      <h3>Blog contents
                    <small>2014/03/07 11:43 PM</small>
                    </h3>
                    <p>This is a very interesting blog, well structured and organized. Would be great if you included more information on other IT topics as well.</p>-->
               
                </div>
                 <div class="col-sm-3">
                    <div class="row">
                        <div class="col-xs-12">
                            <h2>百家</h2>
                            <div class="panel panel-default">
                                <div class="panel-heading">如何正确学习JavaScript</div>
                                <div class="panel-body">
既然你找到这篇文章来，说明你是真心想学好JavaScript的。你没有想错，当今如果要开发现代网站或web应用（包括互联网创业），都要学会JavaScript。而面对泛滥的JavaScript在线学习资源，却是很难找到一份高效而实用的方法去学习这个“web时代的语言”。
                                </div>
                                <div class="text-center">
                                    <a href="http://www.shejidaren.com/how-to-learn-javascript.html"><i class="fa fa-plus"></i>详情</a>
                                </div>
                            </div>
                            <hr />
                            <div class="panel panel-default">
                                <div class="panel-heading">JavaScript Puzzlers!</div>
                                <div class="panel-body">
                                    This is a JavaScript quiz based on the behaviour as of ECMA 262 (5.1) in a browser environment.
Behaviour may be different if you try it in a node or jsc REPL, for example this and global are different at the top level of a firefox console, node repl or jsc shell. Sorry about that.
                                </div>
                                <div class="text-center">
                                    <a href="http://javascript-puzzlers.herokuapp.com/"><i class="fa fa-plus"></i>详情</a>
                                </div>
                            </div>
                            <hr />
                            <div class="panel panel-default">
                                <div class="panel-heading">同构JavaScript是Web的未来吗？</div>
                                <div class="panel-body">
                                    同构JavaScript应用指的是用JavaScript编写的应用，能够同时运行于客户端和服务器。这也让在客户端和服务器之间共享代码变成一种更普遍自然的选择。这一趋势通过库（如React）共享模版得到了增强。
                                </div>
                                <div class="text-center">
                                    <a href="http://www.csdn.net/article/2015-02-26/2824023"><i class="fa fa-plus"></i>详情</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
