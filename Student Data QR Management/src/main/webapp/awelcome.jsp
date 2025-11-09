<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #f4f6f9;
    }
    header {
        background: #2c3e50;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    header h1 {
        margin: 0;
    }
    .header-buttons {
        display: flex;
        gap: 10px;
    }
    .btn {
        padding: 8px 14px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        font-size: 14px;
    }
    .print {
        background: #3498db;
        color: white;
    }
    .logout {
        background: #e74c3c;
        color: white;
    }
    .print:hover {
        background: #217dbb;
    }
    .logout:hover {
        background: #c0392b;
    }
    .container {
        width: 90%;
        margin: 20px auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    h2 {
        color: #34495e;
        border-left: 5px solid #2980b9;
        padding-left: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }
    th {
        background: #2980b9;
        color: white;
    }
    tr:hover {
        background: #f1f1f1;
    }
    .accept {
        background: #27ae60;
        color: white;
    }
    .reject {
        background: #e74c3c;
        color: white;
    }
    .accept:hover {
        background: #219150;
    }
    .reject:hover {
        background: #c0392b;
    }
</style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <div class="header-buttons">
            <button class="btn print" onclick="window.print()"> Print</button>
            <form action="logout.jsp" method="post" style="display:inline;">
                <button type="submit" class="btn logout">Logout</button>
            </form>
        </div>
    </header>

    <div class="container">
        <h2>Pending Requests</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

                    PreparedStatement ps=con.prepareStatement("select * from myregdata where status=?");
                    ps.setString(1,"1");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()) {
                        out.println("<tr>");
                        out.println("<td>"+rs.getString(1)+"</td>");
                        out.println("<td>"+rs.getString(3)+"</td>");
                        out.println("<td>"+rs.getString(4)+"</td>");
                        out.println("<td>"+rs.getString(5)+"</td>");
                        out.println("<td><form action='accept.jsp' method='post'>"
                                   + "<input type='hidden' name='e' value='"+rs.getString(3)+"'>"
                                   + "<input type='submit' value='Accept' class='btn accept'>"
                                   + "</form></td>");
                        out.println("</tr>");
                    }
                    
                    out.println("</table><br><h2>Login Permission</h2><table>");
                    out.println("<tr><th>ID</th><th>Email</th><th>Name</th><th>Phone</th><th>Action</th></tr>");
                    
                    PreparedStatement ps1=con.prepareStatement("select * from myregdata where status=?");
                    ps1.setString(1,"2");
                    ResultSet rs1=ps1.executeQuery();
                    while(rs1.next()) {
                        out.println("<tr>");
                        out.println("<td>"+rs1.getString(1)+"</td>");
                        out.println("<td>"+rs1.getString(3)+"</td>");
                        out.println("<td>"+rs1.getString(4)+"</td>");
                        out.println("<td>"+rs1.getString(5)+"</td>");
                        out.println("<td><form action='reject.jsp' method='post'>"
                                   + "<input type='hidden' name='e' value='"+rs1.getString(3)+"'>"
                                   + "<input type='submit' value='Reject' class='btn reject'>"
                                   + "</form></td>");
                        out.println("</tr>");
                    }
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='5' style='color:red'>"+e+"</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>