<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>

<script language="javascript">
function check()
{
    if(form1.old.value=="")
	{
		alert("ԭʼ���벻��Ϊ��!");
		return false;
	}
	if(form1.mi1.value=="")
	{
		alert("�����벻��Ϊ��!");
		return false;
	}
	
	if(form1.mi2.value!=form1.mi1.value)
	{
		alert("��������������벻һ��!");
		return false;
	}
	return true;
}
</script>

</head>

<body   background="../images/back.gif">

<center>
<%@include file="top.jsp"%>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue"  bgcolor="#FFFFFF">
	 <tr>
      <td valign="top" bgcolor="#9DCEF7" width="200">
	    <%@ page contentType="text/html;charset=GBK" errorPage="err.jsp"%>
  <%
		String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
	%>
<FORM METHOD=POST ACTION="../userinfo/login.jsp">
							<TABLE width="200" border="1" bgcolor="#F0FBF8">
								<TR>
									<TD width="200" align="center">
										<span>�û���</span>
										<input name="username" type="text" size="15" maxlength="12">
									</TD>
								</TR>
								<tr>
									<TD width="200" align="center">
										<span>��&nbsp;&nbsp;��</span>
										<input name="password" type="password" size="15"
											maxlength="16">
									</TD>
								</tr>
								<tr>
									<TD width="200" colspan="2" align="center">
										<input type="submit" name="Submit" value="��¼">
									</TD>
								</TR>
								<tr>
									<TD width="200" align="center">
										<a href="#">��������</a>
										<a href="../userinfo/zhuce.jsp">���û�ע��</a>
									</TD>
								</TR>
							</TABLE>
						</FORM>
	<%
		}
		else 
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
		//	out.print("��ӭ��,"+name+"  <a href=../userinfo/logout.jsp>�˳���¼</a>  <a href=../userinfo/newMima.jsp?userName="+name+">�޸�����</a>   <a href=../userinfo/newUsername.jsp>�޸��û���</a>  <a href=../pages/newwenti.jsp>�������</a>");
	%>
	   </td>
	   
      <td height="500" valign="top"><p>&nbsp;</p>
        <FORM  name="form1" METHOD=POST ACTION="update_mima.jsp" onSubmit="return check();">
		 <TABLE width=600>		
			<INPUT TYPE="hidden" name="userName" value=<%=name%>>
			<TR>
				<TD align="center"><font size="1">�����룺</font><INPUT TYPE="password" name="old" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><font size="1">�����룺</font><INPUT TYPE="password" name="mi1" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><font size="1">�����룺</font><INPUT TYPE="password" name="mi2" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><INPUT TYPE="submit" value="�ύ"><INPUT TYPE="reset"  value="���"></TD>
			</TR>

	
	  </TABLE> </FORM>
            <p>&nbsp;</p>
	</td>
    </tr>
    
  </table>
</center>
</body>
</html>



