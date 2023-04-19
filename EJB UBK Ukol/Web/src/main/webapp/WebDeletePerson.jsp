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

	<!-- website form to enter person ID to delete and submit -->
	<FORM action="WebDeletePerson.jsp">
		<h1>Person Deletion Form</h1>
		<label for="person_id">Enter person ID to delete:</label> <input
			name="person_id" type="number" size="25" value=""><br> <input
			name="NewAc" type="submit" value="Submit"><br>
		<script>
			function confirmDelete() {
				return confirm("Are you sure you want to delete this person?");
			}
			document.querySelector('form').addEventListener('submit',
					function(e) {
						if (!confirmDelete()) {
							e.preventDefault();
						}
					});
		</script>
	</FORM>

	<%
	
	//Servlet Layer part for delete person form. If we enter ID, it find it in DB and delete its record.
	String personIdStr = request.getParameter("person_id");
	if (personIdStr != null) {
		try {
			long personId = Long.parseLong(personIdStr);
			InitialContext ctx = new InitialContext();
			PersonBeanRemote PersonManager = (PersonBeanRemote) ctx
			.lookup("java:global/EARUBK/PersonBean/PersonBean!" + "UBK.beans.PersonBeanRemote");

			boolean Status = PersonManager.deletePerson(personId);

			if (Status = true) {
		out.println("Deleted person had ID: <h2" + "style=\"font-size: 16pt; color: teal; font-family: Verdana;\">"
				+ personId + "</h2>");
			} else {
		out.println("Delete process failed. Try again for ID: <h2"
				+ "style=\"font-size: 16pt; color: teal; font-family: Verdana;\">" + personId + "</h2>");
			}

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>