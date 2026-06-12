<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.Vehicle"%>

<%
List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background-color: #f5f7fb;
}

.vehicle-container {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
	margin-top: 20px;
}

.vehicle-container h2 {
	font-weight: bold;
	color: #041233;
}

.stats-card {
	background: white;
	padding: 20px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
}

.stats-card i {
	font-size: 40px;
	color: #0d6efd;
}

.stats-card h3 {
	font-weight: bold;
	margin-top: 10px;
}

.table th {
	vertical-align: middle;
	text-align: center;
}

.table td {
	vertical-align: middle;
	text-align: center;
}

.badge {
	padding: 8px 12px;
	font-size: 14px;
}

.modal-header {
	background: #0d6efd;
	color: white;
}
</style>

</head>

<body>

	<%@ include file="receptionistNavbar.jsp"%>

	<%
	String msg = request.getParameter("msg");

	if (msg != null) {
		if (msg.equals("success")) {
	%>

	<div class="alert alert-success alert-dismissible fade show mt-3"
		role="alert">
		<i class="bi bi-check-circle-fill"></i> Vehicle Details Added
		Successfully!
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	</div>

	<%
	} else if (msg.equals("fail")) {
	%>

	<div class="alert alert-danger alert-dismissible fade show mt-3"
		role="alert">
		<i class="bi bi-exclamation-triangle-fill"></i> Failed to Add Vehicle
		Details!
		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	</div>

	<%
	}
	}
	%>

	<!-- Statistics -->

	<div class="row mt-3">

		<div class="col-md-4">

			<div class="stats-card">

				<i class="bi bi-car-front-fill"></i>

				<h3>
					<%=request.getAttribute("totalVehicles")%>
				</h3>

				<p>Total Vehicles</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="stats-card">

				<i class="bi bi-tools"></i>

				<h3>
					<%=request.getAttribute("vehiclesInService")%>
				</h3>

				<p>Vehicles in Service</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="stats-card">

				<i class="bi bi-exclamation-triangle-fill"></i>

				<h3>
					<%=request.getAttribute("serviceDue")%>
				</h3>

				<p>Service Due</p>

			</div>

		</div>

	</div>

	<!-- Vehicle Details -->

	<div class="vehicle-container">

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2>

				<i class="bi bi-car-front-fill"></i> Vehicle Details

			</h2>

			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#vehicleModal">

				<i class="bi bi-plus-circle"></i> Add Vehicle

			</button>

		</div>

		<table class="table table-bordered table-hover">

			<thead class="table-dark">

				<tr>

					<th>Vehicle ID</th>
					<th>Vehicle Number</th>
					<th>Owner Name</th>
					<th>Brand</th>
					<th>Model</th>
					<th>Fuel Type</th>

				</tr>

			</thead>

			<tbody>

				<%
				if (vehicleList != null && !vehicleList.isEmpty()) {

					for (Vehicle v : vehicleList) {
				%>

				<tr>

					<td><%=v.getVehicleId()%></td>
					<td><%=v.getVehicleNo()%></td>
					<td><%=v.getCustomerId()%></td>
					<td><%=v.getBrand()%></td>
					<td><%=v.getModel()%></td>
					<td><%=v.getFuelType()%></td>

				</tr>

				<%
				}
				} else {
				%>

				<tr>
					<td colspan="7" class="text-center text-danger">No Vehicle
						Records Found</td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>

	</div>

	<!-- Add Vehicle Modal -->

	<div class="modal fade" id="vehicleModal" tabindex="-1">

		<div class="modal-dialog modal-lg">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title">

						<i class="bi bi-car-front-fill"></i> Add Vehicle

					</h5>

					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal"></button>

				</div>

				<form action="VehicleServlet" method="post">

					<div class="modal-body">

						<div class="row">

							<div class="col-md-6 mb-3">

								<label class="form-label">Customer ID</label> <input
									type="number" name="customerId" class="form-control" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Vehicle Number</label> <input
									type="text" name="vehicleNo" class="form-control"
									placeholder="TS09AB1234" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Brand</label> <input type="text"
									name="brand" class="form-control" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Model</label> <input type="text"
									name="model" class="form-control" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Fuel Type</label> <select
									name="fuelType" class="form-select">

									<option value="Petrol">Petrol</option>

									<option value="Diesel">Diesel</option>

									<option value="CNG">CNG</option>

									<option value="Electric">Electric</option>

								</select>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Manufacturing Year</label> <input
									type="number" name="year" class="form-control" min="2000"
									max="2035" required>

							</div>

						</div>

					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>

						<button type="submit" class="btn btn-success">

							<i class="bi bi-save-fill"></i> Save Vehicle

						</button>

					</div>

				</form>

			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>