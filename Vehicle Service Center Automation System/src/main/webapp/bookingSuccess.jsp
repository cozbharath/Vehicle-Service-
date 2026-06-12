<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Success</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.success-card {
	max-width: 700px;
	margin: 100px auto;
	background: white;
	padding: 40px;
	border-radius: 20px;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.success-icon {
	font-size: 90px;
	color: green;
}
</style>

</head>
<body>

	<div class="container">

		<div class="success-card">

			<i class="bi bi-check-circle-fill success-icon"></i>

			<h2 class="text-success mt-3">Service Booking Added Successfully
			</h2>

			<p class="text-muted">The service booking has been registered
				successfully.</p>

			<div class="mt-4">

				<a href="serviceBooking.jsp" class="btn btn-primary btn-lg"> <i
					class="bi bi-plus-circle"></i> Add Another Booking

				</a> <a href="receptionistDashboard.jsp"
					class="btn btn-success btn-lg ms-2"> <i
					class="bi bi-house-fill"></i> Dashboard

				</a>

			</div>

		</div>

	</div>

</body>
</html>