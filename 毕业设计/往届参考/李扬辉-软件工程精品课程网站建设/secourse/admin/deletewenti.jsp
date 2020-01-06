<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="wenti_delete" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('ÇëµÇÂ¼£¡');location.href='login.htm';</Script>");
		}
int id=Integer.parseInt(request.getParameter("wentiID"));
String NO=request.getParameter("pageNO");
if (NO==null) NO="1";
wenti_delete.DeleteWenti(id);
wenti_delete.closeCon();
out.print("<Script Language=Javascript>window.alert('É¾³ý³É¹¦£¡');location.href='wentilist.jsp?pageNO="+NO+"';</Script>");
//response.sendRedirect("index.jsp");
%>