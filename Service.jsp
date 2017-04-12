<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>

<head>
<title>Star Star Car Wash Book Now</title>
</head>
<script>
function validateForm()
{
	var x=document.form1.car_plate.value;	
	var x2=validateForm2(form1.car_type);
	var x3=document.form1.booktime.value;

	
if (x==null || x=="" || x2==false || x3==null || x3=="" )
  {
  alert("Please make sure that all fields must be filled out before submit");
  return false;
  }
}
function validateForm2(radiobtn)
{
	var x= false;
	for(var i=0 ; i < radiobtn.length ; i++){
		if(radiobtn[i].checked){
			x=true;
			break;
		}
	}
	return x;
}
</script>
<body background="./images/1.jpg">

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



    
//Class.forName("com.mysql.jdbc.Driver").newInstance();

<center>
<h1></h1><img src = "./images/banner.jpg" width ="1300" height = "300"/>

<h4 style="color:cyan;font-size:300%;font-family:algerian;">Car Wash Booking Service</h4>
<p style="color:yellow;font-size:150%;font-family:algerian;">Please Insert Information Below.</p>
<form id="form1" name="form1" method="post" action="insertservice.jsp" onsubmit="return validateForm()" style="color:white;font-size:120%;font-family:bernard mt condensed;">
Car Plate:
<input type="text" name="car_plate">
<br><br>Car Type:
<br><input type="radio" name="car_type" value="Normal" checked>N- Normal(below 1000KG)<br>
  <input type="radio" name="car_type" value="Heavy">H- Heavy(1000KG and above)<br><br>
Service:
 <select name ="Service">
         <%  while(rs.next()){ %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
       <% } %>
        </select>
<br><br>
Booking date and time:
  <input type="datetime-local" name="booktime" required>
  <br><br>
<input type="Submit">

</center>
</form>
</body>
</html>