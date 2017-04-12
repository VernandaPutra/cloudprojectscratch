<%@include file="connection.jsp"%>
<%
String cusid = (String)session.getAttribute("userid1");
request.getSession().setAttribute("userid2",cusid);

out.println("Customer ID: " + session.getAttribute("userid1"));


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String recid = "";
	
String adminid = "";
String carplate = "";	
String cartype = "";
String serviceid= "";
String date = "";	
String time = "";
String totalprice= "";
boolean exist = true;

conn = getConnected();

String sql = "select * from receipt where cusid=? order by recid ASC";
pstmt=conn.prepareStatement(sql);
pstmt.clearParameters();
pstmt.setString(1,cusid);
rs = pstmt.executeQuery();

while( rs.next() )
{
	recid = rs.getString("recid");
	cusid = rs.getString("cusid");
	carplate = rs.getString("carplate");
	cartype = rs.getString("cartype");
	serviceid = rs.getString("serid");
	date = rs.getString("bday");
	time = rs.getString("btime");
	totalprice = rs.getString("totalprice");
	exist = false;
}
if (exist){
	response.sendRedirect("paparAhli_error.jsp");
}
if (cartype.equals("1"))
{
 	cartype="Normal";
}
if (cartype.equals("2"))
{
cartype="Heavy";
}



pstmt.close();
rs.close();
conn.close();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style2 {color: #000000}
-->
</style>
</head>

<body>
<p class="style2"><strong>Booked Service </strong></p>
<table width="519" border="1">
  <tr>
    <td width="125" bgcolor="#ECE9D8"><span class="style2">Booking ID </span></td>
    <td width="11" bgcolor="#99FF99"> : </td>
    <td width="361" bgcolor="#CCFF99"><%= recid%>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8"><span class="style2">Customer ID</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= cusid%>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8"><span class="style2">Car Plate</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= carplate%>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8"><span class="style2">Car Type </span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= cartype%>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8"><span class="style2">Service ID</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= serviceid%>&nbsp;</td>
  </tr>
  <tr>
    <td height="106" bgcolor="#ECE9D8"><span class="style2">Date</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= date%>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8"><span class="style2">Time</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= time%>&nbsp;</td>
  </tr>
  <tr>
    <td height="106" bgcolor="#ECE9D8"><span class="style2">Total Price</span></td>
    <td bgcolor="#99FF99">:</td>
    <td bgcolor="#CCFF99"><%= totalprice%>&nbsp;</td>
  </tr>
</table>
 
<a href="homepage.jsp"><input name="Home Page" type="submit" value="HomePage" /></a>
<a href="delete.jsp"><input name="Delete" type="submit" value="Delete" /></a>
</body>
</html>
