
<%@ page contentType="text/html;charset=gb2312" errorPage="err.jsp"
	import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>软件工程精品课程---攀枝花学院</title>
		<style type="text/css">
<!--
body {
	margin-top: 1px;
	margin-bottom: 0px;
}

a:link {
	font-size: 14px;
	color: #A1A1A1;
	text-decoration: none;
}

a:hover {
	font-size: 14px;
	color: #CCCCCC;
	text-decoration: none;
}

a:visited {
	font-size: 14px;
	color: #528828;
	text-decoration: none;
}

.style2 {
	font-size: 14px
}

.style3 {
	font-size: 12px
}

.style4 {
	font-size: 13px;
}
-->
</style>
	</head>

	<body background="images/back.gif">

		<center>
			<table width="800" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
				<tr>
					<td colspan="2" height="=150">
						<img src="images/banner.jpg" width="800" height="100">
					</td>
				</tr>
				<tr  background="images/back.gif" height="45">
					<td colspan="2">
						<%
		String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
	%>

						<FORM METHOD=POST ACTION="userinfo/login.jsp">
							<TABLE width="800">
								<TR>
									<TD width="200">
										<span class="style4">用户名</span>
										<input name="username" type="text" size="15" maxlength="12">
									</TD>
									<TD width="200">
										<span class="style4">密码</span>
										<input name="password" type="password" size="15"
											maxlength="16">
									</TD>
									<TD width="400">
										<input type="submit" name="Submit" value="登录">
										<a href="#">忘记密码</a>
										<a href="userinfo/zhuce.jsp">新用户注册</a>
									</TD>
								</TR>
							</TABLE>
						</FORM>
						<%
		}
		else  
			out.print("欢迎您,"+name+"  <a href=userinfo/logout.jsp>退出登录</a>  <a href=userinfo/newMima.jsp?userName="+name+">修改密码</a>   <a href=userinfo/newUsername.jsp>修改用户名</a> ");
	%>
					</td>
				</tr>
				<tr>
					<td width="27%" valign="top">
						<table width="100%" border="0" cellpadding="1" cellspacing="1"  bgcolor="#FFFFFF">
							<tr>
								<td height="50">
									<img src="images/pic1.gif" width="213" height="50">
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="index.jsp"> 首 页 </a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/jxdw.jsp">教学队伍</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/kcjs.jsp">课程介绍</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/jxdg.jsp">教学大纲</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/ckwx.jsp">参考文献</a>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<table width="100%%" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td height="50">
									<img src="images/pic2.gif" width="213" height="50">
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="zxcs/index.jsp">在线测试</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="ywbd/index.jsp">问题交流</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/dzkj.jsp">辅导资料</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25" bgcolor="lightblue">
									<div align="center">
										<a href="pages/shiyan.jsp">实验指导</a>
									</div>
								</td>
							</tr>
							<tr>
								<td height="25">
									<div align="center"></div>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<table>
							<tr>
								<td height="50" colspan="2" valign="top">
									<div align="center">
										<p class="font-11-title style2">
											<img src="images/a4.gif" width="580" height="50">
										</p>
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="2" valign="middle" bgcolor="#FFFFFF">
									<!--<marquee direction="left" loop="-1" onMouseOver="this.stop();" onMouseOut="this.start();" scrollamount="2">
	   <jsp:useBean id="listnews_title" scope="page" class="aaa.DBOperate_news"/>
	  <%
		  String newsID,title;
	      ResultSet rs=listnews_title.Listnews();
		  int i=3;
	while (rs.next() && i>0)
	{
		newsID=rs.getString("newsID");
		title=rs.getString("title");	
		%><a href="pages/news.jsp?newsID=<%=newsID%>" target="_blank"><%=title%></a>&nbsp;&nbsp;
		<%
			
		i--;
		}
		
	%></marquee>  -->
								</td>
							</tr>

							<tr>
								<td width="93" valign="middle" bgcolor="#FFFFFF">
									&nbsp;
								</td>
								<td width="483" valign="middle" bgcolor="#FFFFFF">
									<p>
										&nbsp;
									</p>
									<p>
										&nbsp;
									</p>

									<%		 
	       rs=listnews_title.Listnews();
		  i=10;
	while (rs.next() && i>0)
	{
		newsID=rs.getString("newsID");
		title=rs.getString("title");	
		
		i--;
	%>
									<img src="images/titleb.gif">
									<a href="pages/news.jsp?newsID=<%=newsID%>" target="_blank"><%=title%></a>
									<br>
									<%
		}
		 listnews_title.closeCon();
	%>
									<p class="style4">
									</p>
								</td>
							</tr>
						</table>
						<br>
						<table style="width: 577px; height: 168px;" width="577" height="168"  bgcolor="#FFFFFF">
							<tr>
								<td height="50" colspan="2" valign="top">
									<div align="center">
										<p class="font-11-title style2">
											
										</p>
									</div>
								<br></td>
							</tr>
							<tr>
								<td colspan="2" valign="middle" bgcolor="#FFFFFF">

								<br></td>
							</tr>
							<tr>

								<td width="483" valign="middle" bgcolor="#FFFFFF">
	
									<p>
										&nbsp;
									</p><div align="center"> 
										<p class="font-11-title style2"> 
											<img height="50" width="580" src="images/line.jpg" align="top"> 
										</p> 
									</div>
									<p class="style4">
									</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr bgcolor="#D2E9FF">
					<td colspan="2">
						<div align="center"">
							<font > Copyright &copy; 2011
								攀枝花学院计算机学院 All rights reserved. </font>
						</div>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
