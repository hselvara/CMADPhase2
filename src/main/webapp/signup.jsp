<div ng-controller="SignupController as SignupController">
	<h1>iAsk Registration</h1>
	<img src="iask.png" alt="iAsk.com ">
	<form action="" method="post" id="customtheme">
		<p>
			<label for="first name">First Name</label> <input type="text"
				name="firstname" id="firstname" ng-model="user.firstname" />
		</p>
		<p>
			<label for="last name">Last Name</label> <input type="text"
				name="lastname" id="lastname" ng-model="user.lastname" />
		</p>

		<p>
			<label for="name">Name</label> <input type="text"
				name="name" id="name" ng-model="user.name" />
		</p>

		<p>
			<label for="password">Password</label>
			 <input name="password" id="password" type="password" ng-model="user.password" />
		</p>

		<p>
			<label for="email">Email</label> <input type="text" name="email"
				id="email" ng-model="user.email" />
		</p>

		<p>
			<input type="button" name="submit" value="Submit" id="submitbutton"
				ng-click="postSignup()" /> 
			<input type="button" name="cancel" value="Cancel" id="cancelbutton" ng-click="cancelSignup()" />
		</p>
	</form>
</div>
