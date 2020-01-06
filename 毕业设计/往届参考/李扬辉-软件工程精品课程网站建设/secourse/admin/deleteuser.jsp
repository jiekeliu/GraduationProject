<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="user_delete" scope="page" class="aaa.DBOperate_userinfo"/>
<%
String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('ÇëµÇÂ¼£¡');location.href='login.htm';</Script>");
		}
request.setCharacterEncoding("GBK");
String username=request.getParameter("username");
String NO=request.getParameter("pageNO");
//out.print(username+"   "+NO);
user_delete.DeleteUser2(username);
user_delete.closeCon();

out.print("<Script Language=Javascript>window.alert('É¾³ý³É¹¦£¡');location.href='userlist.jsp?pageNO="+NO+"';</Script>");

%>