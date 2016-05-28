(function(){
	var app = angular.module('Airlines',['ngRoute']);
	app.config(['$routeProvider',
	               function($routeProvider){
		$routeProvider.
		when('/user',{
			templateUrl:'user.jsp',
			controller:'UserController'
		}).
		when('/product',{
			templateUrl:'product.jsp',
			controller:'productcontroller'
		}).
		otherwise({redirectTo:'/'});
}]);
	app.controller('UserController',function($http, $log, $scope,$rootScope){
		var controller = this;
		$scope.users=[];
		$scope.loading = true;
		$log.debug("Getting users...");
		$http.get('rest/users').
		  success(function(data, status, headers, config) {
			  $scope.users = data;
			  $scope.loading = false;
		  }).
		  error(function(data, status, headers, config) {
			  $scope.loading = false;
			  $scope.error = status;
		  });
		
	
		
		$scope.editUser = function(user){
			console.log(user);
			$scope.user = user;
			$scope.showEditForm=true;
			$scope.showAddForm=false;
		}
		
		$scope.updateUser = function(user){
			$log.debug(user);
			$http.put('rest/user',user).
			  success(function(data, status, headers, config) {
				  console.log(data);
				  $scope.showEditForm=false;
			  }).
			  error(function(data, status, headers, config) {
				  $scope.error = status;
				  $scope.showEditForm=false;
			  });
		}
		

	});
	
	app.controller(
			"productcontroller",
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

	app.controller("addcontroller",function($http,$scope,$rootScope){
		$scope.addUser=function(){
			$http.post("rest/users", $scope.user).success( function(){
				$scope.users.push($scope.user);
				$rootScope.$broadcast('myEvent',$scope.user)
			});
		}
	});
})();
