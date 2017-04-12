<%@ include file = "connection.jsp"%>
<%@page import="java.sql.*"%> 

   <!DOCTYPE html>
<html>
<body

 background="C:\orion\default-web-app\Online_Project_Newest\source\lambo.jpg" >

<head>
<title></title>
</head>
<body>

<%

String user = (String)session.getAttribute("userid1");
request.getSession().setAttribute("user",user);
out.println("CUSTOMER ID: " + user);
if(user == null) {
session.invalidate();
response.sendRedirect("TheWashproject.jsp");
}
%>

<form method="link" action="logout.jsp" align="right">
    <input type="submit" value="Logout"/>
</form>
</form>


<h1 style="color:white;font-size:500%;font-family:verdana;""> Homepage <img src=" C:\orion\default-web-app\OnlineProject\source\logo.jpg"  width="90" height="40" />  <img src=" C:\orion\default-web-app\OnlineProject\source\giphy.gif"  width="150" height="40" /> </h1>
<form action="action_page.php">
  <fieldset style="color:white;">
    
<a href="service.jsp"><input name="Menu" type="submit" value="Edit Account Details"   /></a>



</fieldset>
</form>




<p style="color:white;font-size:200%;"> Hi There!   


  <fieldset style="color:white;font-size:200%;">
Services

<p style="font-size: 60%;" > - Full Wash </p>
<p style="font-size: 60%;" > - Polishing </p>
<p style="font-size: 60%;" > - Waxing </p>
<p style="font-size: 60%;" > - Vaccum </p>

</fieldset>
</form>


<form action="Servicenew.jsp">
  <fieldset style="color:white;">
    
     
  
<a href="service.jsp"><input name="Menu" type="submit" value="Book Service Now" /></a>


</fieldset>
</form>

<form action="Selectreccus.jsp">
  <fieldset style="color:white;">
    
     
  
<a href="service.jsp"><input name="Menu" type="submit" value="Show Booking History" /></a>


</fieldset>
</form>

<p style="color:white;font-size:200%;"> About Us 
<p style="color:white;font-size:120%;">

 A car wash with a conscience: we care for the environment and make sure only bio-degradable eco-friendly car wash detergents are used. 
 Convenience in a car wash: Star Star Carwash is all about customer service and convenience.
 We aim to provide the best car wash in town. Anywhere, Anytime. 

 
All Car Wash Pros are vetted and equipped with the highest quality kit.
<a></a>



<p style="color:white;font-size:200%;"> Contact Us 
<p style="color:blue;font-size:120%;">

call 603-994872 or email us at
starstar@gmail.com


</body>
</html>