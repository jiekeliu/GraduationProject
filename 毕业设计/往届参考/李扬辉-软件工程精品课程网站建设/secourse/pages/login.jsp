<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������̾�Ʒ�γ���վ������֦��ѧԺ</title>
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
											�û���
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
											��&nbsp;&nbsp;��
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
										<input type="submit" name="Submit" value="ȷ��">
										<input type="submit" name="Submit2" value="ȡ��">
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
