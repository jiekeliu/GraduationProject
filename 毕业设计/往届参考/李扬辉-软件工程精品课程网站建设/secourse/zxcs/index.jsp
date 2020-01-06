<%@ page import="java.sql.*" contentType="text/html;charset=GBK"
	errorPage="err.jsp"%>
<html>
	<head>
		<title>软件工程精品课程---攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">
	</head>

	<body background="../images/back.gif">

		<center>
			<table width="800" border="1" cellpadding="0" cellspacing="0"
				bordercolor="lightblue" bgcolor="#FFFFFF">
				<tr>
					<td height="100">
						<img src="../images/banner.jpg" width="800" height="100">
					</td>
				</tr>
				<tr>
					<td>
						<table width="800" border="0" cellspacing="1" cellpadding="0">
							<tr align="center" bgcolor="lightblue">
								<td width="72" background="../images/top.jpg">
									<a href="../index.jsp"><font size="+1" face="楷体_GB2312,黑体" >首&nbsp;&nbsp;页</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdw.jsp"><font size="+1" face="楷体_GB2312,黑体" >教学队伍</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/kcjs.jsp"><font size="+1" face="楷体_GB2312,黑体" >课程介绍</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/jxdg.jsp"><font size="+1" face="楷体_GB2312,黑体" >教学大纲</font></a>
								</td>
								<td width="73" background="../images/top.jpg">
									<a href="../pages/ckwx.jsp"><font size="+1" face="楷体_GB2312,黑体" >参考文献</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../zxcs/index.jsp"><font size="+1" face="楷体_GB2312,黑体" >在线测试</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../ywbd/index.jsp"><font size="+1" face="楷体_GB2312,黑体" >问题交流</font></a>
								</td>
								<td width="73"  background="../images/top.jpg">
									<a href="../pages/dzkj.jsp"><font size="+1" face="楷体_GB2312,黑体" >辅导资料</font></a>
								</td>
								<td width="72"  background="../images/top.jpg">
									<a href="../pages/shiyan.jsp"><font size="+1" face="楷体_GB2312,黑体" >实验指导</font></a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" background="../images/back.gif">
						<jsp:include page="../userinfo/user_info.jsp" flush="true" />
					</td>
				</tr>
				<tr>
					<td height="300" valign="top">
						<p>
							&nbsp;
						</p>
						<TABLE align="center">
							<TR>
								<TD>
									请选择章节：
								</TD>
							</TR>
							<TR>
								<TD>
									<FORM name="form1" METHOD=POST ACTION="test.jsp">

										<SELECT NAME="zhangjie">
											<option value=1 selected>
												绪论
											</option>
											<option value=2>
												可行性研究
											</option>
											<option value=3>
												需求分析
											</option>
											<option value=4>
												形式化说明技术
											</option>
											<option value=5>
												总体设计
											</option>
											<option value=6>
												详细设计
											</option>
											<option value=7>
												实现
											</option>
											<option value=8>
												维护
											
											</option>
										</SELECT>
										<INPUT TYPE="submit" value="进入测试">
									</form>
								</td>
							</TR>
						</TABLE>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

