<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.vehicle.model.Customer"%>

<%
Customer customer = (Customer) request.getAttribute("customer");

if (customer == null) {
	response.sendRedirect("CustomerServlet");
	return;
}
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Edit Customer</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.page-header {
	background: white;
	padding: 20px 30px;
	border-radius: 15px;
	margin: 30px auto;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.page-title {
	font-size: 32px;
	font-weight: 700;
	color: #0d2a5e;
}

.edit-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
}

.form-label {
	font-weight: 600;
}

.btn-update {
	background: #0d6efd;
	color: white;
	border: none;
}

.btn-update:hover {
	background: #0b5ed7;
	color: white;
}

.btn-back {
	background: #6c757d;
	color: white;
	border: none;
}

.btn-back:hover {
	background: #5a6268;
	color: white;
}
</style>

</head>

<body>

	<div class="container">

		```
		<div class="page-header">

			<h2 class="page-title">
				<i class="bi bi-pencil-square"></i> Edit Customer Details
			</h2>

		</div>

		<div class="row justify-content-center">

			<div class="col-md-8">

				<div class="edit-card">

					<form action="CustomerServlet" method="post">

						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="customerId"
							value="<%=customer.getCustomerId()%>">

						<div class="mb-3">

							<label class="form-label"> Customer Name </label> <input
								type="text" name="customerName" class="form-control"
								value="<%=customer.getCname()%>" required>

						</div>

						<div class="mb-3">

							<label class="form-label"> Mobile Number </label> <input
								type="text" name="mobile" class="form-control"
								value="<%=customer.getCmobile()%>" required>

						</div>

						<div class="mb-3">

							<label class="form-label"> Email Address </label> <input
								type="email" name="email" class="form-control"
								value="<%=customer.getEmail()%>">

						</div>

						<div class="mb-4">

							<label class="form-label"> Address </label>

							<textarea name="address" rows="4" class="form-control"><%=customer.getAddress()%></textarea>

						</div>

						<div class="d-flex gap-2">

							<button type="submit" class="btn btn-update">

								<i class="bi bi-check-circle"></i> Update Customer

							</button>

							<a href="CustomerServlet" class="btn btn-back"> <i
								class="bi bi-arrow-left"></i> Back

							</a>

						</div>

					</form>

				</div>

			</div>

		</div>
		```

	</div>

</body>
</html>
