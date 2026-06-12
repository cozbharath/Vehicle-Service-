<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service History</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.page-card {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
}

.page-title {
	font-size: 40px;
	font-weight: bold;
	color: #041233;
	margin-bottom: 25px;
}

.search-box {
	margin-bottom: 20px;
}

.table th {
	background: #1f2937;
	color: white;
}

.badge-completed {
	background: #198754;
}

.badge-progress {
	background: #ffc107;
	color: black;
}

.badge-delivered {
	background: #0d6efd;
}

.badge-pending {
	background: #dc3545;
}
</style>

</head>

<body>

	<%@ include file="receptionistNavbar.jsp"%>

	<div class="page-card">

		<h2 class="page-title">
			<i class="bi bi-clock-history"></i> Service History
		</h2>

		<div class="row search-box">

			<div class="col-md-4">
				<input type="text" class="form-control"
					placeholder="Search Customer Name">
			</div>

			<div class="col-md-4">
				<input type="text" class="form-control"
					placeholder="Search Vehicle Number">
			</div>

			<div class="col-md-4">
				<button class="btn btn-primary w-100">
					<i class="bi bi-search"></i> Search
				</button>
			</div>

		</div>

		<table class="table table-bordered table-hover">

			<thead>

				<tr>
					<th>Booking ID</th>
					<th>Customer Name</th>
					<th>Vehicle Number</th>
					<th>Service Type</th>
					<th>Booking Date</th>
					<th>Completion Date</th>
					<th>Status</th>
				</tr>

			</thead>

			<tbody>

				<tr>
					<td>101</td>
					<td>Ramesh</td>
					<td>TS09AB1234</td>
					<td>Oil Change</td>
					<td>01-Jun-2026</td>
					<td>02-Jun-2026</td>
					<td><span class="badge badge-completed"> Completed </span></td>
				</tr>

				<tr>
					<td>102</td>
					<td>Suresh</td>
					<td>TS10CD5678</td>
					<td>Engine Repair</td>
					<td>03-Jun-2026</td>
					<td>06-Jun-2026</td>
					<td><span class="badge badge-delivered"> Delivered </span></td>
				</tr>

				<tr>
					<td>103</td>
					<td>Mahesh</td>
					<td>TS11EF9876</td>
					<td>Brake Service</td>
					<td>05-Jun-2026</td>
					<td>-</td>
					<td><span class="badge badge-progress"> In Progress </span></td>
				</tr>

			</tbody>

		</table>

	</div>

	</div>

</body>
</html>