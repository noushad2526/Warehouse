<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<title>Warehouse</title>
</head>
<body class="bg-light">
	<div class="card">
		<h2 class="card-header bg-blue" style="text-align:center">Warehouse Home Page</h2>
		<div class="card-body bg-light">
	<form action="search" method="post">
		<div class="row">
			<div class="col-2">
				<input type="text" class="form-control mb-3" name="storeName" id="storeName" placeholder="Search By Store Name"/>
			</div>
			<div class="col-2">
				<input type="text" class="form-control mb-3" name="storeType" id="storeType" placeholder="Search By Store Type"/>
			</div>
			<div class="col-2">
				<input type="text" class="form-control mb-3" name="productName" id="productName" placeholder="Search By Product Name"/>
			</div>
			<div class="col">
				<input type="submit" value="Search" class="btn btn-primary" />
				<a href="${pageContext.request.contextPath}/getAllProducts">
					<input type="button" value="All Products" class="btn btn-primary" />
				</a>
				<a href="${pageContext.request.contextPath}/addProduct">
					<input type="button" value="Create" class="btn btn-success float-right">
				</a>
			</div>
		</div>
		
	</form>
	<div> 
		<input type="text" class="form-control mb-3" id="myInput" placeholder="Quick search"/>
	</div>
	<table class="table table-info table-hover">
		<tr class="bg-info">
			<th>Store Name</th>
			<th>Store Type</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>Product Qty</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<tbody id="myTable">
		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.getStoreId().getStoreName()}</td>
				<td>${product.getStoreId().getStoreType()}</td>
				<td>${product.getProductName()}</td>
				<td>${product.getProductPrice()}</td>
				<td>${product.getProductQty()}</td>
				<td><a href="editProduct/${product.getStoreId().getStoreId() }"><button class="btn btn-warning">Edit</button></a></td>
				<td><a href="deleteProduct/${product.getProductId() }/${product.getStoreId().getStoreId() }"><button class="btn btn-danger">Delete</button></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
</body>
</html>