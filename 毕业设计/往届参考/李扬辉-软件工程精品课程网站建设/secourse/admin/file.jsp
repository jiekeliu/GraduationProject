<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,aaa.*" errorPage=""%>
<%@ page   buffer="128kb"   autoFlush="false"%> 
<%@page language="java" pageEncoding="gb2312"%><!--ָ��jspԴ�ļ��ı����ʽ-->
<%request.setCharacterEncoding("gb2312");%><!--�ͻ���������������ʽ--> 
<jsp:useBean id="kejian" scope="page" class="aaa.DBOperate_kejian" />
<html>
<head>
<title>�μ���̨����</title>

</head>

<body>
<center>
<table width="656" border="0" cellspacing="0">
                <tr bgcolor="#D2C8F7">
                  <th width="42%" align="left" scope="col">&nbsp; �μ�����</th>
                  <th width="9%" align="left" scope="col">�μ���С</th>
                  <th width="21%" align="center" scope="col">�ϴ�����</th>
                  <th width="10%" align="right" scope="col">�ϴ���</th>
                  <th width="11%" align="center" scope="col">����</th>
                  <th width="7%" align="center" scope="col">ɾ��</th>
                </tr>
					<%
		ResultSet rs = kejian.getAll();
		while (rs.next())
		{
		String mid=rs.getString("fileID");
		String filename=rs.getString("fileName");
					
		%>
                <tr>
                  <td height="20" align="left"><%=filename%> </td>
                  <td align="left"><%=rs.getString("fileSize")%><%String time=rs.getString("fileTime");%></td>
                  <td align="left"><%=time%></td>
                  <td align="right"><%=rs.getString("fileAdmin")%></td>
                  <td align="center" valign="middle"><%=rs.getString("fileType")%></td>
                  <td align="center"><a href="file.jsp?mid=<%=mid%>" onClick="return confirm('ȷ��ɾ����')"><img src="../images/del.gif" width="14" height="14" border="0"></a></td>
                  <% 
					String msg="";
					if(request.getParameter("mid")!=null)
					{
						 String sql="select fileName from t_File where fileId="+request.getParameter("mid");

						 rs = kejian.getResult(sql);
						 rs.next();
						 String fname=rs.getString("fileName");
						 String sql1="delete from t_File where fileId="+request.getParameter("mid");
						 int n=kejian.executeSQLUpdate(sql1);
						 if(n==1)
						 	{
						 	msg="ɾ���ɹ���";
						 	String phyPath=request.getRealPath("/upload/"+fname);
						 	Utility.delFile(phyPath);
						 	response.sendRedirect("kejian.jsp");
						 	return;
						 	}
						 else msg="ɾ��ʧ�ܣ�";
					}
						if(!msg.equals(""))out.print("<script language='javascript' >alert('"+msg+"')</script>");
					
					%>
                </tr>
				   <%}
          kejian.closeCon();
           %>
  </table>

</center>
</body>
</html>
