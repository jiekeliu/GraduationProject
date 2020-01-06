<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程---攀枝花学院</title>
		<link href="../css/style.css" rel="stylesheet">

</head>

<body   background="../images/back.gif">

<center>
	<%@include file="top.jsp" %>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    
	 <tr>
      <td valign="top"  background="../images/back.gif">
	   <%
	    int id=Integer.parseInt(request.getParameter("wentiID"));
		String name=(String) session.getAttribute("userName"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('还未登录，无权回复该信息！');location.href='../index.jsp';</Script>");
		}
		else  
			out.print("欢迎您,"+name+"  <a href=../userinfo/logout.jsp>退出登录</a> <a href=../userinfo/newMima.jsp>修改密码</a> <a href=../userinfo/newUserName.jsp>修改用户名</a>  <a href=newwenti.jsp>提出问题</a>   "+
			"<a href=huifuwenti.jsp?wentiID="+id+">答复该问题</a>     <a href=index.jsp>问题交流首页</a>");
	%></td>
    </tr>
	  <tr>
      <td height="500"><p>&nbsp;</p>
        
		 <table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#A8A8A8">
          <tr>          

	  <jsp:useBean id="view" scope="page" class="aaa.DBOperate_wenti"/>
	  <%
		  String username,date,wentiTitle="",wentiContent="";
		 
		  ResultSet rs=view.viewWenti(id);
		  if (rs.next())
		  {
			  
			   username=rs.getString("username");
			   date =rs.getString("date");
			   wentiTitle=rs.getString("wentiTitle");
			   wentiContent=rs.getString("wentiContent");
		  %>
           <td  colspan="4" scope="col"><p align="center"><span class="style5"><%=wentiTitle%></span> </p>
		 <p> <span class="style5"> <%=wentiContent%></span></p>
		<p align="right"><span class="style5">   <%=username%> &nbsp;&nbsp; <%=date%></span></p>
		   </td>           
          </tr>
		  <% }
		  view.closeCon();
	  %>      
	  </table>
            <p>&nbsp;</p>
			<FORM METHOD=POST ACTION="addhuifu.jsp?wentiID=<%=id%>">
			<TABLE width=800>
			<TR>
				<TD align="center"><TEXTAREA NAME="huifuContent" ROWS="10" COLS="80"></TEXTAREA></TD>
			</TR>
			<TR>
				<TD align="center"><INPUT TYPE="submit" value="提交"><INPUT TYPE="reset"  value="清空"></TD>
			</TR>
			</TABLE>
			</FORM>
	</td>
    </tr>
    
  </table>
</center>
</body>
</html>
