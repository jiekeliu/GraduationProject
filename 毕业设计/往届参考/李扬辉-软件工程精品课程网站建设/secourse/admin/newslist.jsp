<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>������̾�Ʒ�γ���վ������֦��ѧԺ</title>
		<link href="../css/style.css" rel="stylesheet">

</head>

<body>

<center>
  <table width="800"  border="0" cellpadding="0" cellspacing="0" bordercolor="lightblue">
    <tr>
      <td><table width="800" border="0" cellspacing="1" cellpadding="0">
        <tr><td bgcolor="#D2C8F7">&nbsp;  <a href="new_news.jsp">�������Ź���</a></td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" bgcolor="#84C1FF">
	  <%
		request.setCharacterEncoding("GBK");
		String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('����Ȩ�鿴����Ϣ��');parent.location.href='login.htm';</Script>");
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
						<font size="+1" face="����,����" color="red">�������</font>
						<br/>							
						</p>
						<br/>
        </td>
        </tr>		
          <tr bgcolor="#84C1FF">
            <th width="400" scope="col"><span class="style5">���ű���</span></th>
            <th width="150" scope="col"><span class="style5">������</span></th>            
            <th width="200" scope="col"><span class="style5">����ʱ��</span></th>
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
				<td><a href="delete_news.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">ɾ��</td>
			  </tr>
			   
			  <% 
				 }
			  if (totalPages==1)
				{
				  %>
				    <tr><td colspan=4 bgcolor="#97CBFF" align="right"><font size=1>��ҳ      βҳ   ��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>���� ÿҳ��ʾ<%=per%>��</font></td></tr>
				  <%
				}
				else
				{
			  %>
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><font size=1>��ҳ</font>  <a href="newslist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>����</font>   <font size=1>��һҳ</font>   <a href="newslist.jsp?pageNO=<%=nowPage+1%>">��һҳ</a> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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
				<td><a href="delete_wenti.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">ɾ��</td>
			  </tr>
			   
			  <% 
		  }
			  %>
			  <tr><td colspan=4 bgcolor="#97CBFF" align="right"><a href="newslist.jsp?pageNO=1">��ҳ</a>  <a href="newslist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>����</font>   <a href="newslist.jsp?pageNO=<%=nowPage-1%>">��һҳ</a>   <font size=1>��һҳ</font> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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
				<td><a href="delete_wenti.jsp?newsID=<%=newsID%>&pageNO=<%=nowPage%>">ɾ��</td>
			  </tr>
			  <% 
		  } %>
			  <tr><td colspan=3 bgcolor="#97CBFF" align="right"><a href="newslist.jsp?pageNO=1">��ҳ</a>  <a href="newslist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>����</font>   <a href="newslist.jsp?pageNO=<%=nowPage-1%>">��һҳ</a>   <a href="newslist.jsp?pageNO=<%=nowPage+1%>">��һҳ</a> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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

	