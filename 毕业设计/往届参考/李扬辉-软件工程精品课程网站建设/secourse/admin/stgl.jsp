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
        <tr><td bgcolor="#D2C8F7">&nbsp;  </td></tr>
      </table></td>
    </tr>
	 <tr>
      <td valign="top" bgcolor="lightblue">
	   <%
	    String name=(String) session.getAttribute("admin"); 
		if ( name==null ||name.equals(""))
		{
			out.print("<Script Language=Javascript>window.alert('����Ȩ���������Ϣ��');parent.location.href='login.htm';</Script>");
		}
		
	%></td>
    </tr>
	  <tr>
      <td height="200" >      
		       
				<TABLE width=800 >
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
		        <TR>
		        	<TD align="center"><a href="newquestion.jsp">������Ŀ</a></TD>
		        </TR>
		        <TR>
		        	<TD align="center"><a href="editquestion.jsp">�鿴��Ŀ</a></TD>
		        </TR>
		        
		        </TABLE>		
	</td>
    </tr>
    
  </table>
</center>
</body>
</html>
