<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="wenti_add" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("userName");
int userID=Integer.parseInt((String) session.getAttribute("userID"));
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ���в���!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
request.setCharacterEncoding("GBK");
String content=request.getParameter("content");
//String name=(String) session.getAttribute("userName"); 
String title=request.getParameter("title");
wenti_add.AddNewWenti(title,content,userID);
wenti_add.closeCon();
out.print("<Script Language=Javascript>window.alert('�������ύ��');location.href='index.jsp';</Script>");
//response.sendRedirect("index.jsp");
%>