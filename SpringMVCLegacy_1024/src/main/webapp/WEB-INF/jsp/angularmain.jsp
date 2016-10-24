<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	var appReg = angular.module("register", []);
	appReg.controller("regController", function($scope, $http) {
		$scope.register = function() {
			var elements = [];
			for ( var index in $scope.colors) {
				if ($scope.colors[index] == true) {
					elements.push(index);
				}
			}
			$http.post("registeruserangular", {
				username : $scope.rusername,
				credit : $scope.rcredit,
				school : $scope.rschool,
				favcol : elements,
				gend : $scope.sex
			}).then(function(response) {

				if (response.data == 1) {
					$scope.rusername = "";
					$scope.rcredit = "";
					//$scope.rschool
					for ( var color in $scope.colors) {
						$scope.colors[color] = false;
					}
					$scope.sex = "MALE"
					$scope.regStatus = "OK!"
					$scope.getUsers();
				} else {
					$scope.regStatus = "Registration error!"
				}
			});
		}
		$scope.schools;
		$scope.elements = function() {
			$http.get("getschools").then(function(response) {
				$scope.schools = response.data;
			});
		};
		$scope.getColors = function() {
			$http.get("getcolors").then(function(response) {
				$scope.colors = {};//= response.data;
				var length = response.data.length;
				var data = response.data;
				var temp;
				for (var i = 0; i < length; i++) {

					$scope.colors[data[i].colorCode] = data[i].enabled;
				}

			});
		}

		$scope.getUsers = function() {
			$http.get("getusers").then(function(response) {
				
				$scope.users = response.data;

			});
		}
		$scope.getUsers();
		$scope.sex = "MALE";
		$scope.getColors();
		//$scope.colors = {Red: true, Green : false};
		$scope.elements();
	});
</script>

</head>
<body>
	<div data-ng-app="register" data-ng-controller="regController">
		<h2>Registration</h2>
		<p>{{regStatus}}</p>
		<label>Username</label> <input type="text" data-ng-model="rusername"><br />
		<label>Credit</label> <input type="text" data-ng-model="rcredit"><br />
		<select data-ng-model="rschool">
			<option value="{{elem.key}}" data-ng-repeat="elem in schools">{{elem.value}}</option>
		</select><br /> <label ng-repeat="(color,enabled) in colors"> <input
			type="checkbox" ng-model="colors[color]" /> {{color}}
		</label> <br /> Male<input type="radio" ng-model="sex" value="MALE"
			checked="checked"><br /> Female<input type="radio"
			ng-model="sex" value="FEMALE">
		<button data-ng-click="register()">Register</button>

		<h2>Users:</h2>
		<table id="tablazat" data-ng-model="users">
			<thead>
				<tr>
					<th>Name</th>
					<th>Credit</th>
					<th>Schools</th>
					<th>Favourite colors</th>
					<th>Gender</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="adat in users">
					<td>{{adat.username}}</td>
					<td>{{adat.credit}}</td>
					<td>{{adat.school}}</td>
					<td><p ng-repeat="data2 in adat.favcols">{{data2}}</p></td>
					<td>{{adat.gend}}</td>
				</tr>
			</tbody>
		</table>

	</div>


</body>
</html>