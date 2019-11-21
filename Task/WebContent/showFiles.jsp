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
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sandhya","sandhya07");
	PreparedStatement ps=con.prepareStatement("select * from student");  
	
	
	ResultSet rs = ps.executeQuery();
    while(rs.next()) {
    	
    	%>
    	
    	<form>
    		<table border="1">
    			<tr>
    				<td><% out.print(rs.getString(1)); %></td>
    				<td><% out.print(rs.getInt(2)); %></td>
    				<td><% out.print(rs.getString(3)); %></td>
    			</tr>
    		
    		</table>
    	
    	</form>
    	
    	<%
    	
    }
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</body>
</html>