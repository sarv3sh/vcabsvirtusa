<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String name = request.getParameter("name");
String pwd = request.getParameter("password");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "db1";
String userid = "root";
String password = "sarvesh13";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>







<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT name,password FROM driver WHERE name='"+name+"' and password = '"+pwd+"' ";


resultSet = statement.executeQuery(sql);
if(resultSet.next()){

 // response.sendRedirect("driverloc.html");
session.setAttribute("drivername",name);
 
  response.sendRedirect("dispassenger.jsp");
  
 }
else
{
	response.sendRedirect("error.html");
}
}

catch (Exception e) {
e.printStackTrace();
response.sendRedirect("error.html");
}
%>


