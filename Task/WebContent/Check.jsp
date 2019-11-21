<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String uemail = request.getParameter("uemail");
String upass = request.getParameter("upass");

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sandhya","sandhya07");
	PreparedStatement ps=con.prepareStatement("select * from users");  
	
	
	ResultSet rs = ps.executeQuery();
    while(rs.next()) {
    	if(uemail.equalsIgnoreCase(rs.getString(3)) && upass.equalsIgnoreCase(rs.getString(2)))
    	{
    	out.print("successfully logged in");
    	%>
    	<form action="file.jsp">
    	<input type="file" value="file" />
    	<input type="submit" value="upload"/>
    	</form>
    	
    	<%
    	}
    	else{
    		out.print("invalid credentials");
    	}
    	
    }
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

</body>
</html>