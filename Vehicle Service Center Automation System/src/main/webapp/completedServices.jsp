<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.CompletedService"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Completed Services</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.card-box {
	background: white;
	padding: 35px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	height: 220px;
}

.card-box i {
	font-size: 50px;
	color: #198754;
	margin-bottom: 15px;
}

.card-box h1 {
	font-size: 42px;
	font-weight: bold;
}

.table-box {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	margin-top: 25px;
}

.page-title {
	font-size: 40px;
	font-weight: bold;
	color: #041233;
	margin-bottom: 25px;
}

.table th {
	background: #1f2937;
	color: white;
	text-align: center;
}

.badge-completed {
	background: #198754;
	font-size: 14px;
	padding: 8px 12px;
}
</style>

</head>

<body>

	<%@ include file="mechanicNavbar.jsp"%>

	<h2 class="page-title">
		<i class="bi bi-check-circle-fill"></i>
		Completed Services
	</h2>

	<div class="row g-4">

		<div class="col-md-6">

			<div class="card-box">

				<i class="bi bi-check-circle-fill"></i>

				<h1>
					<%=request.getAttribute("totalCompletedServices") != null ? request.getAttribute("totalCompletedServices") : 0%>
				</h1>

				<p>Total Completed Services</p>

			</div>

		</div>

		<div class="col-md-6">

			<div class="card-box">

				<i class="bi bi-currency-rupee"></i>

				<h1>
					₹
					<%=request.getAttribute("totalRevenue") != null
		? request.getAttribute("totalRevenue")
		: 0%>
				</h1>

				<p>Total Revenue Generated</p>

			</div>

		</div>

	</div>

	<div class="table-box">

		<h3 class="mb-4">Completed Vehicle Services</h3>

		<table class="table table-bordered table-hover">

			<thead>

				<tr>
					<th>Service ID</th>
					<th>Vehicle Number</th>
					<th>Customer Name</th>
					<th>Service Type</th>
					<th>Completed Date</th>
					<th>Amount</th>
					<th>Status</th>
				</tr>

			</thead>

			<tbody>

				<%
				List<CompletedService> list =
				(List<CompletedService>) request.getAttribute("completedServicesList");

				if(list != null && !list.isEmpty()) {

					for(CompletedService cs : list) {
				%>

				<tr>

					<td>SV<%=cs.getBookingId()%></td>

					<td><%=cs.getVehicleNo()%></td>

					<td><%=cs.getCustomerName()%></td>

					<td><%=cs.getServiceType()%></td>

					<td><%=cs.getCompletedDate()%></td>

					<td>₹<%=cs.getAmount()%></td>

					<td>
						<span class="badge badge-completed">
							<%=cs.getStatus()%>
						</span>
					</td>

				</tr>

				<%
					}
				}
				else {
				%>

				<tr>

					<td colspan="7" class="text-center text-danger">
						No Completed Services Found
					</td>

				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>
</html>