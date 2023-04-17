<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='javax.naming.InitialContext'%>
<%@ page import='UBK.beans.PersonBeanRemote'%>
<%@ page import='java.util.List'%>
<%@ page import='model.entity.Person'%>
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


	<FORM action="WebSearchPerson.jsp">
		<h1>Person search by name Form</h1>
		<label for="person_name">Search name:</label> <input
			name="person_name" type="text" size="25" value=""><br> <input
			name="NewAc" type="submit" value="Submit"><br>
	</FORM>


	<%

	String personName = request.getParameter("person_name");

	if (personName != null) {
		try {
			InitialContext ctx = new InitialContext();
			PersonBeanRemote PersonManager = (PersonBeanRemote) ctx
			.lookup("java:global/EARUBK/PersonBean/PersonBean!" + "UBK.beans.PersonBeanRemote");

			List<Person> listByNames = PersonManager.getPersonForName(personName);

			for (Person i : listByNames) {
		//out.println(i.getName() + " (" + i.getSex() + ") born on " + i.getBirthday());

		out.println("We found: <h2" + "style=\"font-size: 16pt; color: teal; font-family: Verdana;\">" + i.getName()
				+ " (" + i.getSex() + ") born on " + i.getBirthday() + "<br/>" + "</h2>");

			}

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>