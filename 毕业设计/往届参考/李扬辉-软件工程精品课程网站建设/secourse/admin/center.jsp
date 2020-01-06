<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<!-- 
<object type="application/x-oleobject" id=closes classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11">
<param name="command" value="close">
</object> 
-->
<script language="javascript">
function myclose(){
window.close();
}
</script>
<table width="239"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="211" height="231" align="center" class="head">后台管理</td>
	<%
		if(session.getAttribute("admin")==null){
			out.println("<script language='javaScript'>alert('警告！未成功登录');newurl=open('login.htm','_parent');</script>");
		}
	%>
  </tr>
</table>
</body>
</html>
