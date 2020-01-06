<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
<title>软件工程精品课程网站--攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>

	<body  background="../images/back.gif">
		<center>
			<%@ include file="top.jsp"%>
			<table width="800" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
				bordercolor="lightred">

				<tr>
					<td valign="top" bgcolor="#A5DEC1">
						<%
							int id = Integer.parseInt(request.getParameter("newsID"));
						%>
					</td>
				</tr>
				<tr>
					<td height="500" valign="top">
						<p>
							&nbsp;
						</p>

						<table width="600" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<tr>

								<jsp:useBean id="news" scope="page" class="aaa.DBOperate_news" />
								<%
									String author = "", date = "", newsID = "", title = "", content = "";

									ResultSet rs = news.viewNews(id);
									if (rs.next()) {
										newsID = rs.getString("newsID");
										title = rs.getString("title");
										content = rs.getString("content");
										//author=rs.getString("author");			   
										date = rs.getString("date");
								%>
								<td colspan="4" scope="col">
									<H3 align="center"><%=title%>
									</H3>
									<p>
										<span class="style5"> <%=content%></span>
									</p>
									<p align="right">
										<span class="style5"> </span>
									</p>
									<p align="right">
										<span class="style5"> &nbsp;&nbsp; <%=date%></span>
									</p>
								</td>
							</tr>
							<%
								}
								news.closeCon();
							%>
						</table>
					</td>
				</tr>
				
			</table>
		</center>
	</body>
</html>
