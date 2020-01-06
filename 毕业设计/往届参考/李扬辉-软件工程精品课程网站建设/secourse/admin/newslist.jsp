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
        <tr><td bgcolor="#D2C8F7">&nbsp;  <a href="new_news.jsp">增加新闻公告</a></td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" bgcolor="#84C1FF">
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
						<font size="+1" face="楷体,黑体" color="red">公告管理</font>
						<br/>							
						</p>
						<br/>
        </td>
        </tr>		
          <tr bgcolor="#84C1FF">
            <th width="400" scope="col"><span class="style5">新闻标题</span></th>
            <th width="150" scope="col"><span class="style5">发布者</span></th>            
            <th width="200" scope="col"><span class="style5">发布时间</span></th>
			 <th  scope="col">&nbsp;</th>
          </tr>
		  <jsp:useBean id="listnews" scope="page" class="aaa.DBOperate_news"/>
	  <%
		  String newsID,author,date,title;
	      String NO=request.getParameter("pageNO");
		  int nowPage;
		  if (NO==null)
			  nowPage=1;
		  else
		     nowPage=Integer.parseInt(NO);
		  final int per=20;
		  int totalPages;
		  int i=per;
		  ResultSet rs=listnews.Listnews();

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
			  	  newsID=rs.getString("newsID");
				  title=rs.getString("title");
				  author=rs.getString("author");				   
				   date =rs.getString("date");
				   
				  i--;
			  %>
			  <tr bgcolor="#ECF5FF">
				<td><a href="newsview.jsp?newsID=<%=newsID%>"><%=title %></a></td>
				<td><span class="style4"><%=author%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="delete_news.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">删除</td>
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
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><font size=1>首页</font>  <a href="newslist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <font size=1>上一页</font>   <a href="newslist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<% }
				  }
			else  if (nowPage>=totalPages)
			{
				nowPage=totalPages;
				if (nowPage>1)
					rs.absolute((nowPage-1)*per);
				while( rs.next() && i>0)
		  {
			  	   newsID=rs.getString("newsID");
				  title=rs.getString("title");
				  author=rs.getString("author");				   
				   date =rs.getString("date");
				  i--;
			  %>
			  <tr bgcolor="#ECF5FF">
				<td><a href="newsview.jsp?newsID=<%=newsID%>"><%=title %></a></td>
				<td><span class="style4"><%=author%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="delete_wenti.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">删除</td>
			  </tr>
			   
			  <% 
		  }
			  %>
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><a href="newslist.jsp?pageNO=1">首页</a>  <a href="newslist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <a href="newslist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <font size=1>下一页</font> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%}
			  else{
		  rs.absolute((nowPage-1)*per);
		  while( rs.next() && i>0)
		  {
			  	   newsID=rs.getString("newsID");
				  title=rs.getString("title");
				  author=rs.getString("author");				   
				   date =rs.getString("date");
				  i--;
			  %>
			  <tr bgcolor="#ECF5FF">
				<td><a href="newsview.jsp?newsID=<%=newsID%>"><%=title %></a></td>
				<td><span class="style4"><%=author%></span></td>
				<td><span class="style4"><%=date%></span></td>
				<td><a href="delete_wenti.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">删除</td>
			  </tr>
			  <% 
		  } %>
			  <tr><td colspan=3 bgcolor="#97CBFF" align="right"><a href="newslist.jsp?pageNO=1">首页</a>  <a href="newslist.jsp?pageNO=<%=totalPages%>">尾页</a>  <font size=1>当前第<%=nowPage%>页/共<%=totalPages%>页（<%=totalRows%>条）</font>   <a href="newslist.jsp?pageNO=<%=nowPage-1%>">上一页</a>   <a href="newslist.jsp?pageNO=<%=nowPage+1%>">下一页</a> <font size=1>每页显示<%=per%>条</font></td></tr>
			<%
			}
		  listnews.closeCon();
	  %>
	 
        </table>        <p>&nbsp;</p></td>
    </tr>
    
  </table>
</center>
</body>
</html>

	