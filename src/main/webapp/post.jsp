<div ng-controller="postview as postview">
<table>
<tr>
<td class="ask-title-cell-key">
<label for="title">Title</label></td>
<td>
<input type="text" id="title" name="Title" rows="4" cols="50" ng-model="QuestnAns.Title">
<!--<input type="submit" value="Submit">-->
</td>

</tr>
<tr>
<td>
<label for="Des" id="des">Description</label></td>
</td>
<td>
<textarea id="description" rows="12" cols="50" ng-model="QuestnAns.description">
</textarea>
</td>

</tr>
<tr>
<td>

</td>
</tr>
</table>
<input name="regbutton" id="postqu" type="button" class="button" value="Post Question" ng-click="postQuestion()"  />
<input name="cancelbutton" id="cancelqu" type="button" class="button" value="Cancel" ng-click="cancelQuestion()"  />
</div>