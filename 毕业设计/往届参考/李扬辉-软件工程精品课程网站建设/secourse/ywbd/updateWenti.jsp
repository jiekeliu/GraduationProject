<%@ page import="java.sql.*" contentType="text/html;charset=GB2312" errorPage="err.jsp"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="wentiupdate" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("userName");
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('还未登录，无权进行操作!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
request.setCharacterEncoding("GB2312");
String title=request.getParameter("title");
String wentiContent=request.getParameter("content");
int id=Integer.parseInt(request.getParameter("wentiID"));
wentiupdate.UpdateWenti(id,wentiContent,title);

out.print("<Script Language=Javascript>window.alert('修改成功！');location.href='index.jsp';</Script>");
//response.sendRedirect("index.jsp");
%>