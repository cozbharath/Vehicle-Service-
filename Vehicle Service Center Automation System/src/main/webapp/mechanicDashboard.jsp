<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.RecentBooking"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mechanic Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.dashboard-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	text-align: center;
}

.dashboard-card:hover {
	transform: translateY(-5px);
	transition: 0.3s;
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
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
	margin-top: 20px;
}

.badge {
	font-size: 14px;
	padding: 8px 12px;
}
</style>

</head>

<body>

	<%@ include file="mechanicNavbar.jsp"%>

	<!-- Cards -->

	<div class="row g-3">

		<div class="col-md-4">

			<div class="dashboard-card">

				<div class="card-icon">
					<i class="bi bi-tools"></i>
				</div>

				<h2>
					<%=session.getAttribute("totalAssignedServices") != null ? session.getAttribute("totalAssignedServices") : 0%>
				</h2>

				<p>Total Assigned Services</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="dashboard-card">

				<div class="card-icon">
					<i class="bi bi-check-circle-fill"></i>
				</div>

				<h2>
					<%=session.getAttribute("completedServices") != null ? session.getAttribute("completedServices") : 0%>
				</h2>

				<p>Completed Services</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="dashboard-card">

				<div class="card-icon">
					<i class="bi bi-clock-history"></i>
				</div>

				<h2>
					<%=session.getAttribute("pendingServices") != null ? session.getAttribute("pendingServices") : 0%>
				</h2>

				<p>Pending Services</p>

			</div>

		</div>

	</div>

	<!-- Table -->

	<div class="table-container">

		<div class="d-flex justify-content-between mb-3">

			<h3>Assigned Vehicle Services</h3>

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

				<%
				List<RecentBooking> assignedServices = (List<RecentBooking>) session.getAttribute("assignedServices");

				if (assignedServices != null && !assignedServices.isEmpty()) {

					for (RecentBooking b : assignedServices) {
				%>

				<tr>

					<td>SV<%=b.getBookingId()%></td>

					<td><%=b.getVehicleNo()%></td>

					<td><%=b.getCustomerName()%></td>

					<td><%=b.getServiceType()%></td>

					<td>
						<%
						String status = b.getStatus();

						if ("PENDING".equals(status)) {
						%> <span class="badge bg-warning text-dark"> Pending </span> <%
 } else if ("IN_PROGRESS".equals(status)) {
 %> <span class="badge bg-primary"> In Progress </span> <%
 } else if ("COMPLETED".equals(status)) {
 %> <span class="badge bg-success"> Completed </span> <%
 } else if ("DELIVERED".equals(status)) {
 %> <span class="badge bg-info"> Delivered </span> <%
 } else {
 %> <span class="badge bg-secondary"> <%=status%>
					</span> <%
 }
 %>

					</td>

				</tr>

				<%
				}
				} else {
				%>

				<tr>
					<td colspan="5" class="text-center text-danger">No Assigned
						Services Found</td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>

	</div>
	<!-- Close main-content from navbar -->

</body>
</html>