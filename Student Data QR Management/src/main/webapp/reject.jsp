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
     
    	 try
    	    {
    	        Class.forName("oracle.jdbc.driver.OracleDriver");
    	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
    	     	 PreparedStatement ps=con.prepareStatement("update myregdata set status=? where email=?");
    	     	ps.setString(1,"1");
    	     	 ps.setString(2,email);
    	     	 int r=ps.executeUpdate();
    	     	 if(r>0)
    	     		 response.sendRedirect("awelcome.jsp");
    	          	 out.println();
    	        	 con.close();


    	    	
    	    }
    	 catch(Exception e)
    	 {
    		 out.println(e);

     }
%>
</body>
</html>