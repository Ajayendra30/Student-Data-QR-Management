<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String name=request.getParameter("n");
    String pass=request.getParameter("p");
    String email=request.getParameter("e");
    String mobile=request.getParameter("m");
    String city=request.getParameter("c");
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
     	 PreparedStatement ps=con.prepareStatement("insert into myregdata values(?,?,?,?,?,?)");
     	 ps.setString(1,name);
        ps.setString(2,pass);
        ps.setString(3,email);
        ps.setString(4,mobile);
        ps.setString(5,city);
        ps.setString(6, "1");
        int r=ps.executeUpdate();
       if(r>0)
       	response.sendRedirect("log.html");
       else
       	out.println("Try Again, Error occured!!");
        con.close();


    	
    }
    catch(Exception e)
    {
    	out.println(e);
    }
%>

</body>
</html>