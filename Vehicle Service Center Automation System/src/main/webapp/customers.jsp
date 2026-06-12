<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.Customer"%>

<%
List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.page-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	margin-bottom: 25px;
}

.page-title {
	font-size: 32px;
	font-weight: bold;
	color: #0d6efd;
	margin-bottom: 25px;
}

.form-label {
	font-weight: 600;
}

.form-control {
	height: 50px;
	border-radius: 10px;
}

.form-control:focus {
	box-shadow: 0px 0px 8px rgba(13, 110, 253, 0.3);
}

.btn-save {
	height: 50px;
	font-size: 18px;
	font-weight: 600;
	border-radius: 10px;
}

.stats-card {
	background: white;
	padding: 25px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.stats-card:hover {
	transform: translateY(-5px);
}

.stats-card i {
	font-size: 45px;
	color: #0d6efd;
}

.stats-card h2 {
	font-weight: bold;
	margin-top: 10px;
}

.search-box {
	background: white;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	margin-bottom: 25px;
}

.table-box {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
}

.table-box h3 {
	margin-bottom: 20px;
	font-weight: bold;
}

.table th {
	text-align: center;
}

.action-btn {
	margin: 2px;
}
</style>

</head>

<body>

	<%@ include file="receptionistNavbar.jsp"%>

	<div class="container-fluid mt-4">

		<!-- Statistics Section -->

		<div class="row g-4">

			<div class="col-md-4">
				<div class="stats-card">
					<i class="bi bi-people-fill"></i>
					<h2>
						<%=request.getAttribute("totalCustomers") != null ? request.getAttribute("totalCustomers") : 0%>
					</h2>
					<p>Total Customers</p>
				</div>
			</div>

			<div class="col-md-4">
				<div class="stats-card">
					<i class="bi bi-person-plus-fill"></i>
					<h2>
						<%=request.getAttribute("newCustomers") != null ? request.getAttribute("newCustomers") : 0%>
					</h2>
					<p>New Customers</p>
				</div>
			</div>

			<div class="col-md-4">
				<div class="stats-card">
					<i class="bi bi-car-front-fill"></i>
					<h2>
						<%=request.getAttribute("totalVehicles") != null ? request.getAttribute("totalVehicles") : 0%>
					</h2>
					<p>Registered Vehicles</p>
				</div>
			</div>

		</div>

		<!-- Customer Registration -->

		<div class="page-card mt-4">

			<h2 class="page-title">
				<i class="bi bi-person-plus-fill"></i> Customer Registration
			</h2>

			<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
			%>

			<div class="alert alert-info alert-dismissible fade show">
				<%=msg%>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>

			<%
			}
			%>

			<form action="CustomerServlet" method="post">

				<div class="row">

					<div class="col-md-6 mb-3">

						<label class="form-label">Customer Name</label> <input type="text"
							name="cname" class="form-control"
							placeholder="Enter Customer Name" required>

					</div>

					<div class="col-md-6 mb-3">

						<label class="form-label">Mobile Number</label> <input type="tel"
							name="mobile" maxlength="10" class="form-control"
							placeholder="Enter Mobile Number" required>

					</div>

					<div class="col-md-6 mb-3">

						<label class="form-label">Email Address</label> <input
							type="email" name="email" class="form-control"
							placeholder="Enter Email Address">

					</div>

					<div class="col-md-6 mb-3">

						<label class="form-label">Address</label> <input type="text"
							name="address" class="form-control" placeholder="Enter Address">

					</div>

					<div class="col-md-12">

						<button type="submit" class="btn btn-primary btn-save w-100">

							<i class="bi bi-save-fill"></i> Register Customer

						</button>

					</div>

				</div>

			</form>

		</div>

		<!-- Search Section -->

		<div class="search-box">

			<div class="row g-3">

				<div class="col-md-5">

					<input type="text" class="form-control"
						placeholder="Search By Customer Name">

				</div>

				<div class="col-md-5">

					<input type="text" class="form-control"
						placeholder="Search By Mobile Number">

				</div>

				<div class="col-md-2">

					<button class="btn btn-success w-100 h-100">

						<i class="bi bi-search"></i> Search

					</button>

				</div>

			</div>

		</div>

		<!-- Customer Records -->

		<div class="table-box">

			<h3>
				<i class="bi bi-table"></i> Customer Records
			</h3>

			<table class="table table-bordered table-hover">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Customer Name</th>
						<th>Mobile</th>
						<th>Email</th>
						<th>Address</th>
						<th width="180">Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					if (customerList != null && !customerList.isEmpty()) {

						for (Customer c : customerList) {
					%>

					<tr>

						<td><%=c.getCustomerId()%></td>

						<td><%=c.getCname()%></td>

						<td><%=c.getCmobile()%></td>

						<td><%=c.getEmail()%></td>

						<td><%=c.getAddress()%></td>

						<td><a
							href="CustomerServlet?action=edit&id=<%=c.getCustomerId()%>"
							class="btn btn-warning btn-sm action-btn"> <i
								class="bi bi-pencil-square"></i> Edit

						</a></td>

					</tr>

					<%
					}
					} else {
					%>

					<tr>

						<td colspan="6" class="text-center text-danger">No Customer
							Records Found</td>

					</tr>

					<%
					}
					%>

				</tbody>
			</table>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>