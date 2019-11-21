<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.capg.Dao.RegisterDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="obj" class="com.capg.Model.User"/>  
  
<jsp:setProperty property="*" name="obj"/>  
<%

int status=RegisterDao.register(obj);
if(status>0)  
out.print("You are successfully registered");  


%>
<!-- <a href="login.jsp"> login</a> -->
<form action="login.jsp">
<input type="submit" value="login">
</form>
</body>
</html>