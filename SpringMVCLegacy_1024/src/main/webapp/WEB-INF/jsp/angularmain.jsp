<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.js"></script>

	<title>Insert title here</title>
	<script type="text/javascript">
		var appReg = angular.module("register", ['ngMaterial']);
		appReg.controller("regController", function($scope, $http, $mdToast, $mdDialog) {
			$scope.register = function() {
				var elements = [];
				for ( var index in $scope.colors) {
					if ($scope.colors[index].enabled == true) {
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
						$scope.showSimpleToast('A mentés sikeres!');
						$scope.rusername = "";
						$scope.rcredit = "";
						$scope.rschool = "";
						for ( var index in $scope.colors) {
							$scope.colors[index].enabled = false;
						}
						$scope.sex = "MALE"
						$scope.getUsers();
					} else {
						$scope.showSimpleToast('Valami hiba történt!');
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
					$scope.colors = response.data;
					/*var length = response.data.length;
					var data = response.data;
					for (var i = 0; i < length; i++) {
						$scope.colors[data[i].colorCode] = data[i].enabled;
					}*/

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

			$scope.deleteUser = function(username) {
				$http.post("deleteuser", username)
						.then(function(response) {
							$scope.showSimpleToast('A törlés sikeres!')
							$scope.getUsers();
				});
			}

			var last = {
				bottom: false,
				top: true,
				left: false,
				right: true
			};

			$scope.toastPosition = angular.extend({},last);

			$scope.getToastPosition = function() {
				sanitizePosition();

				return Object.keys($scope.toastPosition)
						.filter(function(pos) { return $scope.toastPosition[pos]; })
						.join(' ');
			};

			function sanitizePosition() {
				var current = $scope.toastPosition;

				if ( current.bottom && last.top ) current.top = false;
				if ( current.top && last.bottom ) current.bottom = false;
				if ( current.right && last.left ) current.left = false;
				if ( current.left && last.right ) current.right = false;

				last = angular.extend({},current);
			}

			$scope.showSimpleToast = function(message) {
				var pinTo = $scope.getToastPosition();

				$mdToast.show(
						$mdToast.simple()
								.textContent(message)
								.position(pinTo )
								.hideDelay(3000)
				);
			};

			$scope.showConfirm = function(ev, username) {
				var confirm = $mdDialog.confirm()
						.title('Biztos, hogy törli?')
						.textContent('Törlés után az adatok nem visszaállíthatóak...')
						.ariaLabel('Törlés')
						.targetEvent(ev)
						.ok('Igen')
						.cancel('Nem');

				$mdDialog.show(confirm).then(function() {
					$scope.deleteUser(username)
				}, function() {
				});
			};
		});
	</script>

</head>
<body style="overflow: hidden;">
	<div data-ng-app="register" data-ng-controller="regController">
		<h2>Registration</h2>
		<div>
			<md-input-container>
				<label>Username</label> <input type="text" data-ng-model="rusername"><br />
			</md-input-container>
		</div>
		<div>
			<md-input-container>
				<label>Credit</label> <input type="text" data-ng-model="rcredit"><br />
			</md-input-container>
		</div>
		<md-input-container>
			<label>Iskola</label>
			<md-select ng-model="rschool" class="md-no-underline" required md-no-asterisk="false">
				<md-option value="{{school.key}}" data-ng-repeat="school in schools">{{school.value}}</md-option>
			</md-select>
		</md-input-container>
		<div class="demo-select-all-checkboxes" flex="100" ng-repeat="color in colors">
			<md-checkbox ng-checked="color.enabled" ng-click="color.enabled = !color.enabled">
				{{ color.colorCode }}
			</md-checkbox>
		</div>
		<md-radio-group ng-model="sex">

			<md-radio-button value="MALE">Male</md-radio-button>
			<md-radio-button value="FEMALE"> Female </md-radio-button>

		</md-radio-group>


		<md-button class="md-raised"data-ng-click="register()">Register</md-button>

		<h2>Users:</h2>
		<div class='md-padding' layout="row">
			<div class="parent" layout="column" ng-repeat="user in users" flex>
				<md-card>
					<md-card-header>
						<md-card-header-text>
							<span class="md-title">{{user.username}}</span>
							<span class="md-subhead">{{user.credit}}</span>
						</md-card-header-text>
					</md-card-header>
					<md-card-title>
						<md-card-title-text>
							<span class="md-headline">{{user.school}}</span>
						</md-card-title-text>
					</md-card-title>
					<md-card-actions layout="row" layout-align="start center">
						<md-button data-ng-click="showConfirm($event, user.username)">Törlés</md-button>
					</md-card-actions>
				</md-card>
			</div>
		</div>

	</div>


</body>
</html>