<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="registor_" scope="page" class="aaa.DBOperate_userinfo"/>
<%
request.setCharacterEncoding("GBK");
String username=request.getParameter("username");
String password=request.getParameter("mima1");

int i=registor_.AddNewUser(username,password);
switch(i)
{
case -1: out.print("<Script Language=Javascript>window.alert('该学号已存在！');location.href='zhuce.jsp';</Script>");break;
case 1: out.print("<Script Language=Javascript>window.alert('该用户名已存在！');location.href='zhuce.jsp';</Script>");break;
default : 
	session.setAttribute("userName",username);	
	out.print("<Script Language=Javascript>window.alert('注册成功！');location.href='../index.jsp';</Script>");
}
registor_.closeCon();
%>