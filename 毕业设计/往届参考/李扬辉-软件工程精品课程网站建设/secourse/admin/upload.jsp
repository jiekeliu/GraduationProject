<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,aaa.*" errorPage=""%>
<%@ page buffer="128kb" autoFlush="false"%>
<%@ page language="java" pageEncoding="gb2312"%><!--ָ��jspԴ�ļ��ı����ʽ-->
<%@ page import="com.jspsmart.upload.*,java.sql.*"%>
<%
	request.setCharacterEncoding("gb2312");
%><!--�ͻ���������������ʽ-->
<jsp:useBean id="mySmartUpload" scope="page"
	class="com.jspsmart.upload.SmartUpload" />
<jsp:useBean id="kejian" scope="page" class="aaa.DBOperate_kejian" />
<html>
	<head>
		<title>���ظ���</title>
		<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
	</head>
	<body>
		<center>
			<%
				try {
					mySmartUpload.setCharset("GB2312");
					mySmartUpload.initialize(pageContext);
					mySmartUpload.service(request, response);
					mySmartUpload.upload();
					File file = mySmartUpload.getFiles().getFile(0);
					String fn = file.getFileName();
			System.out.println(fn);////
					long size = file.getSize();
					mySmartUpload.save("upload/");

					String sql = "select fileName from t_File where fileName='" + fn
							+ "'";
			System.out.println(sql);
					ResultSet rs = kejian.getResult(sql);
					if (!rs.next()) {
						String sql1 = "insert into t_File(fileName,fileSize,fileAdmin,fileType) values('"
								+ fn
								+ "','"
								+ (size	/ 1024)
								+ "','"
								+ (String)session.getAttribute("admin")
								+ "','"
								+ (String)mySmartUpload.getRequest().getParameter("type")
								+ "')";
			System.out.println("----------------------sql----"+sql);
			System.out.println("----------------------sql1----"+sql1);
						
						rs = kejian.getResult(sql1);
						kejian.executeSQLUpdate(sql1);
						out.println(fn + "�ļ���ӳɹ����ļ���СΪ��" + size / 1024
								+ "kB��<a href='kejian.jsp'>�������</a>");
					} else
						out.println("���ļ��Ѿ�����ӣ�����������ӵ��ļ����ظ�<a href='kejian.jsp'>�������</a>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>		
	</body>
</html>