<%@include file="connection.jsp"%>
<%@page import="java.sql.*"%> 
<% 

String cusid = (String)session.getAttribute("userid1");
request.getSession().setAttribute("userid2",cusid);

out.println(session.getAttribute("userid1"));
out.println(session.getAttribute("userid2"));

String carplate=request.getParameter("carplate");   
String cartype = request.getParameter("cartype");
String serviceid = request.getParameter("service"); 
String date=request.getParameter("date"); 
String time=request.getParameter("time");
String adminid = "12345";
String cusidtemp = (String)request.getAttribute("userid2");

out.println(carplate);
out.println(cartype);
out.println(serviceid);
out.println(date);
out.println(time);


//Class.forName("com.mysql.jdbc.Driver").newInstance();
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
"hr","hr"); 

//String cusid = request.getParameter("cusid");
//out.println(cusid);

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
//String totalprice = Integer.toString(total);
int totalprice = total;
rr.close();
pstmt.close();
out.println("this");
boolean ide = false;

out.println(totalprice);
Statement st= con.createStatement(); 
ResultSet rs; 
String Command = "insert into receipt values (NULL,'"+cusid+"','"+adminid+"','"+carplate+"','"+cartype+"','"+serviceid+"',NULL,'"+time+"','"+totalprice+"')";
//String Command = "insert into receipt values (NULL,'"+totalprice+"','"+date+"','"+cusid+"','"+adminid+"','"+serviceid+"')";
//if the first column is auto-incremented use default, values(default,..,..), 'NULL' = string null?
//try to combine date and time, use Edge or Chrome as they got date/time API
//or insert using TO_DATE('2003/07/09', 'yyyy/mm/dd') for date 
//(TO_DATE('16:18:14', 'hh24:mi:ss') for time, but this will have you to get the string litreally in this format 'xx:xx:xx' and 'xxxx/xx/xx'
/*Statement statement1 = conn.createStatement();
		statement1.executeQuery("insert into laundries values('"+laundries_id+"','"+customer_id+"','"+customer_name+"',CURRENT_TIMESTAMP,null,'"+laundries_remark+"','"+laundries_status+"',"+laundries_cost+",'"+laundries_type+"','"+machine_id+"',null)");	
	 this is how i done it using TIMESTAMP column datatype*/
st.executeUpdate(Command); 
ide = true;

if(ide) {
response.sendRedirect("Showreceipt.jsp"); 

}
out.println("Data is inserted successfully"); 

%> 
