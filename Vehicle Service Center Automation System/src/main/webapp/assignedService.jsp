<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assigned Services</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
	font-family: Arial, sans-serif;
}

.card-box {
	background: white;
	padding: 35px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.card-box:hover {
	transform: translateY(-5px);
}

.card-box i {
	font-size: 50px;
	color: #2563eb;
	margin-bottom: 15px;
}

.card-box h1 {
	font-size: 42px;
	margin-bottom: 10px;
}

.table-box {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
	margin-top: 25px;
}

.badge {
	font-size: 14px;
	padding: 8px 14px;
}

.table th {
	vertical-align: middle;
}

.table td {
	vertical-align: middle;
}
</style>

</head>

<body>

	<%@ include file="mechanicNavbar.jsp"%>

	<!-- Cards -->

	<div class="row g-4">

		<div class="col-md-4">

			<div class="card-box">

				<i class="bi bi-tools"></i>

				<h1>${totalAssigned}</h1>

				<p>Total Assigned Services</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="card-box">

				<i class="bi bi-check-circle-fill"></i>

				<h1>${completed}</h1>

				<p>Completed Services</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="card-box">

				<i class="bi bi-clock-history"></i>

				<h1>${pending}</h1>

				<p>Pending Services</p>

			</div>

		</div>

	</div>

	<!-- Table -->

	<div class="table-box">

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2>Assigned Vehicle Services</h2>

			<button class="btn btn-primary">
				<i class="bi bi-eye-fill"></i> View All
			</button>

		</div>

		<table class="table table-bordered table-hover">

			<thead class="table-dark">

				<tr>

					<th>Service ID</th>

					<th>Vehicle Number</th>

					<th>Customer Name</th>

					<th>Service Type</th>

					<th>Status</th>

				</tr>

			</thead>

			<tbody>

				<tr>

					<td>SV101</td>

					<td>TS09AB1234</td>

					<td>Ramesh</td>

					<td>Engine Repair</td>

					<td><span class="badge bg-warning text-dark"> Pending </span>
					</td>

				</tr>

				<tr>

					<td>SV102</td>

					<td>TS10CD5678</td>

					<td>Suresh</td>

					<td>Oil Change</td>

					<td><span class="badge bg-success"> Completed </span></td>

				</tr>

				<tr>

					<td>SV103</td>

					<td>TS08EF4321</td>

					<td>Kiran</td>

					<td>Brake Service</td>

					<td><span class="badge bg-primary"> In Progress </span></td>

				</tr>

			</tbody>

		</table>

	</div>

	</div>
	<!-- Closing main-content from mechanicNavbar.jsp -->

</body>
</html>