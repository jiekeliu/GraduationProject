<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<jsp:useBean id="question_add" scope="page" class="aaa.DBOperate_xuexi"/>
<%

	    String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('����Ȩ�鿴����Ϣ��');location.href='login.htm';</Script>");
		}
		
request.setCharacterEncoding("GBK");
int zhangjie=Integer.parseInt(request.getParameter("zhangjie"));
String content=request.getParameter("content");
int type=Integer.parseInt(request.getParameter("type"));
String answer=request.getParameter("daan");
question_add.AddNewQuestion(content,answer,zhangjie,type);
question_add.closeCon();
out.print("<Script Language=Javascript>window.alert('��Ŀ���ӳɹ���');location.href='stgl.jsp';</Script>");

%>