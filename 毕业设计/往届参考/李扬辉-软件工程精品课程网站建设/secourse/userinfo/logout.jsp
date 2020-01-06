<%
//session.setAttribute("userName",""); 
session.removeAttribute("userName");
session.removeAttribute("userID");
response.sendRedirect("../index.jsp");
%>