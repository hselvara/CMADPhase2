<div ng-controller="displayQuestion as displayQuestion">
	<div id="myimg" style='text-align: left;'>
		<img src="iask.png">
	</div>
	<table id="displaytable" width="900">
		<tr>
			<td  height="50"><b>Title:</b><br></br>
				 <div id="formatQuestion"> </div> {{title}}
			</td>
		</tr>
		<tr>
			<td height="150"><b>Description:</b> <br></br>
				<div id="QuestionText"></div> {{question}}
			</td>
		</tr>

	</table>
	<input name="cancelbutton" id="cancelqu" type="button" class="button2"
		value="Back to Home" ng-click="cancelQuestion()" />