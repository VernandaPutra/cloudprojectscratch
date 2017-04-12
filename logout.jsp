<%@ include file = "connection.jsp"%>
<%

request.getSession().invalidate();

response.sendRedirect("TheWashproject.jsp");
 


%>