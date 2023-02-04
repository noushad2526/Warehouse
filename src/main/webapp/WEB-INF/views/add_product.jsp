<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>Add Product</title>
</head>
<body class="bg-light">
	<form action="saveOrUpdateStore" method="post">
		<div class="card">
			<h2 class="card-header bg-info">Add Store</h2>
			<div class="card-body bg-light">
				<h4 class="card-subtitle mb-2 text-muted">Enter Store Details</h4>
				<br>
				<div class="row g-3">
					<div class="col">
						<label for="storeName" class="form-label">Enter Store Name</label>
						<input type="text" class="form-control" name="storeName" id="storeName"/>
						
					</div>
					<div class="col">
						<label for="storeType" class="form-label">Enter Store type</label>
						<input type="text" class="form-control" name="storeType" id="storeType"/>
					</div>
					<div class="col">
						<label for="storeAddress" class="form-label">Enter Store Address</label>
						<input type="text" class="form-control" name="storeAddress" id="storeAddress"/>
					</div>
				</div>
			</div>
		</div>
		<h2 class="card-header bg-info">Add Product</h2>
			<div class="card-body bg-light">
				<h4 class="card-subtitle mb-2 text-muted">Enter Product Details</h4>
			
		<div style="text-align: right">
			<button type="button" class="btn btn-primary" id="add" style="text-align:right">Add Rows</button>
		</div>
		<table>
			<thead>
				<tr class="d-inline-flex p-2">
					<td>&emsp;Enter Product Name&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&ensp;</td>
					<td>Enter Product Price&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&ensp;&ensp;&nbsp;</td>
					<td>Enter Product Qty</td>
				</tr>
			</thead>
			<tbody id="dynamicrow">
				<tr class="row">
				<td><div class="col">
						<input type="text" class="form-control" name="products[0].productName" id="productName" />
					</div></td>
				<td><div class="col">
						<input type="text" class="form-control" name="products[0].productPrice" id="productPrice" />
					</div></td>
				<td><div class="col">	
						<input type="text" class="form-control" name="products[0].productQty" id="productQty" />
					</div></td>
				</tr>
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
							var i = 0;
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
		
		//validation for storeName
		$(document).ready(function(){
			 var count = 0;
			  $("#storeName").blur(function(){
			    var storeNameVal = $("#storeName").val();
			    $.ajax({
			      url: "${pageContext.request.contextPath}/duplicateStore",
			      dataType:"json", 
			      success: function(result){
			        var storeExists = false;
			        $.each(result,function(i,value){ 
			          if(storeNameVal == value) {
			            storeExists = true;
			          }
			        });
			        if(storeExists) {
			          if(count==0){
			        	  $("#storeName").after('<span class="error" style="color:#ff0000">Store is already registered!</span>');
			        	  count++;
			          }
			          
			        } else {
			          $(".error").remove();
			          count=0;
			        }
			      }
			    });
			  });
			});
	</script>
</body>
</html>