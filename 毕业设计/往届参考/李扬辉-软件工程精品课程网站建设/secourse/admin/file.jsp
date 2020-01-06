<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,aaa.*" errorPage=""%>
<%@ page   buffer="128kb"   autoFlush="false"%> 
<%@page language="java" pageEncoding="gb2312"%><!--指定jsp源文件的编码格式-->
<%request.setCharacterEncoding("gb2312");%><!--客户端输入参数编码格式--> 
<jsp:useBean id="kejian" scope="page" class="aaa.DBOperate_kejian" />
<html>
<head>
<title>课件后台管理</title>

</head>

<body>
<center>
<table width="656" border="0" cellspacing="0">
                <tr bgcolor="#D2C8F7">
                  <th width="42%" align="left" scope="col">&nbsp; 课件名称</th>
                  <th width="9%" align="left" scope="col">课件大小</th>
                  <th width="21%" align="center" scope="col">上传日期</th>
                  <th width="10%" align="right" scope="col">上传者</th>
                  <th width="11%" align="center" scope="col">属性</th>
                  <th width="7%" align="center" scope="col">删除</th>
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
                  <td align="center"><a href="file.jsp?mid=<%=mid%>" onClick="return confirm('确认删除？')"><img src="../images/del.gif" width="14" height="14" border="0"></a></td>
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
						 	msg="删除成功！";
						 	String phyPath=request.getRealPath("/upload/"+fname);
						 	Utility.delFile(phyPath);
						 	response.sendRedirect("kejian.jsp");
						 	return;
						 	}
						 else msg="删除失败！";
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
