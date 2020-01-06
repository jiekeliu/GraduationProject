<%@ page contentType="text/html;charset=GBK" errorPage="err.jsp"%>

<%
session.removeAttribute("admin"); 
out.print("<Script Language=Javascript>window.alert('已成功退出后台！');location.href='login.htm';</Script>");
//response.sendRedirect("login.htm");
%>