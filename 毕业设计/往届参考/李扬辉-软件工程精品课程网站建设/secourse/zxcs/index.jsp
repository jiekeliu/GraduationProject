<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
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
									<a href="../index.jsp"><font size="+1" face="����_GB2312,����" >��&nbsp;&nbsp;ҳ</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdw.jsp"><font size="+1" face="����_GB2312,����" >��ѧ����</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/kcjs.jsp"><font size="+1" face="����_GB2312,����" >�γ̽���</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdg.jsp"><font size="+1" face="����_GB2312,����" >��ѧ���</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ckwx.jsp"><font size="+1" face="����_GB2312,����" >�ο�����</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../zxcs/index.jsp"><font size="+1" face="����_GB2312,����" >���߲���</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../ywbd/index.jsp"><font size="+1" face="����_GB2312,����" >���⽻��</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../pages/dzkj.jsp"><font size="+1" face="����_GB2312,����" >��������</font></a>
								</td>
								<td width="72"  background="../images/top.jpg">
									<a href="../pages/shiyan.jsp"><font size="+1" face="����_GB2312,����" >ʵ��ָ��</font></a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" background="../images/back.gif">
						<jsp:include page="../userinfo/user_info.jsp" flush="true" />
					</td>
				</tr>
				<tr>
					<td height="300" valign="top">
						<p>
							&nbsp;
						</p>
						<TABLE align="center">
							<TR>
								<TD>
									��ѡ���½ڣ�
								</TD>
							</TR>
							<TR>
								<TD>
									<FORM name="form1" METHOD=POST ACTION="test.jsp">

										<SELECT NAME="zhangjie">
											<option value=1 selected>
												����
											</option>
											<option value=2>
												�������о�
											</option>
											<option value=3>
												�������
											</option>
											<option value=4>
												��ʽ��˵������
											</option>
											<option value=5>
												�������
											</option>
											<option value=6>
												��ϸ���
											</option>
											<option value=7>
												ʵ��
											</option>
											<option value=8>
												ά��
											
											</option>
										</SELECT>
										<INPUT TYPE="submit" value="�������">
									</form>
								</td>
							</TR>
						</TABLE>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

