<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="username_" scope="page" class="aaa.DBOperate_userinfo"/>
<%
request.setCharacterEncoding("GBK");
String name=(String) session.getAttribute("userName");
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ���в���!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
String newUsername=request.getParameter("newusername");

if(username_.updateUsername(newUsername,name))
{
	session.setAttribute("userName",newUsername);
	out.print("<Script Language=Javascript>window.alert('�޸ĳɹ���');location.href='../index.jsp';</Script>");
}
else out.print("<Script Language=Javascript>window.alert('���û����Ѵ��ڣ�');location.href='../userinfo/newUsername.jsp';</Script>");
	

username_.closeCon();
%>