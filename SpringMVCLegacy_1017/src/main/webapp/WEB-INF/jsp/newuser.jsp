<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
	<form>
		<label>Username:</label>
		<input type="text" ng-model="user.username"/> <br />
		<label>Credit</label>
		<input type="text" ng-model="user.credit"/> <br />
		<br />
		<label>Schools</label>
		<select ng-options="school for school in schools" ng-model="user.school">
		</select>
		</br>
		</br>
		<label>Favourite color:</label>
		<div ng-repeat="color in colors"><input type="checkbox" value="{{color}}" >{{color}}</div>
		</br>
		<label>Gender:</label>
		<div ng-repeat="gender in genders"><input type="radio" name="gender" value="{{gender}}"/>{{gender}}</div>

		<input type="button" ng-click="save()" value="Create">
	</form>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($http, $scope) {

			init = function(){
				$scope.user = {username: "", credit: "", school: "", favcol: [], gend: []};
				$http.get("getColors").then(
						function(response) {
							$scope.colors = response.data;
						},
						function(response){

						}
				);
				$http.get("getGenders").then(
						function(response) {
							$scope.genders = response.data;
						},
						function(response){

						}
				);
				$http.get("getSchools").then(
						function(response) {
							$scope.schools = response.data;
						},
						function(response){

						}
				);
			};

			$scope.save = function() {
				$http.post("newuser", $scope.user);
			};
			init();
		});
	</script>
</body>
</html>