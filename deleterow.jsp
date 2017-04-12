<%@include file="connection.jsp"%>
<%


ResultSet rs = null;
boolean deleted = false;
String recidd = "";
String cusidd = "";	
PreparedStatement stmt = null;
Connection conn = null;
cusidd = (String)session.getAttribute("userid1");
request.getSession().setAttribute("userid2",cusidd);
recidd = (String)session.getAttribute("recidde");
out.println(cusidd);
out.println(recidd);
String sql = "select * from receipt where recid=? ";
stmt.clearParameters();
       stmt.setString(1,cusidd);
       stmt.setString(2,recidd);
stmt=conn.prepareStatement(sql);
stmt.clearParameters();


//rs = pstmt.executeQuery();
//deleted = true;

if (true){
out.println("deleted");
response.sendRedirect("Selectreccus.jsp");
}

stmt.close();
rs.close();
conn.close();


%>
