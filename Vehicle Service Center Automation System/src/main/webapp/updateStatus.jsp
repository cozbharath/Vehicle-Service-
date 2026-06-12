<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Service Status</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body{
	background:#f4f6f9;
}

.page-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0,0,0,0.08);
	margin:30px auto;
	max-width:1200px;
}

.page-title {
	font-size: 35px;
	font-weight: bold;
	color: #041233;
	margin-bottom: 25px;
}

.section-title{
	font-size:22px;
	font-weight:bold;
	color:#0d6efd;
	margin-top:20px;
	margin-bottom:15px;
	border-bottom:2px solid #dee2e6;
	padding-bottom:8px;
}

.form-label {
	font-weight: 600;
}

.form-control,
.form-select {
	height: 50px;
	border-radius: 10px;
}

textarea.form-control {
	height: 120px;
}

.btn-update {
	height: 55px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 10px;
}
</style>

</head>

<body>

<%@ include file="mechanicNavbar.jsp"%>

<div class="container-fluid">

<div class="page-card">

	<h2 class="page-title">
		<i class="bi bi-tools"></i> Update Service Status
	</h2>

	<form action="UpdateStatusServlet" method="post">

		<div class="section-title">
			Booking Information
		</div>

		<div class="row g-4">

			<div class="col-md-4">

				<label class="form-label">Booking ID</label>

				<input type="number"
					name="bookingId"
					class="form-control"
					placeholder="Enter Booking ID"
					required>

			</div>

			<div class="col-md-4">

				<label class="form-label">Vehicle Number</label>

				<input type="text"
					name="vehicleNumber"
					class="form-control"
					placeholder="Enter Vehicle Number"
					required>

			</div>

			<div class="col-md-4">

				<label class="form-label">Customer Name</label>

				<input type="text"
					name="customerName"
					class="form-control"
					placeholder="Enter Customer Name"
					required>

			</div>

			<div class="col-md-6">

				<label class="form-label">Service Type</label>

				<input type="text"
					name="serviceType"
					class="form-control"
					placeholder="Enter Service Type"
					required>

			</div>

			<div class="col-md-3">

				<label class="form-label">Service Status</label>

				<select name="serviceStatus" class="form-select">

					<option>PENDING</option>
					<option>IN_PROGRESS</option>
					<option>COMPLETED</option>
					<option>DELIVERED</option>

				</select>

			</div>

			<div class="col-md-3">

				<label class="form-label">Completion Date</label>

				<input type="date"
					name="completionDate"
					class="form-control">

			</div>

		</div>

		<div class="section-title">
			Parts Replaced
		</div>

		<div class="row g-4">

			<div class="col-md-4">

				<label class="form-label">Part Name</label>

				<input type="text"
					name="partName"
					class="form-control"
					placeholder="Ex: Engine Oil">

			</div>

			<div class="col-md-2">

				<label class="form-label">Quantity</label>

				<input type="number"
					name="quantity"
					class="form-control"
					value="1">

			</div>

			<div class="col-md-3">

				<label class="form-label">Unit Price (₹)</label>

				<input type="number"
					name="unitPrice"
					class="form-control"
					placeholder="0">

			</div>

			<div class="col-md-3">

				<label class="form-label">Part Total</label>

				<input type="text"
					class="form-control"
					value="Calculated in Bill"
					readonly>

			</div>

		</div>

		<div class="section-title">
			Additional Work Details
		</div>

		<div class="row g-4">

			<div class="col-md-12">

				<label class="form-label">Work Done</label>

				<textarea name="workDone"
					class="form-control"
					placeholder="Describe all work performed on the vehicle"></textarea>

			</div>

			<div class="col-md-12">

				<label class="form-label">Mechanic Remarks</label>

				<textarea name="remarks"
					class="form-control"
					placeholder="Enter mechanic remarks"></textarea>

			</div>

		</div>

		<div class="section-title">
			Invoice Calculation
		</div>

		<div class="row g-4">

			<div class="col-md-4">

				<label class="form-label">Labour Charge</label>

				<input type="text"
					class="form-control"
					value="₹ 600"
					readonly>

			</div>

			<div class="col-md-4">

				<label class="form-label">GST</label>

				<input type="text"
					class="form-control"
					value="5%"
					readonly>

			</div>

			<div class="col-md-4">

				<label class="form-label">Final Amount</label>

				<input type="text"
					class="form-control"
					value="Calculated Automatically"
					readonly>

			</div>

		</div>

		<div class="mt-5">

			<button type="submit"
				class="btn btn-success btn-update w-100">

				<i class="bi bi-check-circle-fill"></i>
				Update Service & Save Work Details

			</button>

		</div>

	</form>

</div>

</div>

</body>
</html>