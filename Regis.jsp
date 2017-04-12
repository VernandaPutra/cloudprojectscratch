   <!DOCTYPE html>
<html>
<body

 background="..\..\Online_Project\ferrari.jpg" >

<head>
<title></title>
</head>
<body>


<h1 style="color:white;font-size:500%;font-family:verdana;""> Registration Page <img src=" C:\orion\default-web-app\Online_Project\sourcelogo.jpg"  width="90" height="40" /> </h1>
<p style="color:white;font-size:120%;"> Enter your details below</p>

<a></a>




<script>
function checkForm()
{ 
System.out.println("This is function working");
var x = document.form1.katalaluan.value;  
var y = document.form1.katalaluanretype.value;
if(x == y){
  return true;
}
  else{
  alert("Password is not the same");
  document.form1.katalaluan.focus();
  return false;
}
}

</script>

<form id = "form1" name ="form1" method ="post" action="reg.jsp" onsubmit="return checkForm()">
  <fieldset style="color:white;">
    <legend style="color:black"> Administrator Account:</legend>
    <p>FullName: <input type="text" name="FullName" ></p>
    <p>Phone : <input type="text" name="Phone_No"></p>
    <p>Address:<input type ="Address" name="Address"></p>
    <p>Userid:<input type="text" name="userid"></p>
    <p>Password:<input type ="Password" name="katalaluan"></p>
     <p>Retype Password:<input type ="Password" name="katalaluanretype"></p>
<p>Admin Id:<input type ="Text" name=:"adminid"></p>
    <input type="submit" value="Login">
  </fieldset>
</form>

</body>
</html>