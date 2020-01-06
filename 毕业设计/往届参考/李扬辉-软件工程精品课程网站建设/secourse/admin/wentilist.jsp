<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程网站——攀枝花学院</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<center>
  <table width="800"  border="0" cellpadding="0" cellspacing="0" bordercolor="lightblue">
    
    <tr>
      <td><table width="800" border="0" cellspacing="1" cellpadding="0">
        <tr><td bgcolor=#D2C8F7>&nbsp;</td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" bgcolor="#97CBFF">
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
      <td height="500" valign="top"><p>&nbsp;</p>
        <table width="800" border="0" cellspacing="1" cellpadding="0">
        <tr>
        <td align="center" colspan="4">
        <p>
						<br/>
						<font size="+1" face="楷体,黑体" color="red">问答管理</font>
						<br/>							
						</p>
						<br/>
        </td>
        </tr>						
						
          <tr bgcolor="#84C1FF">
            <th width="400" scope="col"><span class="style5">问题标题</span></th>
            <th width="150" scope="col"><span class="style5">提问者</span></th>            
            <th width="200" scope="col"><span class="style5">提问时间</span></th>
			 <th  scope="col">&nbsp;</th>
          </tr>
		  <jsp:useBean id="listwenti" scope="page" class="aaa.DBOperate_wenti"/>
	  <%
		  String wentiID,username,date,wentiTitle;
	      String NO=request.getParameter("pageNO");
		  int nowPage;
		  if (NO==null)
			  nowPage=1;
		  else
		     nowPage=Integer.parseInt(NO);
		  final int per=20;
		  int totalPages;
		  int i=per;
		  ResultSet rs=listwenti.ListWenti();

			rs.last();
			int totalRows=rs.getRow();
			rs.absolute(-totalRows-1);
			if (totalRows<=per)
			   totalPages=1;
			else
				totalPages=totalRows/per+1;
			
			
			if (nowPage<=1 )
			{
				nowPage=1;
				while( rs.next() && i>0)
				 {
			  	  wentiID=rs.getString("wentiID");
				   username=rs.getString("username");
				   date =rs.getString("date");
				   wentiTitle=rs.getString("wentiTitle");
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle %></a></td>
				<td><span class="style4"><%=username%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="deletewenti.jsp?wentiID=<%=wentiID%>&pageNO=<%=nowPage%>">删除</td>
			  </tr>
			   
			  <% 
				 }
			  if (totalPages==1)
				{
				  %>
				    <tr><td colspan=4 bgcolor="#97CBFF" align="right"><font size=1>首页      尾页   当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条） 每页显示<%=per%>条</font></td></tr>
				  <%
				}
				else
				{
			  %>
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><font size=1>首页</font>  <a href="wentilist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <font size=1>上一页</font>   <a href="wentilist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<% }
				  }
			else  if (nowPage>=totalPages)
			{
				nowPage=totalPages;
				if (nowPage>1)
					rs.absolute((nowPage-1)*per);
				while( rs.next() && i>0)
		  {
			  	  wentiID=rs.getString("wentiID");
				   username=rs.getString("username");
				   date =rs.getString("date");
				   wentiTitle=rs.getString("wentiTitle");
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle %></a></td>
				<td><span class="style4"><%=username%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="deletewenti.jsp?wentiID=<%=wentiID%>&pageNO=<%=nowPage%>">删除</td>
			  </tr>
			   
			  <% 
		  }
			  %>
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><a href="wentilist.jsp?pageNO=1">首页</a>  <a href="wentilist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <a href="wentilist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <font size=1>下一页</font> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%}
			  else{
		  rs.absolute((nowPage-1)*per);
		  while( rs.next() && i>0)
		  {
			  	  wentiID=rs.getString("wentiID");
				   username=rs.getString("username");
				   date =rs.getString("date");
				   wentiTitle=rs.getString("wentiTitle");
				  i--;
			  %>
			  <tr bgcolor="#D2E9FF">
				<td><a href="wentiview.jsp?wentiID=<%=wentiID%>"><%=wentiTitle %></a></td>
				<td><span class="style4"><%=username%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="deletewenti.jsp?wentiID=<%=wentiID%>&pageNO=<%=nowPage%>">删除</td>
			  </tr>
			  <% 
		  } %>
			  <tr><td colspan=3 bgcolor=#97CBFF align="right"><a href="wentilist.jsp?pageNO=1">首页</a>  <a href="wentlist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <a href="wentilist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <a href="wentilist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%
			}
		  listwenti.closeCon();
	  %>
	 
        </table>        <p>&nbsp;</p></td>
    </tr>
    
  </table>
</center>
</body>
</html>

	