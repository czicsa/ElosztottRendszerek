<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="stat" items="${status}">
		<p>${stat}</p>
	</c:forEach>
	<c:url var="urika" value='/admin/newuser'></c:url>
	<form:form  action="${urika}" modelAttribute="pageData"  method="POST">
		<label>Username:</label>
		<form:input path="username"/> <br />
		<label>Credit</label>
		<form:input path="credit"/> <br />
		<br />
		<label>Schools</label>
		<form:select path="school" items="${schools}" multiple="false" > <br />	
		</form:select>
		<br />
		<br />
		<label>Favourite color:</label>
		<form:checkboxes items="${colors}" path="favcol"/>
		<br />
		<br /> 
		<label>Gender:</label>
		<form:radiobuttons path="gend" items="${genders}"/>
		
		<input type="submit" value="Create">
	</form:form>
	<!--  
	<form action="" method="post">
		<input type="text" placeholder="ide nevet!" name="username" value="${username}">
		<input type="text" name="credit" value="${credit}"> <br />
		
		<label>Iskolai végzettség:</label><br />
		
		<select name="school">
			<option value="HIGHSCHOOL" ${HIGHSCHOOL}>Középiskola</option>
		 	<option value="COLLEGE" ${COLLEGE}>Főiskola</option>
		  	<option value="UNIVERSITY" ${UNIVERSITY}>Egyetem</option>
		</select><br />
		
		<label>Kedvenc színek:</label> <br />
		Red <input type="checkbox" name="favcol" value="red" ${RED}> <br />
		Green <input type="checkbox" name="favcol" value="green" ${GREEN}> <br />
		Blue <input type="checkbox" name="favcol" value="blue" ${BLUE}> <br />
		
		<label>Nem:</label><br />
		
		<input type="radio" name="gend" value="male" ${male}> Male<br> 
		<input type="radio" name="gend" value="female" ${female}> Female<br>

		<input type="submit">
	</form>
	-->
</body>
</html>