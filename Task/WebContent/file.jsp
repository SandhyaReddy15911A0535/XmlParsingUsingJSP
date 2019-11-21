<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
   <%@ page import="javax.xml.parsers.DocumentBuilder" %>
   <%@ page import="org.w3c.dom.Document" %>
   <%@ page import="org.w3c.dom.Element" %>
    <%@ page import="org.w3c.dom.Node" %>
     <%@ page import="org.w3c.dom.NodeList" %>
     <%@ page import="java.io.*" %>
     <%@ page import="javax.swing.JFileChooser" %>
     <%@ page import="java.sql.Connection" %>
     <%@ page import="java.sql.DriverManager" %>
     <%@ page import="java.sql.PreparedStatement" %>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
DocumentBuilder builder=factory.newDocumentBuilder();
Document doc=builder.parse("FileUpload.xml");
//out.print(doc.getDocumentElement().getNodeName());
NodeList list=doc.getElementsByTagName("student");
for(int i=0;i<list.getLength();i++)
{
	Node n=list.item(i);
	//out.print(n.getNodeName());
	Element e=(Element)n;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sandhya","sandhya07");
	PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?)");  
	ps.setString(1,e.getElementsByTagName("name").item(0).getTextContent());  
	ps.setString(2,e.getElementsByTagName("id").item(0).getTextContent());  
	ps.setString(3,e.getElementsByTagName("address").item(0).getTextContent());  
	              
	 ps.executeUpdate();

	/* out.print(e.getElementsByTagName("name").item(0).getTextContent());
	out.print(e.getElementsByTagName("id").item(0).getTextContent());
	out.print(e.getElementsByTagName("address").item(0).getTextContent()); */
}
out.print("successfully parsed the data");

%>
	
<form action="showFiles.jsp">

<input type="submit" value="ShowFiles"/>
</form>
</body>
</html>