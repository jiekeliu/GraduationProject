<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程网站——攀枝花学院</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<center>
  <table width="800"  border="0" cellpadding="0" cellspacing="0" bordercolor="lightblue">
    
     <tr><td  bgcolor="#D2C8F7">&nbsp;</td></tr>
     <tr>
     <td align = "center">
     						<p>
						<br/>
						<font size="+1" face="楷体,黑体" color="red">用户管理</font>							
						</p>
     </td>
     </tr>
	 <tr>
      <td valign="top" bgcolor="">
	  <%
		request.setCharacterEncoding("GBK");
		String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('您无权查看该信息！');parent.location.href='login.htm';</Script>");
		}
	%>	
</td>
    </tr>
	  <tr>
      <td height="500" valign="top" align="center"><p>&nbsp;</p>
        <table width="500" border="0" cellspacing="1" cellpadding="0" >
          <tr bgcolor="#97CBFF">
            <th width="200" scope="col"><span class="style5">userID</span></th>
            <th width="200" scope="col"><span class="style5">用户名</span></th>              
			 <th  scope="col">&nbsp;</th>
          </tr>
		  <jsp:useBean id="listuser" scope="page" class="aaa.DBOperate_userinfo"/>
	  <%
		  String userID,username;
	      String NO=request.getParameter("pageNO");
		  int nowPage;
		  if (NO==null )
			  nowPage=1;
		  else
		     nowPage=Integer.parseInt(NO);
		  final int per=20;
		  int totalPages;
		  int i=per;
		  ResultSet rs=listuser.listInfo();

			rs.last();
			int totalRows=rs.getRow();
			rs.absolute(-totalRows-1);
			if (totalRows<=per)
			   totalPages=1;
			else
				totalPages=totalRows/per+1;
			
			if (nowPage<=1)
			{
				nowPage=1;
				while( rs.next() && i>0)
		  {
			  	  userID=rs.getString("userID");
				   username=rs.getString("username");
				   
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><span class="style4"><%=userID %></span></td>
				<td><span class="style4"><%=username%></span></td>
				
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">删除</td>
			  </tr>
			   
			    <% 
				 }
			  if (totalPages==1)
				{
				  %>
				    <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><font size=1>首页      尾页   当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条） 每页显示<%=per%>条</font></td></tr>
				  <%
				}
				else
				{
			  %>
			  <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><font size=1>首页</font>  <a href="userlist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页</font>   <font size=1>上一页</font>   <a href="userlist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%}}
			else  if (nowPage>=totalPages)
			{
				nowPage=totalPages;
				if (nowPage>1)
					rs.absolute((nowPage-1)*per);
				while( rs.next() && i>0)
		  {
			  	  userID=rs.getString("userID");
				   username=rs.getString("username");
				   
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><span class="style4"><%=userID%></span></td>
				<td><span class="style4"><%=username%></span></td>
			
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">删除</td>
			  </tr>
			   
			  <% 
		  }
			  %>
			  <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><a href="userlist.jsp?pageNO=1">首页</a>  <a href="userlist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页</font>   <a href="userlist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <font size=1>下一页</font> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%}
			  else{
		  rs.absolute((nowPage-1)*per);
		  while( rs.next() && i>0)
		  {
			  	  
			  	  userID=rs.getString("userID");
				   username=rs.getString("username");
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><span class="style4"><%=userID%></span></td>
				<td><span class="style4"><%=username%></span></td>
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">删除</td>
			  </tr>
			  <% 
		  } %>
			  <tr><td colspan=3 bgcolor="#ACD6FF" align="right"><a href="userlist.jsp?pageNO=1">首页</a>  <a href="userlist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页</font>   <a href="userlist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <a href="userlist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%
			}
		  listuser.closeCon();
	  %>
	 
        </table>        <p>&nbsp;</p></td>
    </tr>
   
  </table>
</center>
</body>
</html>

	




