<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
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
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue">
	 <tr>
      <td valign="top">
	   <%
	   request.setCharacterEncoding("GBK");
	   String huifuID=request.getParameter("huifuID");
       
	    String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('��δ��¼����Ȩ�鿴����Ϣ��');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("��ӭ��,"+name+"  <a href=../userinfo/logout.jsp>�˳���¼</a>  <a href=../userinfo/newMima.jsp>�޸�����</a> <a href=../userinfo/newUserName.jsp>�޸��û���</a>  <a href=newwenti.jsp>�������</a>  <a href=index.jsp>���⽻����ҳ</a> ");
	%></td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
        <FORM name="form1" METHOD=POST ACTION="updateHuifu.jsp" onSubmit="return check();">
		<INPUT TYPE="hidden" name="huifuID" value="<%=huifuID%>"> 
		 <TABLE width=800>
        	 <jsp:useBean id="huifu_" scope="page" class="aaa.DBOperate_wenti"/>
        	 
        	

	<%
ResultSet rs;
String content="";
if (huifuID!=null && !huifuID.equals(""))
{   
	
	rs=huifu_.viewHuifu(Integer.parseInt(huifuID));
	if (rs.next())
	{
		content=rs.getString("huifuContent");
	
	}
	huifu_.closeCon();
}

%>		

			
			<TR>
				<TD align="center"><font size="1">�ظ����ݣ�</font><TEXTAREA NAME="content" ROWS="10" COLS="80"><%=content%></TEXTAREA></TD>
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



