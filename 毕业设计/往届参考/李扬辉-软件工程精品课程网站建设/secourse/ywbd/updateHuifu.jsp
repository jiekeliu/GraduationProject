<%@ page import="java.sql.*" contentType="text/html;charset=GB2312" errorPage="err.jsp"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="huifuupdate" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("userName");
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ���в���!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
request.setCharacterEncoding("GB2312");
String huifuContent=request.getParameter("content");
int id=Integer.parseInt(request.getParameter("huifuID"));
huifuupdate.UpdateHuifu(id,huifuContent);

out.print("<Script Language=Javascript>window.alert('�޸ĳɹ���');location.href='index.jsp';</Script>");
//response.sendRedirect("index.jsp");
%>