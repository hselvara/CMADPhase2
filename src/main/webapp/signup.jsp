<div ng-controller="SignupController as SignupController">
	<h1>iAsk Signup</h1>
	<img src="iask.png" alt="iAsk.com ">
	    <form action="" method="post" name="signup/login" class="register">
        <fieldset>
            <div class="login-form">
                <b>First Name: </b><input name="username" id="username" ng-model="user.firstname" /></br>
                <b>Last Name : </b><input name="username" id="username" ng-model="user.lastname" /></br>
                <b>User Name : </b><input name="username" id="username" ng-model="user.name" /></br>
                <b>Password  :  </b><input name="password" type="password" id="password" ng-model="user.password" /></br>
                <b>Email ID  :    </b><input name="username" id="username" ng-model="user.email" /></br>
            </div>
			<input name="submit" type="button" id="post-btn" class="button" value="Signup" ng-click="postSignup()" />
			<input name="cancel" type="button" id="cancel-btn" class="button" value="cancel" ng-click="cancelSignup()" />

        </fieldset>
    </form>
</div>
