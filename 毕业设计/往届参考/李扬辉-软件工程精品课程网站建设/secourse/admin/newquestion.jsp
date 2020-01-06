<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
<title>软件工程精品课程网站——攀枝花学院</title><link href="../css/style.css" rel="stylesheet">
		<script language="javascript">
function check()
{
    if(form1.content.value=="")
	{
		alert("题目描述不能为空!");
		return false;
	}
	 if(form1.daan.value=="")
	{
		alert("标准答案不能为空!");
		return false;
	}
	return true;
}
</script>


	</head>

	<body>

		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				bordercolor="blue">

				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr>
								<td bgcolor="#D2C8F7">
									<a href="index.jsp">返回管理首页</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="lightblue">
						<%
							String name = (String) session.getAttribute("admin");
							if (name == null || name.equals("")) {
								out
										.print("<Script Language=Javascript>window.alert('您无权查看该信息！');location.href='login.htm';</Script>");
							}
						%>
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
						<FORM name="form1" METHOD=POST ACTION="addquestion.jsp"
							onSubmit="return check();">
							<TABLE width=800>
								<TR>
									<TD align="center">
										<font size="1">所属章节：</font>
										<SELECT NAME="zhangjie">
											<option value=1 selected>绪论</option>				
				<option value=2>可行性研究</option>
				<option value=3>需求分析</option>
				<option value=4>形式化说明技术</option>
				<option value=5>总体设计</option>
				<option value=6>详细设计</option>
				<option value=7>实现</option>
				<option value=8>维护</option>
				<option value=9>面向对象方法学引论</option>
				<option value=10>面向对象分析</option>
				<option value=11>面向对象设计</option>
				<option value=12>面向对象实现</option>
				<option value=13>软件项目管理</option>
										</SELECT>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">题目描述：</font>
										<TEXTAREA NAME="content" ROWS="10" COLS="80"></TEXTAREA>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">题目类型：</font>
										<SELECT NAME="type">
											<option value=1 selected>
												单项选择
											</option>
											<option value=2>
												多项项选择
											</option>
										</SELECT>
									</TD>
								</TR>
								<TR>
									<TD align="center">
										<font size="1">标准答案：</font>
										<INPUT TYPE="text" NAME="daan" size="6" maxlength=4>
										（请按顺序填写）
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
