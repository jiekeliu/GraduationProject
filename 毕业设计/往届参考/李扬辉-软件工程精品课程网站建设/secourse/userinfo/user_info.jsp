	<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>

	<%
	    String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('还未登录，无权回复该信息！');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("欢迎您,"+name+"  <a href=../userinfo/logout.jsp>退出登录</a>  <a href=../userinfo/newMima.jsp>修改密码</a> <a href=../userinfo/newUsername.jsp>修改用户名</a>   <a href=../ywbd/index.jsp>问题交流首页</a>   <a href=../zxcs/index.jsp>在线测试首页</a>");
	%>