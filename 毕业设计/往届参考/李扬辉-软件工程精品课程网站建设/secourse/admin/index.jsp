<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
if(session.getAttribute("admin")==null)
{
	out.println("<script language='javaScript'>alert('¾¯¸æ£¡·Ç·¨µÇÂ¼');window.location='login.htm';</script>");
}else
{
	out.println("<script language='javaScript'>window.location.href=('manage.htm');</script>");
}
%>