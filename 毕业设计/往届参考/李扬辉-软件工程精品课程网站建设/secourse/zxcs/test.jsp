<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<%!final int PER = 5;%>
<html>
	<head>
		<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>
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
									<a href="../index.jsp">��ҳ</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdw.jsp">��ѧ����</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/kcjs.jsp">�γ̽���</a>
								</td>
								
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdg.jsp">��ѧ���</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ckwx.jsp">�ο�����</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ltxt.jsp">���߲���</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../ywbd/index.jsp">���⽻��</a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/dzkj.jsp">��������</a>
								</td>
								<td width="72" background="../images/top.jpg">
									<a href="../pages/shiyan.jsp">ʵ��ָ��</a>
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
								�����ţ�
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
								<INPUT TYPE="submit" value="�ύ">
							</p>
						</form>



					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

