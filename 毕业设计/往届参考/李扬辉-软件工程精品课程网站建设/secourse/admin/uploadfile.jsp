<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,aaa.*" errorPage=""%>
<html>
  <head>
    <title>课件上传</title>
	

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
	alert("请选择上传文件！");
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
		alert("请选择课件类型！");
		return false;
		}
	}
return true;	
}
 </script>
  <body> 

    <center>
      课件上传
    <br>
    <form action="upload.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1" onSubmit="return check()">
    <table><tr>
      <td width="442">课件路径:
        <input name="filename" type="file" id="filename" size="40"></td></tr>
    <tr><td align="center"><p>
      
	  <span id="type"><label>课件性质:
        <input name="type" type="radio" value="CouseWare">
        电子课件</label>
      <label>
      <input name="type" type="radio" value="video">
      教学录像</label>
      <label>
        <input type="radio" name="type" value="shiyan">
        实验指导</label>
      <label>
      <input type="radio" name="type" value="task">
      </label>
      课后作业</span><br>
      
      <input type="submit" value="上传" onClick="checktype()"></p>
    </td>
    </tr>
    </table>
    </form>
    </center>
  </body>
</html>
