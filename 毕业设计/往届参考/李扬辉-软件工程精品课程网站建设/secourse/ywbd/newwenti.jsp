<%@ page import="java.sql.*" contentType="text/html;charset=GB2312" errorPage="err.jsp"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>
		<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
function check()
{
    if(form1.title.value=="")
	{
		alert("���ⲻ��Ϊ��!");
		return false;
	}
	if(form1.content.value=="")
	{
		alert("���ݲ���Ϊ��!");
		return false;
	}
	return true;
}
</script>


</head>

<body  background="../images/back.gif">

<center>
	<%@include file="top.jsp" %>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    
	 <tr  background="../images/back.gif">
      <td valign="top" > <jsp:include page="../userinfo/user_info.jsp" flush="true"/>
	   </td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
        
		        <p>&nbsp;</p>
			<FORM name="form1" METHOD=POST ACTION="addwenti.jsp" onSubmit="return check();">
			<TABLE width=800>
			
			<TR>
				<TD align="center"><font size="1">������⣺</font><INPUT TYPE="text" NAME="title" size="80" maxlength=25></TD>
			</TR>
			
			<TR>
				<TD align="center"><font size="1">����������</font><TEXTAREA NAME="content" ROWS="10" COLS="80" ></TEXTAREA></TD>
			</TR>
			<TR>
				<TD align="center"><INPUT TYPE="submit" value="�ύ"><INPUT TYPE="reset"  value="���"></TD>
			</TR>
			</TABLE>
			</FORM>
	</td>
    </tr>
  </table>
</center>
</body>
</html>
