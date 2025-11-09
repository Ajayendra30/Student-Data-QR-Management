<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
String email=request.getParameter("e");
String pass=request.getParameter("p");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
 	 PreparedStatement ps=con.prepareStatement("select * from myregdata where email=? and pass=? and status=?");
 	 ps.setString(1,email);
    ps.setString(2,pass);
    ps.setString(3,"2");
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    	out.println("Confirmed User...");
    else
    	out.println("NotConfirmed User...");
    con.close();
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>