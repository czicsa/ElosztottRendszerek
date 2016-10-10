<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Status jsp</title>
</head>
<body>
	<a href="<c:url value='/admin/newuser'></c:url>">New user</a>
	<h2>Users: </h2>
	<table>
		<thead>
			<tr>
				<th>username</th>
				<th>credit</th>
				<th>school</th>
				<th>favcols</th>
				<th>gender</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.username}</td>
					<td>${user.credit}</td>
					<td>${user.school}</td>
					<td>
						<c:forEach items="${user.favcols}" var="color">
							${color} <br/>
						</c:forEach>
					</td>
					<td>${user.gend}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>