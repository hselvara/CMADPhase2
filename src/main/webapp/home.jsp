<div ng-controller="displayview as displayview"  class="col-sm-7">
	<div id="myimg" style='text-align: left;'>
		<img src="iask.png">
	</div>
	<div style='float: right;'>
		<div ng-model="name">

			<button ng-show="name">
				<a href="#/post">Ask a question</a>
			</button>
			<button ng-show="name">
				<a href="#/logout">Logout</a>
			</button>
		</div>
	</div>
	<div style='text-align: right;'>
	<div ng-model="name">
		<button ng-hide="name">
			<a href="#/login"> Login </a>
		</button>
		<button ng-hide="name">
			<a href="#/signup">Signup</a>
		</button>
	</div>
	</div>
	<br></br>
	<div style='float: right;' id="greet" ng-model="myusername">
		<div ng-show="myusername">Welcome <b>{{myusername}} </b></div>
	</div>
	<div>
	<table border: 16px ridge(5,10,1)>
	<tr>
	<td>
	<strong>iask.com</strong> is a community of bloggers just like you and me by helping each other.<br></br>
	Join us it only takes few minutes.
	</td>
	</tr>
	</table>
	</div>

	<div class="container-1" id="placeholder">
		<span class="icon"><i class="fa fa-search"></i></span> <input
			type="search" id="search" placeholder="Search..." ng-model="mysearch" />
	</div>

	<div id="header">
		<h2>All Questions</h2>
	</div>

	<div id="content">
		<div id="navigation-buttons">
			<button ng-disabled="currentPage == 0"
				ng-click="currentPage=currentPage-1">Previous</button>
			{{currentPage+1}}/{{numberOfPages()}}
			<button ng-disabled="currentPage >= information.length/pageSize - 1"
				ng-click="currentPage=currentPage+1">Next</button>
		</div>

		<div id="main-container">
			<table  style='width: 100%;align:center;border:1px;border-top-style: solid;'>
				<tr 
					ng-repeat="item in information |startFrom:currentPage*pageSize | limitTo:pageSize| filter:mysearch">
					<!-- 					 | filter:mysearch" -->

					<td style='border:1px ;border-bottom-style: solid; '>
						<ul>
							Title:
							<a href="#/{{item.id}}"><b>{{item.title}}</b></a>
						</ul>
						<ul>Description:{{item.description}}
						</ul>
						<ul>UserName: {{item.username}}
						</ul>
						<ul>No of Answers:{{item.answers}}
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>