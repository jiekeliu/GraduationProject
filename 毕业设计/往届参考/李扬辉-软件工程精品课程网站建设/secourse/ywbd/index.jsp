<%@ page import="java.sql.*" contentType="text/html;charset=GB2312"
	errorPage="err.jsp"%>
<html>
	<head>
		<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>
	<body background="../images/back.gif">
	<%@include file="top.jsp" %>
		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				bordercolor="lightblue" bgcolor="#FFFFFF">				
				<tr>
					<td valign="top" background="../images/back.gif">
						<%
							request.setCharacterEncoding("GBK");

							String name = (String) session.getAttribute("userName");
							if (name == null || name.equals("")) {
								out
										.print("<Script Language=Javascript>window.alert('��δ��¼����Ȩ�鿴����Ϣ��');history.back();</Script>");
							} else
								out
										.print("��ӭ��,"
												+ name
												+ "  <a href=../userinfo/logout.jsp>�˳���¼</a>   <a href=../userinfo/newMima.jsp>�޸�����</a> <a href=../userinfo/newUsername.jsp>�޸��û���</a> <a href=newwenti.jsp>�������</a>    <a href=index.jsp>���⽻����ҳ</a> ");
						%>
					</td>
				</tr>
				<tr>
					<td height="500" valign="top">
						<p>
							&nbsp;
						</p>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr bgcolor="#66B3FF">
								<th width="400" scope="col">
									<span class="style5">�������</span>
								</th>
								<th width="200" scope="col">
									<span class="style5">������</span>
								</th>
								<th scope="col">
									<span class="style5">����ʱ��</span>
								</th>
							</tr>
							<jsp:useBean id="wentilist_" scope="page"
								class="aaa.DBOperate_wenti" />
							<%
								String wentiID, username, date, wentiTitle;
								String NO = request.getParameter("pageNO");
								int nowPage;
								if (NO == null)
									nowPage = 1;
								else
									nowPage = Integer.parseInt(NO);
								final int per = 20;
								int totalPages;
								int i = per;
								ResultSet rs = wentilist_.ListWenti();

								rs.last();
								int totalRows = rs.getRow();
								rs.absolute(-totalRows - 1);
								if (totalRows <= per)
									totalPages = 1;
								else
									totalPages = totalRows / per + 1;

								if (nowPage <= 1) {
									nowPage = 1;
									while (rs.next() && i > 0) {
										wentiID = rs.getString("wentiID");
										username = rs.getString("username");
										date = rs.getString("date");
										wentiTitle = rs.getString("wentiTitle");
										i--;
							%>
							<tr bgcolor="#ECF5FF">
								<td>
									<a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle%></a>
								</td>
								<td>
									<span class="style4"><%=username%></span>
								</td>
								<td>
									<span class="style4"><%=date%></span>
								</td>
							</tr>

							<%
								}
									if (totalPages == 1) {
							%>
							<tr  bgcolor="#C4E1FF">
								<td colspan=4  align="right">
									<font size=1>��ҳ βҳ ��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>����
										ÿҳ��ʾ<%=per%>��</font>
								</td>
							</tr>
							<%
								} else {
							%>
							<tr>
								<td colspan=4 bgcolor="#C4E1FF" align="right">
									<font size=1>��ҳ</font>
									<a href="index.jsp?pageNO=<%=totalPages%>">βҳ</a>
									<font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>����</font>
									<font size=1>��һҳ</font>
									<a href="index.jsp?pageNO=<%=nowPage + 1%>">��һҳ</a>
									<font size=1>ÿҳ��ʾ<%=per%>��</font>
								</td>
							</tr>
							<%
								}
								} else if (nowPage >= totalPages) {
									nowPage = totalPages;
									if (nowPage > 1)
										rs.absolute((nowPage - 1) * per);
									while (rs.next() && i > 0) {
										wentiID = rs.getString("wentiID");
										username = rs.getString("username");
										date = rs.getString("date");
										wentiTitle = rs.getString("wentiTitle");
										i--;
							%>
							<tr bgcolor="#ECF5FF">
								<td>
									<a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle%></a>
								</td>
								<td>
									<span class="style4"><%=username%></span>
								</td>
								<td>
									<span class="style4"><%=date%></span>
								</td>
							</tr>

							<%
								}
							%>
							<tr>
								<td colspan=3 bgcolor="#C4E1FF" align="right">
									<a href="index.jsp?pageNO=1">��ҳ</a>
									<a href="index.jsp?pageNO=<%=totalPages%>">βҳ</a>
									<font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ</font>
									<a href="index.jsp?pageNO=<%=nowPage - 1%>">��һҳ</a>
									<font size=1>��һҳ</font>
									<font size=1>ÿҳ��ʾ<%=per%>��</font>
								</td>
							</tr>
							<%
								} else {
									rs.absolute((nowPage - 1) * per);
									while (rs.next() && i > 0) {
										wentiID = rs.getString("wentiID");
										username = rs.getString("username");
										date = rs.getString("date");
										wentiTitle = rs.getString("wentiTitle");
										i--;
							%>
							<tr bgcolor="#ECF5FF">
								<td>
									<a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle%></a>
								</td>
								<td>
									<span class="style4"><%=username%></span>
								</td>
								<td>
									<span class="style4"><%=date%></span>
								</td>
							</tr>
							<%
								}
							%>
							<tr>
								<td colspan=3 bgcolor="#C4E1FF" align="right">
									<a href="index.jsp?pageNO=1">��ҳ</a>
									<a href="index.jsp?pageNO=<%=totalPages%>">βҳ</a>
									<font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ</font>
									<a href="index.jsp?pageNO=<%=nowPage - 1%>">��һҳ</a>
									<a href="index.jsp?pageNO=<%=nowPage + 1%>">��һҳ</a>
									<font size=1>ÿҳ��ʾ<%=per%>��</font>
								</td>
							</tr>
							<%
								}
								wentilist_.closeCon();
								response.setHeader("refresh", "60");
							%>

						</table>
						<p>
							&nbsp;
						</p>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

