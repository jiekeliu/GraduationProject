<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="mima_" scope="page" class="aaa.DBOperate_userinfo"/>
<%
request.setCharacterEncoding("GBK");
String name=(String) session.getAttribute("userName");
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('还未登录，无权进行操作!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
String old=request.getParameter("old");
String mima=request.getParameter("mi1");
String username=request.getParameter("userName");

//out.print(old+"  "+mima+"   "+username);
if(mima_.updatePassword(username,old,mima))
	out.print("<Script Language=Javascript>window.alert('修改成功！');location.href='../index.jsp';</Script>");
else out.print("<Script Language=Javascript>window.alert('您输入的密码有误！');location.href='../userinfo/newMima.jsp';</Script>");
	

mima_.closeCon();
%>