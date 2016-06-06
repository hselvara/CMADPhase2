<div ng-controller ="logincontroller as logincontroller" id="login-form">
<img src="iask.png" alt="iAsk.com ">
<h1>iAsk login</h1>
    <form action="" method="post" name="signup/login" class="register">
        <fieldset>
            <div class="login-form">
                <b>Username:</b><input name="username" id="username" ng-model="user.name" /></br>
                <b>Password:</b><input name="password" type="password" id="password" ng-model="user.password" />
            </div>
			<input name="login" type="button" id="post-btn" class="button" value="login" ng-click="loginUser()" />
			<input name="cancel" type="button" id="cancel-btn" class="button" value="cancel" ng-click="cancelUser()" />

        </fieldset>
    </form>
    </div>
</div>

