<div ng-controller="UserController as userController">
<h2>Users</h2>
		<div ng-show="loading"><img src="images/loading.gif"></img></div>
		<table style="width: 400px">
			<tr ng-repeat="user in users">
				<td>{{user.userName}}</td>
				<td>{{user.email}}</td>
				<td><a href='#' ng-click="editUser(user)">Edit</a></td>
			</tr>
		</table>
		{{error}}
		Showing {{users.length}} users
<!-- 		<input type="button" value="Add User" ng-click="showAddForm=true"></input> -->
<!-- 		<div ng-show="showAddForm || showEditForm"> -->
<!-- 			<form novalidate> -->
<!-- 				<input type="text" ng-model="user.userName"></input> -->
<!-- 				<input type="text" ng-model="user.email"></input> -->
<!-- 				<input type="button" value="Cancel" ng-click="showAddForm=false"></input> -->
<!-- 				<input type="button" value="Update" ng-show="showEditForm" ng-click="updateUser(user)"></input> -->
<!-- 				<input type="button" value="Save" ng-show="showAddForm" ng-click="addUser()"></input> -->
<!-- 			</form> -->
<!-- 		</div> -->
	</div>
	
	<div ng-controller="addcontroller">
	<input type="button" value="Add User" ng-click="showAddForm=true"></input>
		<div ng-show="showAddForm || showEditForm">
			<form novalidate>
				<input type="text" ng-model="user.userName"></input>
				<input type="text" ng-model="user.email"></input>
				<input type="button" value="Cancel" ng-click="showAddForm=false"></input>
				<input type="button" value="Update" ng-show="showEditForm" ng-click="updateUser(user)"></input>
				<input type="button" value="Save" ng-show="showAddForm" ng-click="addUser()"></input>
			</form>
		</div>
	</div>