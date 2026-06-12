<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Booking</title>

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

.booking-container {
	max-width: 1200px;
	margin: 30px auto;
	padding: 20px;
}

.booking-card {
	background: #fff;
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
}

.page-title {
	font-size: 42px;
	font-weight: bold;
	color: #041233;
	margin-bottom: 25px;
}

.page-title i {
	margin-right: 10px;
	color: #2563eb;
}

.section-title {
	font-size: 22px;
	font-weight: bold;
	color: #2563eb;
	border-bottom: 2px solid #e5e7eb;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.form-label {
	font-size: 16px;
	font-weight: 600;
}

.form-control, .form-select {
	height: 52px;
	border-radius: 10px;
	font-size: 16px;
}

textarea.form-control {
	height: 150px;
	resize: none;
}

.btn-save {
	height: 55px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 10px;
	background: #2563eb;
	border: none;
}

.btn-save:hover {
	background: #1d4ed8;
}

.btn-reset {
	height: 55px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 10px;
}
</style>

</head>

<body>

	<%@ include file="receptionistNavbar.jsp"%>

	<div class="booking-container">

		<div class="booking-card">

			<h2 class="page-title">
				<i class="bi bi-calendar-check-fill"></i> Service Booking
			</h2>

			<div class="section-title">
				Booking Information
			</div>

			<form action="BookingServlet" method="post">

				<div class="row g-4">

					<div class="col-md-6">
						<label class="form-label">Customer ID</label>

						<input type="number"
							name="customerId"
							class="form-control"
							placeholder="Enter Customer ID"
							required>
					</div>

					<div class="col-md-6">
						<label class="form-label">Vehicle ID</label>

						<input type="number"
							name="vehicleId"
							class="form-control"
							placeholder="Enter Vehicle ID"
							required>
					</div>

					<div class="col-md-6">
						<label class="form-label">Employee ID</label>

						<input type="text"
							name="employeeId"
							class="form-control"
							placeholder="Assigned Mechanic ID"
							required>
					</div>

					<div class="col-md-6">
						<label class="form-label">Booking Date</label>

						<input type="date"
							name="bookingDate"
							class="form-control"
							required>
					</div>

					<div class="col-md-6">

						<label class="form-label">Service Type</label>

						<select name="serviceType"
							class="form-select"
							required>

							<option value="">Select Service</option>

							<option>General Service</option>
							<option>Oil Change</option>
							<option>Brake Service</option>
							<option>Engine Repair</option>
							<option>Wheel Alignment</option>
							<option>Battery Replacement</option>
							<option>Clutch Repair</option>
							<option>Suspension Repair</option>
							<option>AC Service</option>

						</select>

					</div>

					<div class="col-md-6">

						<label class="form-label">Service Status</label>

						<select name="serviceStatus"
							class="form-select">

							<option selected>PENDING</option>
							<option>IN_PROGRESS</option>
							<option>COMPLETED</option>
							<option>DELIVERED</option>

						</select>

					</div>

					<div class="col-md-12">

						<label class="form-label">
							Problem Description
						</label>

						<textarea
							name="problemDescription"
							class="form-control"
							placeholder="Describe customer vehicle problem..."
							required></textarea>

					</div>

					<div class="col-md-6">

						<button type="submit"
							class="btn btn-primary btn-save w-100">

							<i class="bi bi-save-fill"></i>
							Save Booking

						</button>

					</div>

					<div class="col-md-6">

						<button type="reset"
							class="btn btn-secondary btn-reset w-100">

							<i class="bi bi-arrow-clockwise"></i>
							Reset Form

						</button>

					</div>

				</div>

			</form>

		</div>

	</div>

</body>
</html>