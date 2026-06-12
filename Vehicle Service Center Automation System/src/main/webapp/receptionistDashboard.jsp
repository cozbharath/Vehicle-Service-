<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.RecentBooking"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Receptionist Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.dashboard-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.08);
	transition: .3s;
	height: 100%;
}

.dashboard-card:hover {
	transform: translateY(-5px);
}

.card-icon {
	font-size: 45px;
	color: #2563eb;
	margin-bottom: 15px;
}

.table-container {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.08);
	margin-top: 25px;
}

.table thead {
	background: #1f2937;
	color: white;
}

.count-text {
	font-size: 42px;
	font-weight: bold;
	color: #1f2937;
}

.section-title {
	font-weight: 600;
	margin-bottom: 20px;
}
</style>

</head>

<body>

	<%@ include file="receptionistNavbar.jsp"%>

	<div class="container-fluid mt-4">

		<div class="row g-4">

			<!-- Total Bookings -->
			<div class="col-md-4">

				<div class="dashboard-card">

					<div class="card-icon">
						<i class="bi bi-calendar-check-fill"></i>
					</div>

					<div class="count-text">
						<%=session.getAttribute("totalBookings") != null ? session.getAttribute("totalBookings") : 0%>
					</div>

					<p class="mt-2">Total Bookings</p>

				</div>

			</div>

			<!-- Total Customers -->
			<div class="col-md-4">

				<div class="dashboard-card">

					<div class="card-icon">
						<i class="bi bi-people-fill"></i>
					</div>

					<div class="count-text">
						<%=session.getAttribute("totalCustomers") != null ? session.getAttribute("totalCustomers") : 0%>
					</div>

					<p class="mt-2">Total Customers</p>

				</div>

			</div>

			<!-- Pending Services -->
			<div class="col-md-4">

				<div class="dashboard-card">

					<div class="card-icon">
						<i class="bi bi-clock-history"></i>
					</div>

					<div class="count-text">
						<%=session.getAttribute("pendingServices") != null ? session.getAttribute("pendingServices") : 0%>
					</div>

					<p class="mt-2">Pending Services</p>

				</div>

			</div>

		</div>

		<!-- Recent Service Bookings -->

		<div class="table-container">

			<h4 class="section-title">Recent Service Bookings</h4>

			<table class="table table-bordered table-hover align-middle">

				<thead>

					<tr>
						<th>Booking ID</th>
						<th>Customer Name</th>
						<th>Vehicle Number</th>
						<th>Service Type</th>
						<th>Status</th>
					</tr>

				</thead>

				<tbody>

					<%
					List<RecentBooking> recentBookings = (List<RecentBooking>) session.getAttribute("recentBookings");

					if (recentBookings != null && !recentBookings.isEmpty()) {

						for (RecentBooking b : recentBookings) {
					%>

					<tr>
						<td>BK<%=b.getBookingId()%></td>
						<td><%=b.getCustomerName()%></td>
						<td><%=b.getVehicleNo()%></td>
						<td><%=b.getServiceType()%></td>

						<td>
							<%
							String status = b.getStatus();

							if ("PENDING".equals(status)) {
							%> <span class="badge bg-warning text-dark">Pending</span> <%
 } else if ("IN_PROGRESS".equals(status)) {
 %> <span class="badge bg-primary">In Progress</span> <%
 } else if ("COMPLETED".equals(status)) {
 %> <span class="badge bg-success">Completed</span> <%
 } else if ("DELIVERED".equals(status)) {
 %> <span class="badge bg-info">Delivered</span> <%
 } else {
 %> <span class="badge bg-secondary"><%=status%></span> <%
 }
 %>
						</td>

					</tr>

					<%
					}
					} else {
					%>

					<tr>
						<td colspan="5" class="text-center text-danger">No Recent
							Bookings Found</td>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>

		</div>

	</div>

</body>
</html>