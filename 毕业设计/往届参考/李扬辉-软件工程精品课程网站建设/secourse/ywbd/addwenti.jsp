<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="wenti_add" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("userName");
int userID=Integer.parseInt((String) session.getAttribute("userID"));
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('还未登录，无权进行操作!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
request.setCharacterEncoding("GBK");
String content=request.getParameter("content");
//String name=(String) session.getAttribute("userName"); 
String title=request.getParameter("title");
wenti_add.AddNewWenti(title,content,userID);
wenti_add.closeCon();
out.print("<Script Language=Javascript>window.alert('问题已提交。');location.href='index.jsp';</Script>");
//response.sendRedirect("index.jsp");
%>