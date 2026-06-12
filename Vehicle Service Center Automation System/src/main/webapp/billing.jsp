<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Billing Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background-color: #f5f7fb;
}

.billing-card {
	background: white;
	padding: 25px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
	transition: .3s;
}

.billing-card:hover {
	transform: translateY(-5px);
}

.billing-card i {
	font-size: 45px;
	color: #2563eb;
	margin-bottom: 10px;
}

.billing-table {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
	margin-top: 25px;
}

.modal-header {
	background: #2563eb;
	color: white;
}

.page-title {
	font-size: 34px;
	font-weight: bold;
	color: #041233;
	margin-bottom: 20px;
}
</style>

</head>

<body>

```
<%@ include file="receptionistNavbar.jsp"%>

<div class="container-fluid mt-4">

	<h2 class="page-title">
		<i class="bi bi-receipt-cutoff"></i>
		Billing Management
	</h2>

	<!-- Dashboard Cards -->

	<div class="row g-4">

		<div class="col-md-4">

			<div class="billing-card">

				<i class="bi bi-file-earmark-text"></i>

				<h2>Invoices</h2>

				<p>Generate Customer Bills</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="billing-card">

				<i class="bi bi-currency-rupee"></i>

				<h2>₹600</h2>

				<p>Default Labour Charge</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="billing-card">

				<i class="bi bi-percent"></i>

				<h2>5%</h2>

				<p>GST Applicable</p>

			</div>

		</div>

	</div>

	<!-- Invoice Section -->

	<div class="billing-table">

		<div
			class="d-flex justify-content-between align-items-center mb-3">

			<h3>
				<i class="bi bi-table"></i>
				Generate E-Bill
			</h3>

			<button class="btn btn-primary"
				data-bs-toggle="modal"
				data-bs-target="#billModal">

				<i class="bi bi-plus-circle"></i>
				Generate E-Bill

			</button>

		</div>

		<table class="table table-bordered table-hover">

			<thead class="table-dark">

				<tr>

					<th>Bill ID</th>
					<th>Customer Name</th>
					<th>Vehicle Number</th>
					<th>Service Type</th>
					<th>Amount</th>
					<th>Invoice</th>

				</tr>

			</thead>

			<tbody>

				<tr>

					<td colspan="6" class="text-center">

						No Bills Generated Yet

					</td>

				</tr>

			</tbody>

		</table>

	</div>

</div>

<!-- Generate Invoice Modal -->

<div class="modal fade" id="billModal" tabindex="-1">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">

				<h5 class="modal-title">

					<i class="bi bi-receipt"></i>
					Generate E-Bill

				</h5>

				<button type="button"
					class="btn-close btn-close-white"
					data-bs-dismiss="modal"></button>

			</div>

			<form action="GenerateBillServlet" method="post">

				<div class="modal-body">

					<div class="mb-3">

						<label class="form-label">

							Booking ID

						</label>

						<input type="number"
							name="bookingId"
							class="form-control"
							required>

					</div>

					<div class="alert alert-info">

						Labour Charge :
						<strong>₹600</strong>

						<br>

						GST :
						<strong>5%</strong>

					</div>

				</div>

				<div class="modal-footer">

					<button type="button"
						class="btn btn-secondary"
						data-bs-dismiss="modal">

						Close

					</button>

					<button type="submit"
						class="btn btn-success">

						<i class="bi bi-file-earmark-pdf"></i>

						Generate Invoice

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
