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
  <table width="80%%"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    
	 <tr>
      <td valign="top"  background="../images/back.gif">
	   <%
	   request.setCharacterEncoding("GB2312");
	   String wentiID=request.getParameter("wentiID");
       
	    String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('��δ��¼����Ȩ�鿴����Ϣ��');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("��ӭ��,"+name+"  <a href=../userinfo/logout.jsp>�˳���¼</a>   <a href=../userinfo/newMima.jsp>�޸�����</a> <a href=../userinfo/newUserName.jsp>�޸��û���</a> <a href=newwenti.jsp>�������</a>    <a href=index.jsp>���⽻����ҳ</a> ");
	%></td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
        <FORM name="form1" METHOD=POST ACTION="updateWenti.jsp" onSubmit="return check();">
		<INPUT TYPE="hidden" name="wentiID" value="<%=wentiID%>">
        	 <jsp:useBean id="wenti_" scope="page" class="aaa.DBOperate_wenti"/>
	<%
ResultSet rs;
String title="",content="";
if (wentiID!=null && !wentiID.equals(""))
{   
	
	rs=wenti_.viewWenti(Integer.parseInt(wentiID));
	if (rs.next())
	{
		title=rs.getString("wentiTitle");
		content=rs.getString("wentiContent");
	}
	wenti_.closeCon();
}

%>		
		<TABLE width=800>
			
			<TR>
				<TD align="center"><font size="1">������⣺</font><INPUT TYPE="text" size="80" NAME="title" value="<%=title%>" maxlength=25></TD>
			</TR>
			
			<TR>
				<TD align="center"><font size="1">����������</font><TEXTAREA NAME="content" ROWS="10" COLS="80"><%=content%></TEXTAREA></TD>
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



