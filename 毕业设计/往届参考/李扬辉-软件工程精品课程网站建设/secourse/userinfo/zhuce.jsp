
<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>

<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
function check()
{
	s=form1.xuehao.value   
	
	if(form1.username.value=="")
	{
		alert("�û�������Ϊ��!");
		return false;
	}
	if(form1.xingming.value=="")
	{
		alert("��������Ϊ��!");
		return false;
	}
	  if(form1.mima1.value=="")
	{
		alert("���벻��Ϊ��!");
		return false;
	}
	if(form1.mima2.value!=form1.mima1.value)
	{
		alert("������������벻һ��!");
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
          <td width="72" background="../images/top.jpg"><a href="../index.jsp">��ҳ</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/jxdw.jsp">��ѧ����</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/kcjs.jsp">�γ̽���</a></td>
	  <td width="73" background="../images/top.jpg"><a href="../pages/jsdw.jsp">��ʦ����</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/jxdg.jsp">��ѧ���</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/ckwx.jsp">�ο�����</a></td>
          <td width="73" background="../images/top.jpg"><a href="../pages/ltxt.jsp">���߲���</a></td>
          <td width="73" background="../images/top.jpg"><a href="../ywbd/index.jsp">���⽻��</a></td>          
          <td width="73" background="../images/top.jpg"><a href="../pages/dzkj.jsp">��������</a></td>
          <td width="72" background="../images/top.jpg"><a href="../pages/shiyan.jsp">ʵ��ָ��</a></td>
        </tr>
      </table></td>
    </tr>
	  <tr>
      <td>
	  <FORM name="form1" METHOD=POST ACTION="registor.jsp" onSubmit="return check();">
	  
	  <TABLE align="center">     
      <TR>
      	<TD align="right"> <span class="style4" >�û�����</span></TD>
      	<TD><INPUT TYPE="text" NAME="username" size=20 maxlength=8><font color="red">*</font></TD>
      </TR>
      
	   <TR>
      	<TD align="right"> <span class="style4">���룺</span></TD>
      	<TD><INPUT TYPE="password" NAME="mima1" size=20 maxlength=16><font color="red">*</font></TD>
      </TR> <TR>
      	<TD align="right"><span class="style4">�ٴ��������룺</span></TD>
      	<TD><INPUT TYPE="password" NAME="mima2" size=20 maxlength=16><font color="red">*</font></TD>
      </TR>
      <TR>
      	<TD colspan=2 align="right"><INPUT TYPE="submit" value="ȷ��"><INPUT TYPE="reset" value="����"></TD>
      	
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
