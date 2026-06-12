<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.RecentBooking"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>VSMS</title>

<!-- Bootstrap CDN -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

/* Body */
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

/* Main Content */
.main-content {
	margin-left: 250px;
	padding: 20px;
}

/* Topbar */
.topbar {
	background: white;
	padding: 15px 25px;
	border-radius: 10px;
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* Cards */
.dashboard-card {
	border: none;
	border-radius: 15px;
	padding: 20px;
	color: white;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Card Colors */
.bg-blue {
	background: #2563eb;
}

.bg-green {
	background: #16a34a;
}

.bg-orange {
	background: #ea580c;
}

.bg-red {
	background: #dc2626;
}

/* Table */
.table-container {
	background: white;
	margin-top: 30px;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
}

/* Responsive */
@media ( max-width :768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.main-content {
		margin-left: 0;
	}
}
</style>

</head>

<body>
	<%@ include file="adminNavbar.jsp"%>
	<!-- Dashboard Cards -->

	<div class="row mt-4">

		<div class="col-md-3 mb-3">

			<div class="dashboard-card bg-blue">

				<h5>Total Customers</h5>

				<h2>
					<%=session.getAttribute("totalCustomers") != null ? session.getAttribute("totalCustomers") : 0%>
				</h2>

			</div>

		</div>

		<div class="col-md-3 mb-3">

			<div class="dashboard-card bg-green">

				<h5>Total Mechanics</h5>

				<h2>
					<%=session.getAttribute("totalMechanics") != null ? session.getAttribute("totalMechanics") : 0%>
				</h2>

			</div>

		</div>

		<div class="col-md-3 mb-3">

			<div class="dashboard-card bg-orange">

				<h5>Bookings Today</h5>

				<h2>
					<%=session.getAttribute("bookingsToday") != null ? session.getAttribute("bookingsToday") : 0%>
				</h2>

			</div>

		</div>

		<div class="col-md-3 mb-3">

			<div class="dashboard-card bg-red">

				<h5>Total Revenue</h5>

				<h2>
					₹<%=session.getAttribute("totalRevenue") != null ? session.getAttribute("totalRevenue") : 0%>
				</h2>

			</div>

		</div>

	</div>

	<!-- Recent Bookings -->

	<div class="table-container">

		<h4 class="mb-4">Recent Service Bookings</h4>

		<table class="table table-bordered table-hover">

			<thead class="table-dark">

				<tr>

					<th>Booking ID</th>
					<th>Customer</th>
					<th>Vehicle</th>
					<th>Mechanic</th>
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

					<td>B<%=b.getBookingId()%></td>

					<td><%=b.getCustomerName()%></td>

					<td><%=b.getVehicleNo()%></td>

					<td><%=b.getMechanicName()%></td>

					<td>
						<%
						String status = b.getStatus();

						if ("PENDING".equals(status)) {
						%> <span class="badge bg-danger">Pending</span> <%
 } else if ("IN_PROGRESS".equals(status)) {
 %> <span class="badge bg-warning text-dark">In Progress</span> <%
 } else if ("COMPLETED".equals(status)) {
 %> <span class="badge bg-success">Completed</span> <%
 } else if ("DELIVERED".equals(status)) {
 %> <span class="badge bg-info">Delivered</span> <%
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

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>