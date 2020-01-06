<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
	<head>
		<title>课件管理</title>
		<link href="../css/style.css" rel="stylesheet">
			  <%
		request.setCharacterEncoding("GB2312");
		String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('您无权查看该信息！');parent.location.href='login.htm';</Script>");
		}
	%>
	</head>

	<body>
		<center>
			<table width="800" border="0" bordercolor="lightblue">
				
				<tr>
					<td  bgcolor="#D2C8F7">
						&nbsp;
					</td>
				</tr>
				 <tr>
        <td align="center" colspan="4">
        <p>
						<br/>
						<font size="+1" face="楷体,黑体" color="red">课件管理</font>
						<br/>							
						</p>
						<br/>
        </td>
        </tr>		
				<tr>
					<td>
						<%@include file="uploadfile.jsp"%>
					</td>
				</tr>
				<tr>
					<td><%@include file="file.jsp"%></td>
				</tr>
			</table>
		</center>
	</body>
</html>
