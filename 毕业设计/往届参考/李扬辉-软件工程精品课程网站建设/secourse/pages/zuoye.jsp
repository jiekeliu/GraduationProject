<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"
	language="java" errorPage=""%>
<%@ page buffer="128kb" autoFlush="false"%>
<%@page language="java" pageEncoding="gb2312"%><!--指定jsp源文件的编码格式-->
<%
	request.setCharacterEncoding("gb2312");
%>
<jsp:useBean id="kejian" scope="page" class="aaa.DBOperate_kejian" />
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

		<title>辅导资料--作业下载</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>

	<body background="../images/back.gif">
		<%@include file="top.jsp"%>


		<table width="800" border="0" align="center" cellpadding="0" bgcolor="#FFFFFF"
			cellspacing="0">

			
			<tr>

				<td width="183" height="385" valign="top"
					background="images/main2.gif">
					<table width="181" height="241" border="1" cellpadding="0"
						cellspacing="0" bordercolor="#2D64A4">
						<tr background="../images/kejian.jpg">
							<th width="200" height="19" scope="col">
								<font size="+1" face="黑体" color="#FFFFFF">辅导资料</font>
							</th>
						</tr>
						<tr>
							<td height="201" align="center" valign="top">
								<p>
									&nbsp;
								</p>
								<p>
									<a href="dzkj.jsp" target="_parent">授课教案</a>
								</p>
								<p>
									<a href="video.jsp" target="_parent">教学录像</a>
								</p>
								<p>
									<a href="zuoye.jsp" target="_parent">
									<img alt="" src="../images/rightarrow.gif" width="25" height="25" border="0" align="middle">
									作业下载</a>
								</p>
							</td>
						</tr>
					</table>
				</td>
				<td width="617" valign="top" background="images/main1.gif">
					<div class="STYLE14"
						style="height: 421px; width: 617px; overflow: auto">
						<table width="100%" border="0" cellspacing="0">
							<tr>
								<th width="40%" height="16" align="left" scope="col">
									&nbsp; 课件名称
								</th>
								<th width="11%" align="left" scope="col">
									课件大小
								</th>
								<th width="19%" align="left" scope="col">
									上传日期
								</th>
								<th width="10%" align="right" scope="col">
									课件类型
								</th>
								<th width="15%" align="right" scope="col">
									上传者
								</th>
								<th width="5%" align="center" scope="col">
									下载
								</th>
							</tr>
							<%
								ResultSet rs = kejian.getTask();
								while (rs.next()) {
									String filename = rs.getString("fileName");
									String time = rs.getString("fileTime");
									//		time=time.substring(0,time.indexOf('.'));
							%>
							<tr>
								<td align="left">
									&nbsp;&nbsp;
									<%=filename%>
								</td>
								<td align="left"><%=rs.getString("fileSize")%></td>
								<td align="left"><%=time%></td>
								<td align="right"><%=rs.getString("fileType")%></td>
								<td align="right"><%=rs.getString("fileAdmin")%>
								</td>
								<td align="center">
									<a href="down.jsp?filepath=<%=filename%>"><img
											src="../images/filedown.gif" width="25" height="25" border="0">
									</a>
								</td>
							</tr>
							<%
								}
								kejian.closeCon();
							%>
						</table>


					</div>
				</td>
			</tr>
			<!-- InstanceEndEditable -->
		</table>
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="800" height="1">
					<img src="images/line.gif" width="800" height="1" />
				</td>
			</tr>
			
		</table>
	</body>
</html>
