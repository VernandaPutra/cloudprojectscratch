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
<select name="service">
	
	<option value="package1">Wash (N- RM3  / H- RM6) </option>
	<option value="package2">Polish (N- RM9  / H- RM18)</option>
	<option value="package3">Wax (N- RM9  / H- RM18)</option>
	<option value="package4">Wash+Polish (N- RM10/ H- RM20)</option>
	<option value="package5">Wash+Wax (N- RM10/ H- RM20)</option>
	<option value="package6">Polish+Wax (N- RM16/ H- RM32)</option>
        <option value="package7">Wash+Polish+Wax (N- RM18/ H- RM36)</option>
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