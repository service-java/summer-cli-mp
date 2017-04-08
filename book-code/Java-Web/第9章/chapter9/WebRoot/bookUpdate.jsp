<%@page import="java.sql.*"%><%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Itzcn书店</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="container">
  <!-- ============= header start ============= -->
  <div id="header">
    <div id="banner">
      <h1 class="logo">Itzcn书店</h1>
    </div>
    <!-- ============= 菜单条(开始) ============= -->
    <div id="menubar">
      <ul>
        <li class="active_menu"><a href="#">首页</a></li>
        <li><a href="#">关于书店</a></li>
        <li><a href="#">新书列表</a></li>
        <li><a href="#">图书专辑</a></li>
        <li><a href="#">我的账号</a></li>
        <li><a href="#">用户注册</a></li>
        <li><a href="#">联系我们</a></li>
        <li><a href="#">人才招聘</a></li>
      </ul>
    </div>
    <!-- ============= 菜单条(结束) ============= -->
  </div>
  <!-- ============= header end ============= -->
  <div id="body" class="clear">
    <!-- ============= body_left start ============= -->
    <div id="body_left">
      <!-- ============= 好书推荐（开始） ============= -->
      <h2><img src="imgs/bullet1.gif" />更新图书信息</h2>
      <div class="prod clear">
      <%
	try {
		//驱动类
		String url = "jdbc:mysql://localhost:3306/db_book";
		String username = "root"; //用户名
		String password = "123456"; //密码
		Connection conn = null;
		Statement statement = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, username, password);
		statement = conn.createStatement();
		String sql = "select * from books where id="+request.getParameter("id");
		ResultSet rs = statement.executeQuery(sql);
%><%
		if (rs.next()) {
	%>
<form action="bookServlet" method="post">
	图书名称：<input type="text" name="name" value="<%=rs.getString("name")%>" /><br>
	图书价格：<input type="text" name="price" value="<%=rs.getString("price")%>" /><br> 
	出  &nbsp;版 &nbsp;社：<input type="text" name="publisher" value="<%=rs.getString("publisher")%>" /><br>
	图书作者：<input type="text" name="author" value="<%=rs.getString("author")%>" /><br> 
	内容简介：<textarea name="comments"cols="40" rows="4"><%=rs.getString("intro")%></textarea><br>
	<input type="hidden" name="action" value="update"/>
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
	<input type="submit" name="commit" value="提交" /><input type="reset" value="重置" /><br>
</form>
<%
		}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
      </div>
      <!-- ============= 好书推荐（结束） ============= -->

    </div>
    <!-- ============= body_left end ============= -->
    <div id="body_right">
      <div id="cart" class="clear">
        <h2><img src="imgs/cart.gif" width="21" height="18" />购物车</h2>
        <div class="info">2件商品 | <span>总计：123￥</span><a href="#">查看购物车</a></div>
      </div>
      <img src="imgs/border.gif" width="329" height="31" />
      <div id="about_our">
        <h2><img src="imgs/bullet3.gif" width="26" height="25" />关于书店</h2>
        <div class="details clear"> <img src="images/about.jpg" />
          <p>　　汇智科技公司关注IT教育培训市场的发展和变化，致力于在线教育，推进无纸化教学进程。窗内网（www.itzcn.com）结合软件开发的实际需求，发布了Flex、C#、Java、ASP.NET和

JSP等系列视频教程。</p>
        </div>
      </div>
      <img src="imgs/border.gif" width="329" height="31" />
      <div id="promotions">
        <h2><img src="imgs/bullet4.gif" width="26" height="25" />图书分类</h2>
        <ul class="list">
          <li><a href="#">三维动画</a></li>
          <li><a href="#">.NET技术</a></li>
          <li><a href="#">Java技术</a></li>
          <li><a href="#">PHP技术</a></li>
          <li><a href="#">其它语言</a></li>
          <li><a href="#">Web前端</a></li>
          <li><a href="#">数据库技术</a></li>
          <li><a href="#">基础应用</a></li>
        </ul>
      </div>
      <div class="right_box">
        <h2><img src="imgs/bullet6.gif" width="26" height="25" />友情链接</h2>
        <ul class="list">
          <li><a href="#">窗内网</a></li>
          <li><a href="#">窗内论坛</a></li>
          <li><a href="#">Google搜索</a></li>
          <li><a href="#">百度搜索</a></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- ============= footer start ============= -->
  <div id="footer">
    <div class="logo"> <img src="imgs/logo.png" /> <img src="imgs/itzcn.gif" /> </div>
    <div class="nav">
      <ul>
        <li><a href="#">首页</a></li>
        <li><a href="#">关于我们</a></li>
        <li><a href="#">服务</a></li>
        <li><a href="#">保密协议</a></li>
        <li><a href="#">联系我们</a></li>
      </ul>
    </div>
    <img src="imgs/footer_bg.gif" /> </div>
  <!-- ============= footer end ============= -->
</div>
</body>
</html>