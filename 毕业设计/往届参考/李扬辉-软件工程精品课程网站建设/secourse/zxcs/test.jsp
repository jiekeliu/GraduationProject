<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<%!final int PER = 5;%>
<html>
	<head>
		<title>软件工程精品课程---攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>

	<body background="../images/back.gif">

		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				bordercolor="lightblue" bgcolor="#FFFFFF">
				<tr>
					<td height="100">
						<img src="../images/banner.jpg" width="800" height="100">
					</td>
				</tr>
				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr align="center" bgcolor="lightblue">
								<td width="72" background="../images/top.jpg">
									<a href="../index.jsp">首页</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdw.jsp">教学队伍</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/kcjs.jsp">课程介绍</a>
								</td>
								
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdg.jsp">教学大纲</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ckwx.jsp">参考文献</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ltxt.jsp">在线测试</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../ywbd/index.jsp">问题交流</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/dzkj.jsp">辅导资料</a>
								</td>
								<td width="72" background="../images/top.jpg">
									<a href="../pages/shiyan.jsp">实验指导</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="#0099FF">
						<jsp:include page="../userinfo/user_info.jsp" flush="true" /></td>
				</tr>
				<tr>
					<td valign="top">
						<p>
							&nbsp;
						</p>
						<jsp:useBean id="question_select" scope="page"
							class="aaa.DBOperate_xuexi" />
						<FORM name="form2" METHOD=POST ACTION="check.jsp">
							<%
								int zhangjie = Integer.parseInt(request.getParameter("zhangjie"));
								ResultSet rs = question_select.ZhangjieQuestion(zhangjie);
								rs.last();
								int total = rs.getRow();
								int i;
								String question, qID, type;

								for (int j = 1; j <= PER; j++) {

									i = (int) (Math.random() * total + 1);
									//out.print(i+"  "+total);
									rs.absolute(i);
									question = rs.getString("question");
									qID = rs.getString("qID");
									type = rs.getString("type");
									rs.absolute(-i - 1);
							%>
							<p>
								试题编号：
								<%=qID%></p>
							<p>
								<%=question%></p>
							<INPUT TYPE="hidden" name="q<%=j%>" value="<%=qID%>">
							<%
								if (type.equals("1")) {
							%>
							A
							<INPUT TYPE="radio" NAME="key<%=j%>" value="A">
							B
							<INPUT TYPE="radio" NAME="key<%=j%>" value="B">
							C
							<INPUT TYPE="radio" NAME="key<%=j%>" value="C">
							D
							<INPUT TYPE="radio" NAME="key<%=j%>" value="D">
							<%
								}
							%>

							<HR>
							<%
								}
								question_select.closeCon();
							%>
							<p align="center">
								<INPUT TYPE="submit" value="提交">
							</p>
						</form>



					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

