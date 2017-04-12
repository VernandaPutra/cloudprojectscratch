<%@ page import="java.sql.*" %>
<%@include file="connection.jsp"%>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Star Star Car Wash Book Now</title>
<style type="text/css">
<!--
.style2 {font-family: Geneva, Arial, Helvetica, sans-serif; font-weight: bold; font-size: 18px;}
-->
</style>
</head>


<body background="./images/7.jpeg"; >
<%
String userid2 = (String)session.getAttribute("userid1");
request.getSession().setAttribute("userid2",userid2);

out.println("CUSTOMER ID: " + userid2);
if(user == null) {
session.invalidate();
response.sendRedirect("TheWashproject.jsp");
}
%>

<%
    
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
"hr","hr"); 

       PreparedStatement stmt = null;
       stmt = con.prepareStatement("select * from SERVICE");
       ResultSet rs = null;

       rs =stmt.executeQuery();
%>

<center>

<h4 style="color:black;font-size:300%;font-family:algerian;">Car Wash Booking Service</h4>
<p style="color:black;font-size:150%;font-family:algerian;">Please Insert Information Below.</p>
<form id="form1" name="form1" method="post" action="insertservice.jsp" style="color:white;font-size:120%;font-family:bernard mt condensed;">
<table width="519" border="1">


<tr>
      <td width="125" bgcolor=black>Car Plate </td>
      <td width="11" bgcolor=black> : </td>
      <td width="361" bgcolor=black><input name="carplate" type="text" id="carplate" maxlength="10" required/><br></td>
</tr>
 <tr>
      <td bgcolor=black>Car Type </td>
      <td bgcolor=black>:</td>
      <td bgcolor=black><input name="cartype" type="radio" value="1" required/>
      N- Normal(below 1000KG)<br>
      <input name="cartype" type="radio" value="2" required/>
      H- Heavy(1000KG and above)<br>
      <label></td>
 </tr>
<tr>
      <td bgcolor=black>Service</td>
      <td bgcolor=black>:</td>
      <td bgcolor=black><select name="service" id="service">
	 <%  while(rs.next()){ %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
       <% } %>
      </select><br>      </td>
    </tr>
 <tr>
      <td width="125" bgcolor=black>Booking Date </td>
      <td width="11" bgcolor=black> : </td>
      <td width="361" bgcolor=black> <input type="date" name="date" required /><br></td>
 </tr>

<tr>
      <td bgcolor=black>Time</td>
      <td bgcolor=black>:</td>
      <td bgcolor=black><select name="time" id="time">
        <option value="9am-12pm">9am-12pm </option>
	<option value="1pm-4pm">1pm-4pm </option>
	<option value="4pm-7pm">4pm-7pm </option>
	<option value="8pm-11pm">8pm-11pm </option>
	
      </select><br>      </td>
 </tr>

  </table>
  <p>
    <input type="submit" name="Submit" value="Submit" />
    <input type="reset">
    <a href="homepage.jsp">  </a> </p>



</form>

<p><a href="homepage.jsp">
</a><a href="homepage.jsp">
<input name="Menu" type="submited" value="Back to Menu" />
</a></p>
</center>
</body>
</html>