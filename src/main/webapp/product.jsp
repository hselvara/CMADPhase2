	
	<div ng-controller="productcontroller as productcontroller">
		<div ng-show="loading"><img src="images/loading.gif"></img></div>
		<h2>Product Details</h2>
		<table style="width: 400px border=1px">
			<tr ng-repeat="i in product">
				<td>{{i.productName}}</td>
				<td>{{i.productPrice}}</td>
			</tr>
		</table>
		</div>