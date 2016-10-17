<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>

<!--<div ng-app="myApp" ng-controller="myCtrl">
    <p><input type="text" ng-model="firstName" placeholder="Enter firstname here"></p>
    <p><input type="text" ng-model="lastName" placeholder="Enter lastname here"></p>
    <input type="button" value="Say hello!" ng-click="setFullName()" />
    <h1>Hello {{fullName}}</h1>

    <ul>
        <li ng-repeat="item in array">{{item}}</li>
    </ul>

    <span ng-if="moreThan(3)">More than 3</span>

</div>

<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($http, $scope) {
        $scope.array = ["also", "felso", "uccso"];

        $scope.getRequest = function() {
            $http.get("getJson").then(
                    function(response) {
                        $scope.array = response.data.tomb;
                    },
                    function(response){

                    }
            );
        }

        $scope.moreThan = function(count) {
            return $scope.array.length > count;
        }
        $scope.setFullName = function() {
            $scope.array.push($scope.firstName);
        };
        $scope.getRequest();
    });
</script>-->

</body>
</html>