<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程---攀枝花学院</title>

<script language="javascript">
function check()
{
    if(form1.old.value=="")
	{
		alert("原始密码不能为空!");
		return false;
	}
	if(form1.mi1.value=="")
	{
		alert("新密码不能为空!");
		return false;
	}
	
	if(form1.mi2.value!=form1.mi1.value)
	{
		alert("两次输入的新密码不一致!");
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
										<span>用户名</span>
										<input name="username" type="text" size="15" maxlength="12">
									</TD>
								</TR>
								<tr>
									<TD width="200" align="center">
										<span>密&nbsp;&nbsp;码</span>
										<input name="password" type="password" size="15"
											maxlength="16">
									</TD>
								</tr>
								<tr>
									<TD width="200" colspan="2" align="center">
										<input type="submit" name="Submit" value="登录">
									</TD>
								</TR>
								<tr>
									<TD width="200" align="center">
										<a href="#">忘记密码</a>
										<a href="../userinfo/zhuce.jsp">新用户注册</a>
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
		//	out.print("欢迎您,"+name+"  <a href=../userinfo/logout.jsp>退出登录</a>  <a href=../userinfo/newMima.jsp?userName="+name+">修改密码</a>   <a href=../userinfo/newUsername.jsp>修改用户名</a>  <a href=../pages/newwenti.jsp>提出问题</a>");
	%>
	   </td>
	   
      <td height="500" valign="top"><p>&nbsp;</p>
        <FORM  name="form1" METHOD=POST ACTION="update_mima.jsp" onSubmit="return check();">
		 <TABLE width=600>		
			<INPUT TYPE="hidden" name="userName" value=<%=name%>>
			<TR>
				<TD align="center"><font size="1">旧密码：</font><INPUT TYPE="password" name="old" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><font size="1">新密码：</font><INPUT TYPE="password" name="mi1" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><font size="1">新密码：</font><INPUT TYPE="password" name="mi2" maxlength=16></TD>
			</TR>
			<TR>
				<TD align="center"><INPUT TYPE="submit" value="提交"><INPUT TYPE="reset"  value="清空"></TD>
			</TR>

	
	  </TABLE> </FORM>
            <p>&nbsp;</p>
	</td>
    </tr>
    
  </table>
</center>
</body>
</html>



