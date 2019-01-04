<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% request.getSession().invalidate(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  
  <body>
  <form action="user/user.htm?m=login" method="post">
  	账户：<input type="text" name="userName" /><br />
  	密码：<input type="password" name="password" /><br />
  	<input type="submit" value="登录" />
  </form>
    <a href="daren/daren.htm?method=list">首页</a>
  </body>
</html>
