<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>������̾�Ʒ�γ���վ������֦��ѧԺ</title>
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
						<font size="+1" face="����,����" color="red">�û�����</font>							
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
			out.print("<Script Language=Javascript>window.alert('����Ȩ�鿴����Ϣ��');parent.location.href='login.htm';</Script>");
		}
	%>	
</td>
    </tr>
	  <tr>
      <td height="500" valign="top" align="center"><p>&nbsp;</p>
        <table width="500" border="0" cellspacing="1" cellpadding="0" >
          <tr bgcolor="#97CBFF">
            <th width="200" scope="col"><span class="style5">userID</span></th>
            <th width="200" scope="col"><span class="style5">�û���</span></th>              
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
				
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">ɾ��</td>
			  </tr>
			   
			    <% 
				 }
			  if (totalPages==1)
				{
				  %>
				    <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><font size=1>��ҳ      βҳ   ��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ��<%=totalRows%>���� ÿҳ��ʾ<%=per%>��</font></td></tr>
				  <%
				}
				else
				{
			  %>
			  <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><font size=1>��ҳ</font>  <a href="userlist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ</font>   <font size=1>��һҳ</font>   <a href="userlist.jsp?pageNO=<%=nowPage+1%>">��һҳ</a> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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
			
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">ɾ��</td>
			  </tr>
			   
			  <% 
		  }
			  %>
			  <tr><td colspan=4 bgcolor="#ACD6FF" align="right"><a href="userlist.jsp?pageNO=1">��ҳ</a>  <a href="userlist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ</font>   <a href="userlist.jsp?pageNO=<%=nowPage-1%>">��һҳ</a>   <font size=1>��һҳ</font> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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
				<td><a href="deleteuser.jsp?username=<%=username%>&nowPage=<%=nowPage%>">ɾ��</td>
			  </tr>
			  <% 
		  } %>
			  <tr><td colspan=3 bgcolor="#ACD6FF" align="right"><a href="userlist.jsp?pageNO=1">��ҳ</a>  <a href="userlist.jsp?pageNO=<%=totalPages%>">βҳ</a>  <font size=1>��ǰ��<%=nowPage%>ҳ/��<%=totalPages%>ҳ</font>   <a href="userlist.jsp?pageNO=<%=nowPage-1%>">��һҳ</a>   <a href="userlist.jsp?pageNO=<%=nowPage+1%>">��һҳ</a> <font size=1>ÿҳ��ʾ<%=per%>��</font></td></tr>
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

	




