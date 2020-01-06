<%@ page import="java.sql.*" contentType="text/html;charset=GB2312"
	errorPage="err.jsp"%>
<html>
	<head>
<title>软件工程精品课程--攀枝花学院</title>
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
		alert("正文不能为空!");
		return false;
	}
	return true;
}
</script>
	</head>
	<body>
		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				class="tableborder">
				
				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr>
								<td bgcolor="#D2C8F7">
									<a href="index.jsp">返回管理首页</a>
									<a href="new_news.jsp">增加新闻公告</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="500">
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>
						<FORM name="form1" METHOD=POST ACTION="addnews.jsp"
							onSubmit="return check();">
							<TABLE width=800>

								<TR>
									<TD align="center">
										<font size="2">新闻标题：</font>
										<INPUT TYPE="text" NAME="title" size="80" maxlength=25>
									</TD>
								</TR>

								<TR>
									<TD align="center">
										<font size="2">正文描述：</font>
										<TEXTAREA NAME="content" ROWS="20" COLS="80"></TEXTAREA>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<INPUT TYPE="submit" value="提交">
										<INPUT TYPE="reset" value="清空">
									</TD>
								</TR>
							</TABLE>
						</FORM>
					</td>
				</tr>
				
			</table>
		</center>
	</body>
</html>
