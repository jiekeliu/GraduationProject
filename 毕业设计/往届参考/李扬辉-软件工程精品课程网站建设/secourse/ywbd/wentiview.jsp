<%@ page import="java.sql.*" contentType="text/html;charset=GBK" errorPage="err.jsp"%>
<html>
<head>
<title>������̾�Ʒ�γ�---��֦��ѧԺ</title>
		<link href="../css/style.css" rel="stylesheet">
</head>

<body  background="../images/back.gif">

<center>
	<%@include file="top.jsp" %>
  <table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="lightblue" bgcolor="#FFFFFF">
    
	 <tr>
      <td valign="top" bgcolor="#0099FF">
   <%
   String name="";
	    if (session.getAttribute("userName")==null)
		out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ�鿴����Ϣ!');location.href='../index.jsp';</Script>");
		else name=(String) session.getAttribute("userName");
		
		int id=Integer.parseInt(request.getParameter("wentiID"));
		if ( name==null || name.equals(""))
		{
			out.print("<Script Language=Javascript> window.alert('��δ��¼����Ȩ�鿴����Ϣ!');location.href='../index.jsp';</Script>");
			//out.print(name);
		}
		else  
			out.print("��ӭ��,"+name+"  <a href=../userinfo/logout.jsp>�˳���¼</a>  <a href=../userinfo/newMima.jsp>�޸�����</a> <a href=../userinfo/newUserName.jsp>�޸��û���</a>  <a href=newwenti.jsp>�������</a>       <a href=huifuwenti.jsp?wentiID="+id+">�𸴸�����</a>   <a href=index.jsp>���⽻����ҳ</a>");
	%>  </td>
    </tr>
	  <tr>
      <td height="500" valign="top"><p>&nbsp;</p>
       
		 <table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#A8A8A8">
          <tr>          

	  <jsp:useBean id="view" scope="page" class="aaa.DBOperate_wenti"/>
	  <%
		  String username="",date="",wentiID="",wentiTitle="",wentiContent="",editdate="";
		 
		  ResultSet rs=view.viewWenti(id);
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
		
		<%    //out.print(name+" "+username+" "+name.equals(username));
			  if (name.equals(username))
			  {out.print("<p align=right><a href=editWenti.jsp?wentiID="+wentiID+">�޸�</a></p>");}
	    %>
		   </td>           
          </tr>
		  <% }
		  view.closeCon();
	  %>
      <%
		  String huifuContent,huifuID,modifydate;		
		  ResultSet rst=view.ListHuifu(id);
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
		  <%
			  //out.print(name+" "+username+" "+name.equals(username));
			  if (name.equals(username))
			  { out.print("<p align=right><a href=editHuifu.jsp?huifuID="+huifuID+">�޸�</a></p>");}
	    %></td> 
		  </tr>
		  <% }
		  view.closeCon();
	  %>
	  </table>  
            <p>&nbsp;</p>
	</td>
    </tr>
  </table>
</center>
</body>
</html>
