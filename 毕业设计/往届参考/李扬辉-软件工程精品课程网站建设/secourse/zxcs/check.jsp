<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
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
					<td height="=100">
						<img src="../images/top.gif" width="800" height="100">
					</td>
				</tr>
				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr align="center" bgcolor="lightblue">
								<td width="72">
									<a href="../index.jsp">首页</a>
								</td>
								<td width="73">
									<a href="../pages/jxdw.jsp">教学队伍</a>
								</td>
								<td width="73">
									<a href="../pages/kcjs.jsp">课程介绍</a>
								</td>
								<td width="73">
									<a href="../pages/jsdw.jsp">教师队伍</a>
								</td>
								<td width="73">
									<a href="../pages/jxdg.jsp">教学大纲</a>
								</td>
								<td width="73">
									<a href="../pages/ckwx.jsp">参考文献</a>
								</td>
								<td width="73">
									<a href="../ywbd/index.jsp">问题交流</a>
								</td>
								<td width="73">
									<a href="../pages/dzkj.jsp">辅导资料</a>
								</td>
								<td width="72">
									<a href="../pages/shiyan.jsp">实验指导</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="lightblue">
						<jsp:include page="../userinfo/user_info.jsp" flush="true" /></td>
				</tr>
				<tr>
					<td valign="top">
						<p>
							&nbsp;
						</p>
						<jsp:useBean id="check_answer" scope="page"
							class="aaa.DBOperate_xuexi" />
						<%!ResultSet rs;
	String s;%>
						<%
							String user_answer = "", answer = "", zhangjie = "";
							final int PER = 5;
							int[] qID = new int[PER];
							for (int j = 1; j <= PER; j++) {
								s = request.getParameter("q" + j);
								qID[j - 1] = Integer.parseInt(s);
								user_answer = request.getParameter("key" + j);
								//out.print(s+"  "+user_answer+"  ");
								rs = check_answer.viewQuestion(qID[j - 1]);
								if (rs.next()) {
									answer = rs.getString("answer");
									zhangjie = rs.getString("zhangjie");
								}
						%>
						<p>
							<%=qID[j - 1]%>的正确答案是：<%=answer%>,您选择的是<%=user_answer%>,
						</p>

						<%
							if (answer.equals(user_answer)) {
						%>
						<FONT SIZE="5" COLOR="#3333FF">正确！</FONT>
						<%
							} else {
						%>
						<FONT SIZE="5" COLOR="#FF0000">错误！</FONT>
						<%
							}
						%>
						<br>
						<%
							}
							check_answer.closeCon();
						%>

						<p align="center">
							<INPUT TYPE="button" value="继续测试"
								onclick="location.href='test.jsp?zhangjie=<%=zhangjie%>'">
						</p>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

