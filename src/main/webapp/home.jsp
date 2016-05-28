<div ng-controller="displayview as displayview">
	
	<div style='float: right;'>
	<button> <a href="#/post">Ask a question</button>
	</div>
	<div style='float: right;'>
		<button><a href="#/login"> Login </a></button>
	</div>
	
	<div style='float: right;'>
		<button><a href="#/signup">Signup</a></button>
	</div>
	<div style='float: right;'>
		<button id="logoutbutton">Logout</button>
	</div>
	<div id="greet">
		Welcome {{myusername}}
	</div>
<img src="iask.png" alt="iAsk.com ">

		<div class="container-1" id="placeholder">
			<span class="icon"><i class="fa fa-search"></i></span>
			 <input	type="search" id="search" placeholder="Search..." ng-model="mysearch" 	/>
		</div>

	<div id="header">
		<h2>Top Questions</h2>
	</div>

	<div id="content">
		<div id="navigation-buttons">
			<button ng-disabled="currentPage == 0"
				ng-click="currentPage=currentPage-1">Previous</button>
			{{currentPage+1}}/{{numberOfPages()}}
			<button
				ng-disabled="currentPage >= information.length/pageSize - 1"
				ng-click="currentPage=currentPage+1">Next</button>
		</div>
		<div id="tab-container"></div>
		<div id="main-container">
			<table border=2 style='width: 100%'>
				<tr
					ng-repeat="item in information |startFrom:currentPage*pageSize | limitTo:pageSize | filter:mysearch"">
					<td>
						<ul>
							Title:
							<a href="#/{{item.id}}">{{item.title}}</a>
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