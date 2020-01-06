<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="login" scope="page" class="aaa.DBOperate_userinfo"/>
<%
request.setCharacterEncoding("GBK");
String username=request.getParameter("username");
String password=request.getParameter("password");

ResultSet rs=login.loginOp(username,password);
if (rs.next())
{
	session.setAttribute("userName",username);
	session.setAttribute("userID",rs.getString("userID"));
	login.closeCon();
	response.sendRedirect("../index.jsp");
}
else
{login.closeCon();
out.print("<Script Language=Javascript>window.alert('您输入的信息有误！');window.location.href='../index.jsp';</Script>");
//response.sendRedirect("index.jsp");
}


%>