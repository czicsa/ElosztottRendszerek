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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
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
				<tr ng-repeat="user in users">
					<td>{{user.username}}</td>
					<td>{{user.credit}}</td>
					<td>{{user.school}}</td>
					<td>
						<span ng-repeat="color in user.favcols">{{color}}</span>
					</td>
					<td>{{user.gend}}</td>
				</tr>
		</tbody>
	</table>

	<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($http, $scope) {

			$scope.getUsers = function() {
				$http.get("getUsers").then(
						function(response) {
							$scope.users = response.data;
						},
						function(response){

						}
				);
			}
			$scope.getUsers();
		});
	</script>

</body>
</html>