<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="huifuadd" scope="page" class="aaa.DBOperate_wenti"/>
<%
String name=(String) session.getAttribute("userName");
int userID=Integer.parseInt((String) session.getAttribute("userID"));
if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ���в���!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
request.setCharacterEncoding("GBK");
String huifuContent=request.getParameter("huifuContent");
//String name=(String) session.getAttribute("userName"); 
int id=Integer.parseInt(request.getParameter("wentiID"));
huifuadd.AddNewHuifu(id,huifuContent,userID);
huifuadd.closeCon();
out.print("<Script Language=Javascript>window.alert('�ظ��ɹ���');location.href='index.jsp';</Script>");
//response.sendRedirect("index.jsp");
%>