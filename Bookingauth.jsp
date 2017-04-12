<%@include file="connection.jsp"%>
<%
String nostaf=request.getParameter("nostaf");
String nama=request.getParameter("nama");
String jantina=request.getParameter("jantina");
String taraf_perkahwinan =request.getParameter("trf_kahwin");
String bangsa=request.getParameter("bangsa");
String alamat=request.getParameter("alamat");

out.println(nostaf);
out.println(nama);
out.println(jantina);
out.println(taraf_perkahwinan);
out.println(bangsa);
out.println(alamat);


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

conn = getConnected();
String sql = "select count(*) from member where no_staf =?";
pstmt=conn.prepareStatement(sql);
pstmt.clearParameters();
pstmt.setString(1,nostaf);

rs = pstmt.executeQuery();

rs.next();	
int count = rs.getInt(1);
rs.close();
pstmt.close();

if (count==0)
{	   
	String sql_insert = "INSERT INTO member (no_staf,nama,jantina,taraf_perkahwinan,bangsa, alamat) values (?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql_insert);
	pstmt.clearParameters();
	pstmt.setString(1,nostaf);
	pstmt.setString(2,nama);
	pstmt.setString(3,jantina);
	pstmt.setString(4,taraf_perkahwinan);
	pstmt.setString(5,bangsa);
	pstmt.setString(6,alamat);

	int insert=pstmt.executeUpdate();
	pstmt.close();
	response.sendRedirect("sah_simpan.jsp"); 
}
else
{
	response.sendRedirect("error_simpan.jsp");
		//data telah ada
}

pstmt.close();
rs.close();
conn.close();


%>
