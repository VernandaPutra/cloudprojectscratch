<%@ page import="java.sql.*"%>

<%!
Driver driver = null;
String driverUsed = "oracle.jdbc.driver.OracleDriver";
String serverAddress = "jdbc:oracle:thin:@localhost:1521:xe";

String user="HR";
String pass="HR";

	public Connection getConnected() throws Exception
	{
		Connection conn = null;
	try {
	if  (driver==null)
	     driver = (Driver)Class.forName(driverUsed).newInstance();
	     conn = DriverManager.getConnection(serverAddress, user, pass);
	     return conn;
	}
	catch (Exception e) {
throw new Exception("Database Connection failed");

}
}
%>