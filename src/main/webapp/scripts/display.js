(function() {
	var app = angular.module("blogger", [ 'ngRoute' ]);
	app.config([ '$routeProvider', '$locationProvider',
			function($routeProvider, $locationProvider,$routeParams) {
				$routeProvider.when('/login', {
					templateUrl : 'login.jsp',
					controller : 'logincontroller'
				}).when('/signup', {
					templateUrl : 'signup.jsp',
					controller : 'SignupController'
				}).when('/', {
					templateUrl : 'home.jsp',
					controller : 'displayview'
				}).when('/home', {
					templateUrl : 'home.jsp',
					controller : 'displayview'
				}).when('/post', {
					templateUrl : 'post.jsp',
					controller : 'postview'
				}).when('/logout', {
					templateUrl : 'logout.jsp',
					controller : 'logout'
				}).when('/:myitemid', {
					templateUrl : 'displayQuestion.jsp',
					controller : 'displayQuestion'
				}).otherwise({
					redirectTo : 'home.jsp'
				});
			} ]);
	app.filter('startFrom', function() {
		return function(input, start) {
			if (!input || !input.length) { return; }
//			start = +start;
			return input.slice(start);
		}
		
	});
	
	
	app.controller("displayview", function($http, $scope, $log,$rootScope) {
		var controller = this;
		$scope.questions = {};
		$scope.loading = true;
		$scope.name=$rootScope.myusername;
		$log.debug("Getting users...");
		//http://www.w3schools.com/angular/customers.php
		$http.get("rest/question/all").then(
				function(response, status, headers, config) {
					$scope.information = response.data;
				}, function(data, status, headers, config) {
					$scope.content = "something went wrong";
					$scope.error = status;
				});
		$scope.currentPage = 0;
		$scope.pageSize = 5;
		$scope.numberOfPages = function() {
			if ($scope.information.length){
			return Math.ceil($scope.information.length
					/ $scope.pageSize);
			}
		}
	});
	
	//GET Question by ID
	app.controller("displayQuestion",function($http, $scope, $routeParams, $location, $rootScope,$route,$log){
		$scope.cancelQuestion = function() {
			$location.url('/');
		}
		 $http.get("rest/question/id/"+$routeParams.myitemid).then(function successCallBack(response, status, headers, config) {
				console.log(response);
				$scope.getresponse = response.data;
				$scope.title=$scope.getresponse.title;
				$log.info($scope.title);
				$scope.question=$scope.getresponse.description;
				$log.info($scope.question);
			},function errorCallBack(reason, status, headers, config) {
			$scope.content = "something went wrong";
			$scope.error = reason.data;
		});

	});

	//Logout functionality
	app.controller("logout",function($http, $scope, $routeParams, $location, $rootScope,$route){
		if ($rootScope.myusername){
			$rootScope.myusername=null;
		}
	});

	// POST functionality
	app.controller("postview", function($http, $scope, $log, $location, $rootScope) {
						
		$scope.cancelQuestion = function() {
							$location.url('/');
						}
						
						$scope.postQuestion = function() {
							if ($rootScope.myusername){
							$http.defaults.headers.common['Authorization'] = $rootScope.authHeader;
							var jsondata={
									title:$scope.QuestnAns.Title,
								description:$scope.QuestnAns.description,
								username:$rootScope.myusername,
								answers:"0"
									
							};
							console.log(jsondata);
							var res=$http.post("rest/question/create",jsondata);
							res.success(function(response,status, headers) {
												console.log(response);
												console.log("Question succesfully posted ");
												$location.url('/');
											});
							res.error(function(data,status, headers, config) {
												if (parseInt(data.status) != 200) {
													alert("There is problem in creating the question. Kindly report");
												}
						});
						}	
						else {
							alert("You have not logged in. You must log in to post a question!!!");
							
						} 
						}
	});

	// Signup functionality
	app.controller("SignupController",
					function($http, $scope, $log, $location, $rootScope) {
						$scope.cancelSignup = function() {
							$location.url('/');
						}
						$scope.postSignup = function() {
							$http.post("rest/auth/signup", $scope.user)
									.success(
											function(data) {
												if (data.signupDone == true) {
													$rootScope.myusername = data.username;
													alert("Login Successfully created with the username:"
															+ data.username);
													$location.url('/');
												}
												if (data.signupDone == false) {
													alert("Error: "
															+ data.errorMsg);
												}
											});
						}
					});

	// Login functionality
	app
			.controller(
					"logincontroller",
					function($scope, $log, $http, $location, $rootScope) {
						$scope.cancelUser = function() {
							$location.url('/');
						}

						$scope.loginUser = function() {
							$rootScope.authHeader = 'Basic '
									+ btoa($scope.user.name + ":"
											+ ($scope.user.password));
							console.log($rootScope.authHeader);
							$rootScope.myusername=$scope.user.name;
							$http.defaults.headers.common['Authorization'] = $rootScope.authHeader;
							$http.get("rest/auth/login/" + $scope.user.name,$scope.user)
									.then(
											function successCallback(response,
													status, headers) {
												console.log("Login success: "
														+ response.status);
												$rootScope.myusername = response.data.username
												alert("Welcome: "
														+ response.data.firstname);
												$location.url('/');

											},
											function errorCallback(data,
													status, headers, config) {
												if (parseInt(data.status) != 200) {
													alert("The user credentials are not valid, Kindly check your username and password.")
												}

											});
						}
					});
})();