<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="scripts/angular.js"></script>

</head>
<body ng-app="myapp">
	<div ng-controller="UserController">
		<!-- view -->
		<div ng-show="myvalue">
			<img src="images/loading.gif"></img>
		</div>


		<table border="1">
			<tr ng-repeat="i in users">
				<td>{{i.name}}</td>
				<td>{{i.email}}</td>
			</tr>
		</table>
		<!-- showing {{users.length}} users -->
		<button ng-click="addmyuser()">AddUser</button>

		<!-- <div ng-click="myAddUserValue=false"> -->
		<form ng-show="myAddUserValue">
			<fieldset>
				<div class="login-form">
					<label for="usernname"><b>Username:</b></label> <input
						name="username" id="username" ng-model="user.name" />
				</div>
				<div class="login-form">
					<label for="Age"><b>Age:</b></label> <input name="age" id="age"
						ng-model="user.age" />
				</div>
				<button ng-click="post()">Add</button>
				<button ng-click="cancel()">cancel</button>
			</fieldset>
		</form>
	</div>

	<h2>{{helloTo.title}}!</h2>
	<!-- view -->
	
	<div ng-controller="ProductController">
	<table border="1">
			<tr ng-repeat="i in users">
				<td>{{i.id}}</td>
				<td>{{i.version}}</td>
			</tr>
		</table>
</div>
	<script>
		angular.module("myapp", []).controller(
				"UserController",
				function($http, $scope) {//model
					$scope.myvalue = true;
					$scope.myAddUserValue = false;
					$scope.users = [];

					$scope.addmyuser = function() {
						console.log("hihjh");
						$scope.myAddUserValue = true;
					}
					//http://localhost:8080/AngularDynWeb/rest/user
// 					$http.get("rest/user").success(
// 							function(data, status, headers, config) {
// 								$scope.myvalue = false
// 								$scope.users = data;
// 							}).

// 					error(function(data, status, headers, config) {
// 						$scope.myvalue = false
// 					});

					$scope.post=function(){
						$http.post("rest/user", $scope.user).success( function(){
							$scope.users.push($scope.user);
						})
						$scope.myAddUserValue = false;
					}
					$scope.cancel=function(){
						$scope.myAddUserValue = false;
						
					}
				});
		
		angular.module("myapp", []).controller(
				"ProductController",
				function($http, $scope) {//model
				
					$scope.product = [];
					//http://localhost:8080/AngularDynWeb/rest/user
					$http.get("product.json").success(
							function(data, status, headers, config) {
								$scope.product = data;
							}).

					error(function(data, status, headers, config) {
						//$scope.myvalue = false
					});
				});
	</script>
</body>
</html>