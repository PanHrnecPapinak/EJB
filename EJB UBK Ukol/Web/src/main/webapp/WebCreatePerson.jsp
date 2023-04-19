<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='javax.naming.InitialContext'%>
<%@ page import='UBK.beans.PersonBeanRemote'%>
<%@ page import='javax.naming.NamingException'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>UBK exercise</h1>
	<a href="http://localhost:8080/Web/WebMain.jsp">Home</a>

	<!-- website form to create new person with name, sex and birthday -->
	<FORM action="WebCreatePerson.jsp">
		<h1>Person Creation Form</h1>
		Enter Your Name: <br> <input name="person_name" type="text"
			size="25" value=""><br> Sex male/female: <br> <Input
			name="person_sex" type="text" size="15" value=""><br>
		Birthday in format MM.DD.YYYY: <br> <Input name="person_birthday"
			type="text" size="35" value=""><br> <input name="NewAc"
			type="submit" value="Submit"><br>
	</FORM>

	<%
	
	//Servlet Layer part for to create new person. Read all inputs from form and create new record in DB.
	String PersonName = request.getParameter("person_name");
	String PersonSex = request.getParameter("person_sex");
	String Birthday = request.getParameter("person_birthday");
	if (PersonName != null && PersonSex != null && Birthday != null) {
		try {
			InitialContext ctx = new InitialContext();
			PersonBeanRemote PersonManager = (PersonBeanRemote) ctx
			.lookup("java:global/EARUBK/PersonBean/PersonBean!" + "UBK.beans.PersonBeanRemote");

			long id = PersonManager.createPerson(PersonName, PersonSex, Birthday);

			out.println("Person created. New personal ID assigned: <h2"
			+ "style=\"font-size: 16pt; color: teal; font-family: Verdana;\">" + id + "</h2>");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>