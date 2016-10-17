<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<spring:theme code="css"/>">
</head>
<body>
    <img src="<spring:theme code="logo"/>" height="100px"/>
    <p><spring:message code="name" /></p>
</body>
</html>
