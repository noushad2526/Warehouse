<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<title>Update Product</title>
</head>
<body class="bg-light">
	<form action="${pageContext.request.contextPath}/saveOrUpdateStore" method="post">
		<div class="card">
			<h2 class="card-header bg-info">Edit Store</h2>
			<div class="card-body bg-light">
				<h4 class="card-subtitle mb-2 text-muted">Edit Store Details</h4>
				<br>
				<div class="row g-3">
						<input type="hidden" class="form-control" name="storeId" id="storeId" value="${store.getStoreId()}"/>
					<div class="col">
						<label for="storeName" class="form-label">Edit Store Name</label>
						<input type="text" class="form-control" name="storeName" id="storeName" value="${store.getStoreName()}" />
					</div>
					<div class="col">
						<label for="storeType" class="form-label" >Edit Store type</label>
						<input type="text" class="form-control" name="storeType" id="storeType" value="${store.getStoreType()}"/>
					</div>
					<div class="col">
						<label for="storeAddress" class="form-label" >Edit Store Address</label>
						<input type="text" class="form-control" name="storeAddress" id="storeAddress" value="${store.getStoreAddress()}"/>
					</div>
				</div>
			</div>
		</div>
		<h2 class="card-header bg-info">Edit Product</h2>
			<div class="card-body bg-light">
				<h4 class="card-subtitle mb-2 text-muted">Edit Product Details</h4>
				
		<div style="text-align: right">
			<button type="button" class="btn btn-primary" id="add" style="text-align:right">Add Rows</button>
		</div>
		<table>
			<thead>
				<tr class="d-inline-flex p-2">
					<td>&emsp;Edit Product Name&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&ensp;</td>
					<td>Edit Product Price&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&ensp;&ensp;&nbsp;</td>
					<td>Edit Product Qty</td>
				</tr>
			</thead>
			<tbody id="dynamicrow">
				<c:forEach items="${products}" var="product" varStatus="index">
					<tr class="row">
						<td>
								<input type="hidden" class="form-control" name="products[${index.count-1}].productId" id="productId" value="${product.getProductId() }"/>
							</td>
						<td><div class="col">
								<input type="text" class="form-control" name="products[${index.count-1}].productName" id="productName" value="${product.getProductName() }"/>
							</div></td>
						<td><div class="col">
								<input type="text" class="form-control" name="products[${index.count-1}].productPrice" id="productPrice" value="${product.getProductPrice() }"/>
							</div></td>
						<td><div class="col">	
								<input type="text" class="form-control" name="products[${index.count-1}].productQty" id="productQty" value="${product.getProductQty() }"/>
							</div></td>
						<td><div class="col">
							<a href="${pageContext.request.contextPath}/deleteProductOnUpdate/${product.getProductId() }/${product.getStoreId().getStoreId() }"><input type="button" class="btn btn-danger" value="Delete"/></a>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<input type="submit" value="Submit" class="btn btn-primary" />&emsp;<a
			href="${pageContext.request.contextPath}/getAllProducts"><input type="button"
			value="Cancel" class="btn btn-danger" /></a>
	</form>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
								var i = ${fn:length(products)-1};
							$('#add')
									.click(
											function() {
												i++;
												$('#dynamicrow')
														.append(
																'<tr id="row'+i+'" class="row"><td><div class="col"><input type="text" class="form-control" name="products['+i+'].productName" id="productName" /></div></td><td><div class="col"><input type="text" class="form-control" name="products['+i+'].productPrice" id="productPrice" /></div></td><td><div class="col">	<input type="text" class="form-control" name="products['+i+'].productQty" id="productQty" /></div></td><td>	<div class="col"><button type="button" id="'+i+'" class="remove_row btn btn-danger">Remove</button></div></td></tr>');
											});
							$(document).on('click', '.remove_row', function() {
								var row_id = $(this).attr("id");
								i--;
								$('#row' + row_id + '').remove();
							});
						});
	</script>
	
</body>
</html>