<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>������̾�Ʒ�γ���վ������֦��ѧԺ</title>
<style type="text/css">
<!--
body {
	margin-top: 1px;
	margin-bottom: 0px;
}
a:link {
	font-size: 14px;
	color: #339900;
	text-decoration: none;
}
a:hover {
	font-size: 14px;
	color: #000000;
	text-decoration: none;
}
a:visited {
	font-size: 14px;
	color: #339900;
	text-decoration: none;
}
.style4 {font-size: 13px; }
.style5 {font-size: 14px}
-->
</style>

</head>

<body  background="../images/back.gif">

<center>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    
   <tr>
      <td><table width="800" border="0" cellspacing="1" cellpadding="0">
        <tr><td><a href="index.jsp">���ع�����ҳ</a>  <a href="wentilist.jsp">�����б�</a></td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" background="../images/back.gif">
   <%
		request.setCharacterEncoding("GBK");
		int id=Integer.parseInt(request.getParameter("wentiID"));
		String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('����Ȩ�鿴����Ϣ��');location.href='login.htm';</Script>");
		}
	%>  </td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
       
		 <table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#A8A8A8">
          <tr>          

	  <jsp:useBean id="wenti_view" scope="page" class="aaa.DBOperate_wenti"/>
	  <%
		  String username="",date="",wentiID="",wentiTitle="",wentiContent="",editdate="";
		 
		  ResultSet rs=wenti_view.viewWenti(id);
		  if (rs.next())
		  {
			  wentiID=rs.getString("wentiID");
			    username=rs.getString("username");
			   date =rs.getString("date");
			   wentiTitle=rs.getString("wentiTitle");
			   wentiContent=rs.getString("wentiContent");
			   editdate=rs.getString("editdate");
		  %>
           <td  colspan="4" scope="col"><H3 align="center"><%=wentiTitle%> </H3>
		 <p> <span class="style5"> <%=wentiContent%></span></p>
		 <p align="right"><span class="style5"> <%if (!editdate.equals(""))out.print("(��������"+editdate+"�ٴα༭)");%></span></p>
		<p align="right"><span class="style5">   <%=username%> &nbsp;&nbsp; <%=date%></span></p>
		
		
			  
			<p align=right><a href="deletewenti.jsp?wentiID=<%=wentiID%>">ɾ��</a></p>
	 
		   </td>           
          </tr>
		  <% }
		  wenti_view.closeCon();
	  %>
      <%
		  String huifuContent,huifuID,modifydate;		
		  ResultSet rst=wenti_view.ListHuifu(id);
		  while (rst.next())
		  {
			  huifuID=rst.getString("huifuID");
			   username=rst.getString("username");
			    huifuContent=rst.getString("huifuContent");
			   date =rst.getString("date");	   
			  modifydate=rst.getString("editdate");
		  %>
		  <tr>
           <td  width="200" scope="col"><span class="style5">�ظ��ˣ�</span></td>
		   <td width="200"><span class="style5"><%=username%></span></td> 
		   <td width="200 scope="col"><span class="style5">�ظ�ʱ�䣺</span></td>
		   <td width="200"><span class="style5"><%=date%></span></td> 
          </tr>
		  <tr>
		  <td colspan=4><span class="style5"><%=huifuContent%></span><br>
		  <p align="right"><span class="style5"> <%if (!modifydate.equals(""))out.print("(�ûظ���"+modifydate+"�ٴα༭)");%></span></p>
		 	<p align=right><a href="deletehuifu.jsp?huifuID=<%=huifuID%>&wentiID=<%=wentiID%>">ɾ��</a></p></td> 
		  </tr>
		  <% }
		  wenti_view.closeCon();
	  %>
	  </table>  
            <p>&nbsp;</p>
	</td>
    </tr>
    
  </table>
</center>
</body>
</html>
