<%@page language="java" contentType="application/x-msdownload" import="java.io.*,java.net.*" pageEncoding="gb2312"%>
<%@page import="aaa.Utility"%>
<%!
public String convert(String s) {
    try {
        return new String(s.getBytes("ISO-8859-1"), "GB2312");
    } catch (Exception e) {
        return null;
    }
}
public String getFileName(String fileName) {
    return fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
}
%>
<%
response.reset();
response.setContentType("application/x-download");
String filepath = request.getParameter("filepath");

System.out.println("0 ---- "+filepath);

String filenamedisplay = getFileName(filepath);

System.out.println("1 ---- "+filenamedisplay);

filenamedisplay = URLEncoder.encode(filenamedisplay, "UTF-8");


System.out.println("2 -------"+convert(filenamedisplay));

response.addHeader("Content-Disposition", "attachment;filename=" + filenamedisplay);
OutputStream output = null;
FileInputStream fis = null;
try {
    String realPath=request.getRealPath("/upload");
    output  = response.getOutputStream();
    fis = new FileInputStream(realPath+"\\"+filepath);
    byte[] b = new byte[1024];
    int i = 0;
    while((i = fis.read(b)) > 0) {
        output.write(b, 0, i);
    }
    output.flush();
} catch(Exception e) {
    System.out.println("Error!");
    e.printStackTrace();
} finally {
    if(fis != null) {
        fis.close();
        fis = null;
    }
    if(output != null) {
        output.close();
        output = null;
    }
}
%> 