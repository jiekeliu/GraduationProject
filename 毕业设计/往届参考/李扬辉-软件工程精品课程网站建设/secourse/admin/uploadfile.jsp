<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,aaa.*" errorPage=""%>
<html>
  <head>
    <title>�μ��ϴ�</title>
	

  <style type="text/css">
<!--
body {
	background-image: url(../images/main1.gif);
}
body,td,th {
	font-size: 12px;
}
-->
</style></head>
  <script language="javascript">
  function check()
  {
  if(form1.filename.value=="")
  	{
	alert("��ѡ���ϴ��ļ���");
	return false;
	} 
	else   
	{
		var isSelected=false;
		var a=document.getElementById("type").getElementsByTagName("input");
		for(var i=0;i<a.length;i++)
		{
		if(a[i].checked)
			{
			isSelected=true;
			break;
			}
		}
		if(!isSelected)
		{
		alert("��ѡ��μ����ͣ�");
		return false;
		}
	}
return true;	
}
 </script>
  <body> 

    <center>
      �μ��ϴ�
    <br>
    <form action="upload.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1" onSubmit="return check()">
    <table><tr>
      <td width="442">�μ�·��:
        <input name="filename" type="file" id="filename" size="40"></td></tr>
    <tr><td align="center"><p>
      
	  <span id="type"><label>�μ�����:
        <input name="type" type="radio" value="CouseWare">
        ���ӿμ�</label>
      <label>
      <input name="type" type="radio" value="video">
      ��ѧ¼��</label>
      <label>
        <input type="radio" name="type" value="shiyan">
        ʵ��ָ��</label>
      <label>
      <input type="radio" name="type" value="task">
      </label>
      �κ���ҵ</span><br>
      
      <input type="submit" value="�ϴ�" onClick="checktype()"></p>
    </td>
    </tr>
    </table>
    </form>
    </center>
  </body>
</html>
