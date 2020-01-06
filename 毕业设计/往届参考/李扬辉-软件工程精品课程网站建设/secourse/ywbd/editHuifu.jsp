<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程---攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">
<script language="javascript">
function check()
{
    if(form1.title.value=="")
	{
		alert("标题不能为空!");
		return false;
	}
	if(form1.content.value=="")
	{
		alert("内容不能为空!");
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
			out.print("<Script Language=Javascript>window.alert('还未登录，无权查看该信息！');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("欢迎您,"+name+"  <a href=../userinfo/logout.jsp>退出登录</a>  <a href=../userinfo/newMima.jsp>修改密码</a> <a href=../userinfo/newUserName.jsp>修改用户名</a>  <a href=newwenti.jsp>提出问题</a>  <a href=index.jsp>问题交流首页</a> ");
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
				<TD align="center"><font size="1">回复内容：</font><TEXTAREA NAME="content" ROWS="10" COLS="80"><%=content%></TEXTAREA></TD>
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



