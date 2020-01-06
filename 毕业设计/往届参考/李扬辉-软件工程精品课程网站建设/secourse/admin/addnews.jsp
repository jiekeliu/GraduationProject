<%@ page import="java.sql.*" contentType="text/html;charset=GB2312"
	errorPage="err.jsp"%>
<jsp:useBean id="news_add" scope="page" class="aaa.DBOperate_news" />
<%
	String name = (String) session.getAttribute("admin");
	if (name == null || name.equals("")) {
		out.print("<Script Language=Javascript>window.alert('您无权查看该信息！');location.href='login.htm';</Script>");
	}

	request.setCharacterEncoding("GB2312");
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	news_add.AddNews(title, content, name);
	news_add.closeCon();
	out.print("<Script Language=Javascript>window.alert('新闻公告增加成功！');location.href='newslist.jsp';</Script>");
%>