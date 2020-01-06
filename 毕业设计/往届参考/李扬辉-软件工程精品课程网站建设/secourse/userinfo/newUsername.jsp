<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
<title>软件工程精品课程---攀枝花学院</title>

		<script language="javascript">
function check()
{
    if(form1.newusername.value=="")
	{
		alert("用户名不能为空!");
		return false;
	}
	
	return true;
}
</script>

	</head>

	<body   background="../images/back.gif">

		<center>
			<%@include file="top.jsp"%>
			<table width="800" border="1" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF"
				bordercolor="lightblue">
				<tr>
					<td valign="top" bgcolor="#9DCEF7">
						<%@ page contentType="text/html;charset=GBK" errorPage="err.jsp"%>
						<%
							String name = (String) session.getAttribute("userName");
							if (name == null || name.equals("")) {
						%>

						<FORM METHOD=POST ACTION="login.jsp">
							<TABLE width="600">
								<TR>
									<TD>
										<span class="style4">用户名</span>
										<input name="username" type="text" size="20" maxlength="12">
									</TD>
									<TD>
										<span class="style4">密码</span>
										<input name="password" type="password" size="20"
											maxlength="16">
									</TD>
									<TD>
										<input type="submit" name="Submit" value="登录">
										<a href="#">忘记密码</a>
										<a href="zhuce.htm">新用户注册</a>
									</TD>
								</TR>
							</TABLE>
						</FORM>
						<%
							} else
							 {
						%>
						<table border="1" width="200" bgcolor="#F0FBF8" >
							<tr>
								<td align="center">
									欢迎您,
									<%=name%>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/logout.jsp>退出登录</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/newMima.jsp?userName= <%=name%>>修改密码</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/newUsername.jsp>修改用户名</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../ywbd/index.jsp>提出问题</a>
								</td>
							</tr>
						</table>
						<%
						}
								//out.print("欢迎您,"
								//				+ name
								//				+ "  <a href=../userinfo/logout.jsp>退出登录</a>  <a href=../userinfo/newMima.jsp?userName="
								//				+ name
								//				+ ">修改密码</a>   <a href=../userinfo/newUsername.jsp>修改用户名</a>  <a href=../ywbd/newwenti.jsp>提出问题</a>");
						%>
					</td>

					<td height="500" valign="top" width="600">
						<p>
							&nbsp;
						</p>
						<FORM name="form1" METHOD=POST ACTION="update_username.jsp"
							onSubmit="return check();">
							<TABLE width=600>
								<INPUT TYPE="hidden" name="userName" value=<%=name%>>
								<TR>
									<TD align="center">
										<FONT SIZE="3" COLOR="#FF0000"><%=name%></FONT>
										<p>
									</td>
								</TR>
								<TR>
									<TD align="center">
										<font size="3">新用户名：</font>
										<INPUT TYPE="text" name="newusername" maxlength=16>
									</TD>
								</TR>

								<TR>
									<TD align="center">
										<INPUT TYPE="submit" value="提交">
										<INPUT TYPE="reset" value="清空">
									</TD>
								</TR>


							</TABLE>
						</FORM>
						<p>
							&nbsp;
						</p>
					</td>
				</tr>
				
			</table>
		</center>
	</body>
</html>



