<div ng-controller="displayQuestion as displayQuestion">
<h1> myquestions.com</h1>
<div id="userlogin">
<button onclick="imageClick('login.jsp')">Login</button>
<button onclick="imageClick('signup.jsp')">New User? Click Here for Register</button>

</div>


<div id="placeholder"></div>
<div class="box">
  <div class="container-1">
      <span class="icon"><i class="fa fa-search"></i></span>
      <input type="search" id="search" placeholder="Search..." />
  </div>
</div>


<div id="header">
<h2> Top Questions</h2>
</div>
<h2>Display Questions</h2>
	<div id="content">
		<ul>
			<li class="selected"><a href="display.jsp">All questions</a></li>
		</ul>
	</div>
	<table border="2" style='width: 100%'>
			<tr ng-repeat="for x in questions">
				<td>
					<ul>
						<li>Title:<a href="rest/questions/"></a>{{x.id}}</li>
					</ul>
					<ul>
						<li>Questionid:{{x.Questionid}}</li>
					</ul>
					<ul>
						<li>Posted on: {{x.postedon}}</li>
					</ul>
					<ul>
						<li>Username:{{x.Username}}</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>