<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
<title>������̾�Ʒ�γ���վ������֦��ѧԺ</title><link href="../css/style.css" rel="stylesheet">
		<script language="javascript">
function check()
{
    if(form1.content.value=="")
	{
		alert("��Ŀ��������Ϊ��!");
		return false;
	}
	 if(form1.daan.value=="")
	{
		alert("��׼�𰸲���Ϊ��!");
		return false;
	}
	return true;
}
</script>


	</head>

	<body>

		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				bordercolor="blue">

				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr>
								<td bgcolor="#D2C8F7">
									<a href="index.jsp">���ع�����ҳ</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="lightblue">
						<%
							String name = (String) session.getAttribute("admin");
							if (name == null || name.equals("")) {
								out
										.print("<Script Language=Javascript>window.alert('����Ȩ�鿴����Ϣ��');location.href='login.htm';</Script>");
							}
						%>
					</td>
				</tr>
				<tr>
					<td height="500">
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>
						<FORM name="form1" METHOD=POST ACTION="addquestion.jsp"
							onSubmit="return check();">
							<TABLE width=800>
								<TR>
									<TD align="center">
										<font size="1">�����½ڣ�</font>
										<SELECT NAME="zhangjie">
											<option value=1 selected>����</option>				
				<option value=2>�������о�</option>
				<option value=3>�������</option>
				<option value=4>��ʽ��˵������</option>
				<option value=5>�������</option>
				<option value=6>��ϸ���</option>
				<option value=7>ʵ��</option>
				<option value=8>ά��</option>
				<option value=9>������󷽷�ѧ����</option>
				<option value=10>����������</option>
				<option value=11>����������</option>
				<option value=12>�������ʵ��</option>
				<option value=13>�����Ŀ����</option>
										</SELECT>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">��Ŀ������</font>
										<TEXTAREA NAME="content" ROWS="10" COLS="80"></TEXTAREA>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">��Ŀ���ͣ�</font>
										<SELECT NAME="type">
											<option value=1 selected>
												����ѡ��
											</option>
											<option value=2>
												������ѡ��
											</option>
										</SELECT>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">��׼�𰸣�</font>
										<INPUT TYPE="text" NAME="daan" size="6" maxlength=4>
										���밴˳����д��
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
					</td>
				</tr>
				
			</table>
		</center>
	</body>
</html>
