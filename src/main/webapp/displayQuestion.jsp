<div ng-controller="displayQuestion as displayQuestion">
<%-- <%@include file="mainmenu.jsp" %> --%>
<table width="900">
<h1> iAsk</h1>
<tr>
<td class="TitleAndDescriptionTable" height="50">
<label> Title: </label>
<label id="formatQuestion"></label>
{{title}}
</td>
</tr>

<tr> 
<td height="150">
<label> Question: </label>
<div id ="QuestionText"></div>
{{question}}
</td>
</tr>

<tr>
<td>
<label for="Ans" id="Ans">Answer:</label></td>
</td>
<td>
<textarea id="Answer" rows="10" cols="10" ng-model="answercomment">
</textarea>
</td>
</tr>
</table>
<input name="regbutton" id="postqu" type="button" class="button" value="Post Your Answer" />
