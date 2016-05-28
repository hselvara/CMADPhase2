<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="scripts/angular.js"></script>
</head>
<body ng-app="myapp">

<div ng-controller="UserController"><!-- view -->
<div ng-show="myvalue"><img src="images/loading.gif"></img></div>
<div >

<table border="1">
<tr ng-repeat="i in users">
<td>
{{i.name}}</td>
<td>
{{i.age}}
</td>
</tr>
</table>
<!-- showing {{users.length}} users -->
</div>


</div>
<h2>{{helloTo.title}}!</h2><!-- view -->

<script>


// angular.module("myapp",[]).controller("UserController",/*controller function*/function($scope){//model
// 	$scope.users={};
// 	$scope.users[0]={name:"abc",age:29};
// 	$scope.users[1]={name:"xyz",age:49};
	

angular.module("myapp",[]).controller("UserController",function($http, $scope){//model
	$scope.myvalue=true;
	$scope.users=[];
	//http://localhost:8080/AngularDynWeb/rest/user
		$http.get("rest/user").success(function(data,status,headers,config){
		$scope.myvalue=false
		$scope.users=data;
	}).
	
	error(function(data,status,headers,config){
		$scope.myvalue=false
	});
	
});
</script>
</body>
</html>