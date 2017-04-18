<%@ page contentType="text/html; charset=utf-8" language="java" import="mail.SendEmail,org.apache.commons.lang.*,java.sql.*" errorPage="" %>
<%--简化版动态网页生成流程：
1、从url处获取js信息，进行查询；
2、查询结果包括一串文本和JS的id，文本用于填写左半部分的文本域，id用于将内联框架连接至原始代码的JSP页面；
3、文本域提交后，jsp页面通过选择结构直接执行重新写入的数据；
4、刷新内联框架（待定）--%>
<%--connect and insert into Database--%>
<%
String id=request.getQueryString();
if(id==null) id="ToeqPslI62";
Class.forName("com.mysql.jdbc.Driver");
String DBname="jdbc:mysql://123.206.88.84:3306/JStorage?useUnicode=true&characterEncoding=UTF-8";
String DBuser="root";
String DBcode="";
System.out.println("Connecting to database...");
Connection conn = DriverManager.getConnection(DBname,DBuser,DBcode);
System.out.println("success!");
Statement ps=(Statement)conn.createStatement();
String sql="SELECT * FROM javascript WHERE id='"+id+"'";
ResultSet rs=ps.executeQuery(sql);
rs.next();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>代码 - JStorage</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />
	<style>
	.threed{
color: #fafafa;
letter-spacing: 0;
text-shadow: 0px 0px 0px #999, 0px 1px 0px #888, 0px 2px 0px #777, 0px 3px 0px #666, 0px 4px 0px #555, 0px 5px 0px #444, 0px 6px 0px #333, 0px 7px 6px #001135 }
	</style>
	

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
      
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
                    <li><a href="blog.jsp"><i class="fa fa-bookmark"></i> Blog</a></li>
                    <li><a href="signup.html"><i class="fa fa-envelope-o"></i> Subscribe</a></li>
                    <li><a href="register.html"><i class="fa fa-user"></i> Register</a></li>
                    <li><a href="timeline.html"><i class="fa fa-clock-o"></i> Timeline</a></li>
                    <li  class="selected"><a href="code.jsp"><i class="fa fa-pencil-square-o"></i> Forms</a></li>
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
				<center><h1 class="threed">代码在线生成</h1></center>
                <center><p class="lead">修改左侧参数，右侧呈现！</p></center>			
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form action="jsp/codedetail.jsp" method="post" target="submitframe">
								<button type="submit" class="btn btn-success">提交</button>
								<button type="button" onClick="location.reload();" class="btn btn-warning">重置</button>
								<div class="btn-group">
									<button type="button" class="btn btn-primary">选择案例</button>
									<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li><a href="code.jsp?3Wz4TN2RgR">Jquery的淡入淡出</a></li>
										<li><a href="code.jsp?ToeqPslI62">最简单的DOM对象</a></li>
										<li><a href="code.jsp?13Fs8BcxC4">unslider轮播图</a></li>
										<li class="divider"></li>
										<li><a href="blog.jsp">寻找更多案例</a></li>
									</ul>
								</div>								
								<textarea name="text" class="form-control" rows="40"><%out.print(rs.getString(3));%></textarea>
							</form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div class="panel panel-default">
                        <div class="panel-body">
							<iframe style="background:#FFFFFF" name="submitframe" src="<%if(id!="3Wz4TN2RgR"){out.print("jsp/codedetail.jsp?code=");out.print(rs.getString("id"));}else out.print("jsp/codedetail.jsp?code=3Wz4TN2RgR");rs.close();ps.close();conn.close();%>" width="100%" height="980"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->			    
		</div>
	</div>		
	<!-- /.page-wrapper -->

			    
</body>
</html>
