
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo Regjsp</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
String fname=request.getParameter("FullName");   
String Phn = request.getParameter("Phone_No");
String Add = request.getParameter("Address"); 
String user=request.getParameter("userid"); 
String pwd=request.getParameter("katalaluan");
String Admnid=request.getParameter("adminid");
String userrole = "user";
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
"hr","hr"); 
Statement st= con.createStatement(); 
ResultSet rs; 
String Command = "insert into customer values ('"+user+"','"+pwd+"','"+fname+"','"+Phn+"','"+Add+"','"+Admnid+"','"+userrole+"')";
st.executeUpdate(Command); 

out.println("Registered"); 


//Connection conn = null;
//PreparedStatement pstmt = null;
//Resultset rs = null;
//conn = getConnected();
//String sql = "select count(*) from member where no_staf =?"
//pstmt = conn.prepareStatement(sql);
//pstmt.clearParanmeters();
//pstmt.setString(1,nostaf);

//rs.next 


%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>