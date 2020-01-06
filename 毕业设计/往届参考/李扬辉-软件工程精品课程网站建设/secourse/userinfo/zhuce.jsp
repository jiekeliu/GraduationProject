
<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>软件工程精品课程---攀枝花学院</title>

<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
function check()
{
	s=form1.xuehao.value   
	
	if(form1.username.value=="")
	{
		alert("用户名不能为空!");
		return false;
	}
	if(form1.xingming.value=="")
	{
		alert("姓名不能为空!");
		return false;
	}
	  if(form1.mima1.value=="")
	{
		alert("密码不能为空!");
		return false;
	}
	if(form1.mima2.value!=form1.mima1.value)
	{
		alert("两次输入的密码不一致!");
		return false;
	}
	return true;
}
</script>
</head>

<body   background="../images/back.gif">
<center>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    <tr>
      <td  height="=100"><img src="../images/banner.jpg" width="800" height="100"></td>
    </tr>
    <tr>
      <td><table width="800" border="0" cellspacing="1" cellpadding="0">
         <tr align="center" bgcolor="#33CCFF">
          <td width="72" background="../images/top.jpg"><a href="../index.jsp">首页</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/jxdw.jsp">教学队伍</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/kcjs.jsp">课程介绍</a></td>
	  <td width="73" background="../images/top.jpg"><a href="../pages/jsdw.jsp">教师队伍</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/jxdg.jsp">教学大纲</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/ckwx.jsp">参考文献</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/ltxt.jsp">在线测试</a></td>
          <td width="73" background="../images/top.jpg"><a href="../ywbd/index.jsp">问题交流</a></td>          
          <td width="73" background="../images/top.jpg"><a href="../pages/dzkj.jsp">辅导资料</a></td>
          <td width="72" background="../images/top.jpg"><a href="../pages/shiyan.jsp">实验指导</a></td>
        </tr>
      </table></td>
    </tr>
	  <tr>
      <td>
	  <FORM name="form1" METHOD=POST ACTION="registor.jsp" onSubmit="return check();">
	  
	  <TABLE align="center">     
      <TR>
      	<TD align="right"> <span class="style4" >用户名：</span></TD>
      	<TD><INPUT TYPE="text" NAME="username" size=20 maxlength=8><font color="red">*</font></TD>
      </TR>
      
	   <TR>
      	<TD align="right"> <span class="style4">密码：</span></TD>
      	<TD><INPUT TYPE="password" NAME="mima1" size=20 maxlength=16><font color="red">*</font></TD>
      </TR> <TR>
      	<TD align="right"><span class="style4">再次输入密码：</span></TD>
      	<TD><INPUT TYPE="password" NAME="mima2" size=20 maxlength=16><font color="red">*</font></TD>
      </TR>
      <TR>
      	<TD colspan=2 align="right"><INPUT TYPE="submit" value="确定"><INPUT TYPE="reset" value="重填"></TD>
      	
      </TR>
      </TABLE></FORM>
	  </td>
    </tr>
    <tr>
      <td><%@include file="bottom.jsp" %></td>
    </tr>
  </table>
</center>
</body>
</html>
