<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="registor_" scope="page" class="aaa.DBOperate_userinfo"/>
<%
request.setCharacterEncoding("GBK");
String username=request.getParameter("username");
String password=request.getParameter("mima1");

int i=registor_.AddNewUser(username,password);
switch(i)
{
case -1: out.print("<Script Language=Javascript>window.alert('��ѧ���Ѵ��ڣ�');location.href='zhuce.jsp';</Script>");break;
case 1: out.print("<Script Language=Javascript>window.alert('���û����Ѵ��ڣ�');location.href='zhuce.jsp';</Script>");break;
default : 
	session.setAttribute("userName",username);	
	out.print("<Script Language=Javascript>window.alert('ע��ɹ���');location.href='../index.jsp';</Script>");
}
registor_.closeCon();
%>