<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="a_login" scope="page" class="aaa.DBOperate_admin"/>
<%
request.setCharacterEncoding("GBK");
String ID=request.getParameter("ID");
String password=request.getParameter("password");

ResultSet rs=a_login.AdminloginOp(ID,password);
if (rs.next())
{
	session.setAttribute("admin",rs.getString("adminID"));
	//session.setAttribute("userID",userID);
	a_login.closeCon();
	response.sendRedirect("manage.htm");
}
else
{a_login.closeCon();
out.print("<Script Language=Javascript>window.alert('您输入的信息有误！');location.href='login.htm';</Script>");
//response.sendRedirect("index.jsp");
}


%>