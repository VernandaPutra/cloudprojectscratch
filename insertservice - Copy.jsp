<%@include file="connection.jsp"%>
<%@page import="java.sql.*"%> 
<% 

String carplate=request.getParameter("carplate");   
String cartype = request.getParameter("cartype");
String service = request.getParameter("SerID"); 
String date=request.getParameter("date"); 
String time=request.getParameter("time");
String adminid = "12345";

out.println(carplate);
out.println(cartype);
out.println(service);
out.println(date);
out.println(time);


//Class.forName("com.mysql.jdbc.Driver").newInstance();
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
"hr","hr"); 

String cusid = request.getParameter("user");
request.getSession().setAttribute("user", user);

       PreparedStatement pstmt = null;
       pstmt = con.prepareStatement("select * from SERVICE");
       ResultSet rr = null;

       rr =pstmt.executeQuery();
pstmt.clearParameters();
rr = pstmt.executeQuery();

rr.next();	
String price=rr.getString(3);
int pri = Integer.parseInt(price);
int type= Integer.parseInt(cartype);
int total=pri*type;
String totalprice = Integer.toString(total);
rr.close();
pstmt.close();
out.println("this");

Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); 
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
"hr","hr");
out.println("Wut");
Statement st = conn.createStatement(); 

out.println("wut");
String sql_insert = "INSERT INTO receipt (recid,cusid,adminid,carplate,cartype, service,date,time,totalprice) values (?,?,?,?,?,?,?,?,?)";
st.executeUpdate(sql_insert); 
pstmt.clearParameters();
	pstmt.setString(1,"NULL");
	pstmt.setString(2,cusid);
	pstmt.setString(3,adminid);
	pstmt.setString(4,carplate);
	pstmt.setString(5,cartype);
	pstmt.setString(6,service);
	pstmt.setString(7,date);
	pstmt.setString(8,time);
	pstmt.setString(9,totalprice);
	int insert=pstmt.executeUpdate();
	pstmt.close();
out.println("Data is inserted successfully"); 



%> 
