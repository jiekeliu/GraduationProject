<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>软件工程精品课程网站——攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>

	<body   background="../images/back.gif">

		<center>
			<%@include file="top.jsp"%>
			<table>
				<tr>
					<td>
						<br />
						<br />
						<form name="form1" method="post" action="../ywbd/login.jsp">
							<table width="400" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td>
										<div align="right" class="style5">
											用户名
										</div>
									</td>
									<td>
										<input name="username" type="text" class="a" id="username"
											size="20">
									</td>
								</tr>
								<tr>
									<td>
										<div align="right" class="style5">
											密&nbsp;&nbsp;码
										</div>
									</td>
									<td>
										<input name="password" type="password" class="a" id="password"
											size="20">
									</td>
								</tr>
								<tr>
									<td>
										<div align="right">
										</div>
									</td>
									<td>
										<input type="submit" name="Submit" value="确定">
										<input type="submit" name="Submit2" value="取消">
									</td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				
			</table>
		</center>
	</body>
</html>
