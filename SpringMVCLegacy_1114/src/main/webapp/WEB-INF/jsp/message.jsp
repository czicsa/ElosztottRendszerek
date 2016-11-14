<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

<link rel="stylesheet" href="<spring:theme code="css"></spring:theme>">
<c:url value="/springlegacy" var="url"></c:url>

<title>Status jsp</title>

<script type="text/javascript">
	$(document).ready(function() {
		$("#tablazat").DataTable();
	});
</script>

</head>
<body>
	<a href="<c:url value='/admin/newuser'></c:url>">New user</a>
	<h2>Users:</h2>
	<table id="tablazat">
		<thead>
			<tr>
				<th><spring:message code="name"></spring:message></th>
				<th><spring:message code="credit"></spring:message></th>
				<th><spring:message code="school"></spring:message></th>
				<th><spring:message code="favcols"></spring:message></th>
				<th><spring:message code="gender"></spring:message></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.username}</td>
					<td>${user.credit}</td>
					<td>${user.school}</td>
					<td><c:forEach items="${user.favcols}" var="color">
							${color} <br />
						</c:forEach></td>
					<td>${user.gend}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<img src="<spring:theme code="img"></spring:theme>">
</body>
</html>