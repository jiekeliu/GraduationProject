	<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>

	<%
	    String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('��δ��¼����Ȩ�ظ�����Ϣ��');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("��ӭ��,"+name+"  <a href=../userinfo/logout.jsp>�˳���¼</a>  <a href=../userinfo/newMima.jsp>�޸�����</a> <a href=../userinfo/newUsername.jsp>�޸��û���</a>   <a href=../ywbd/index.jsp>���⽻����ҳ</a>   <a href=../zxcs/index.jsp>���߲�����ҳ</a>");
	%>