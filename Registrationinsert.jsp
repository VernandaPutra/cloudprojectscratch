<%@ include file = "connection.jsp"%>
<%

//receive parameter from database
String user_id = "";
String user_katalaluan = "";
String role = "";
boolean ada = false;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

conn = getConnected();
String sql = "select userid, katalaluan, status from userlogin where userid = ? and katalaluan = ?";
//match values from user input with values in database

pstmt = conn.prepareStatement(sql);
pstmt.clearParameters();

//receive parameter from previous page Login.jsp
pstmt.setString (1, request.getParameter("userid"));

//insert String for first arg that is userid
pstmt.setString (2, request.getParameter("katalaluan"));

//insert String for second arg that is katalaluan
rs = pstmt.executeQuery();

while (rs.next()) {
	user_id = rs.getString(1); //get result from column 1
	user_katalaluan = rs.getString(2); //get result from column 2
	role = rs.getString(3); //get result from column 3
	ada = true;
}

if (ada == true) {
	if (role.equals("admin")) {
		response.sendRedirect("menu.jsp"); //load the menu pa
	}
	else
	{
		response.sendRedirect("menu.jsp?userid="+user_id);
	}
}
else
{
	response.sendRedirect("error.jsp");
}

rs.close();
pstmt.close();
conn.close();

%>