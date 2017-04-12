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
       stmt = con.prepareStatement("select * from RECEIPT where cusid = ?");
       stmt.clearParameters();
       stmt.setString(1,userid2);
       ResultSet rs = null;

       rs =stmt.executeQuery();
%>

<center>

<h4 style="color:red;font-size:300%;font-family:algerian;">LOOK AT YORU RECEPIT</h4>
<p style="color:red;font-size:150%;font-family:algerian;">BIGGEST NO IS THE LATEST</p>
<form id="form1" name="form1" method="post" action="Showreceipt.jsp" style="color:white;font-size:120%;font-family:bernard mt condensed;">
<table width="519" border="1">



<tr>
      <td bgcolor=grey>Service</td>
      <td bgcolor=grey>:</td>
      <td bgcolor=grey><select name="receiptid" id="receipt">
	 <%  while(rs.next()){ %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
       <% } %>
      </select><br>      </td>
    </tr>
 

  </table>
  <p>
    <input type="submit" name="Submit" value="Submit" />
    <input type="reset">
    <a href="Showreceipt.jsp">  </a> </p>



</form>

<p><a href="homepage.jsp">
</a><a href="homepage.jsp">
<input name="Menu" type="submit" value="Back to Menu" />
</a></p>
</center>
</body>
</html>