<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var app = angular.module("myApp", []);
	app.controller("myCtrl", function($scope, $http) {
		function neve(p1) {

		}
		$scope.oke = function() {

			$http.get('getjson').then(
			// successful
			function(response) {
				$scope.tomb = response.data;
			},
			// unsuccessful
			function(response) {
				alert(":'(");
			});
			$scope.tomb.push($scope.name);
		}
		$scope.sokElem = function() {
			return $scope.tomb.length > 3;
		}
		$scope.name = "huuu";
		$scope.tomb = [ "also", "felso", "utolso" ];
	});
</script>
<body>
	<div data-ng-app="myApp" data-ng-controller="myCtrl">
		<input type="" data-ng-model="name"> <br /> {{name}} <br />
		<button type="button" data-ng-click="oke()">Oke meghivas!</button>
		<br />
		<ul>
			<li data-ng-repeat="elem in tomb">{{ elem }}</li>
		</ul>
		<span data-ng-show="sokElem()">SOK</span>
	</div>
</body>
</html>