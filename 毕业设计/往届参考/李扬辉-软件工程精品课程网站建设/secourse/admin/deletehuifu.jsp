<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="huifu_delete" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('ÇëµÇÂ¼£¡');location.href='login.htm';</Script>");
		}
int id=Integer.parseInt(request.getParameter("wentiID"));
int huifuid=Integer.parseInt(request.getParameter("huifuID"));
huifu_delete.DeleteHuifu(huifuid);
huifu_delete.closeCon();
out.print("<Script Language=Javascript>window.alert('É¾³ý³É¹¦£¡');location.href='wentiview.jsp?wentiID="+id+"';</Script>");
//response.sendRedirect("index.jsp");
%>