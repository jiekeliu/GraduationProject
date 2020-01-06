<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>软件工程精品课程网站——攀枝花学院</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<center>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue">

   <tr>
      <td><table width="800" border="0" cellspacing="1" cellpadding="0">
        <tr bgcolor="#D2C8F7">
        <td><a href="index.jsp">返回管理首页</a>  <a href="newslist.jsp">新闻公告列表</a>   <a href="new_news.jsp">增加新闻公告</a></td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" bgcolor="lightblue">
   <%
		request.setCharacterEncoding("GBK");
		int id=Integer.parseInt(request.getParameter("newsID"));
		String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('您无权查看该信息！');location.href='login.htm';</Script>");
		}
	%>  </td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
       
		 <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>          

	  <jsp:useBean id="news_view" scope="page" class="aaa.DBOperate_news"/>
	  <%
		  String author="",date="",newsID="",title="",content="",update_date="";
		 
		  ResultSet rs=news_view.viewNews(id);
		  if (rs.next())
		  {
			  newsID=rs.getString("newsID");
			   title=rs.getString("title");
			   content=rs.getString("content");
			   author=rs.getString("author");
			    update_date=rs.getString("update_date"); 
				date =rs.getString("date");	      
			
		  %>
           <td  colspan="4" scope="col"><H3 align="center"><%=title%> </H3>
		 <p> <span class="style5"> <%=content%></span></p>
		 <p align="right"><span class="style5"> <%if (!update_date.equals(""))out.print("(该新闻于"+update_date+"再次编辑)");%></span></p>
		<p align="right"><span class="style5">   <%=author%> &nbsp;&nbsp; <%=date%></span></p>
		
		
			  
			<p align=right>  <a href="delete_news.jsp?wentiID=<%=newsID%>">删除</a></p>
	 
		   </td>           
          </tr>
		  <% }
		  news_view.closeCon();
	  %>
      </table>
	</td>
    </tr>

  </table>

</center>
</body>
</html>
