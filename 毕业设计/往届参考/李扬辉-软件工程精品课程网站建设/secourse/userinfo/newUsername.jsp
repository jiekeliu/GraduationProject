<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>

		<script language="javascript">
function check()
{
    if(form1.newusername.value=="")
	{
		alert("�û�������Ϊ��!");
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
										<span class="style4">�û���</span>
										<input name="username" type="text" size="20" maxlength="12">
									</TD>
									<TD>
										<span class="style4">����</span>
										<input name="password" type="password" size="20"
											maxlength="16">
									</TD>
									<TD>
										<input type="submit" name="Submit" value="��¼">
										<a href="#">��������</a>
										<a href="zhuce.htm">���û�ע��</a>
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
									��ӭ��,
									<%=name%>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/logout.jsp>�˳���¼</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/newMima.jsp?userName= <%=name%>>�޸�����</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../userinfo/newUsername.jsp>�޸��û���</a>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href=../ywbd/index.jsp>�������</a>
								</td>
							</tr>
						</table>
						<%
						}
								//out.print("��ӭ��,"
								//				+ name
								//				+ "  <a href=../userinfo/logout.jsp>�˳���¼</a>  <a href=../userinfo/newMima.jsp?userName="
								//				+ name
								//				+ ">�޸�����</a>   <a href=../userinfo/newUsername.jsp>�޸��û���</a>  <a href=../ywbd/newwenti.jsp>�������</a>");
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
										<font size="3">���û�����</font>
										<INPUT TYPE="text" name="newusername" maxlength=16>
									</TD>
								</TR>

								<TR>
									<TD align="center">
										<INPUT TYPE="submit" value="�ύ">
										<INPUT TYPE="reset" value="���">
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



